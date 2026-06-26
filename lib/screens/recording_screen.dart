import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_indoor_localization_app/services/imu_service.dart';
import 'package:flutter_indoor_localization_app/services/wifi_service.dart';
import 'package:flutter_indoor_localization_app/screens/review_screen.dart';
import 'package:flutter_indoor_localization_app/services/csv_export_service.dart';
import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';
import 'package:flutter_indoor_localization_app/utils/constants.dart';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';
import 'package:flutter_indoor_localization_app/services/ground_truth_service.dart';
import 'package:share_plus/share_plus.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late final IMUService imuService;
  late final WiFiService wifiService;
  late final GroundTruthService gtService;
  bool _isExporting = false;
  
  bool isRecording = false;
  int elapsedSeconds = 0;
  Timer? elapsedTimer;
  TrajectoryBlueprint? _selectedTrajectory;
  
  // High-frequency UI throttle mechanism
  int _lastUiUpdateTs = 0;

  @override
  void initState() {
    super.initState();
    // Use Provider to fetch dependencies safely
    imuService = context.read<IMUService>();
    wifiService = context.read<WiFiService>();
    gtService = context.read<GroundTruthService>();

    imuService.startListening();
    imuService.addListener(_throttledUiUpdate);
    gtService.addListener(_throttledUiUpdate);
  }

  /// Throttles UI updates to ~10Hz (every 100ms) instead of 50Hz.
  /// This saves massive CPU cycles while keeping the screen readable.
  void _throttledUiUpdate() {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastUiUpdateTs > 100) {
      _lastUiUpdateTs = now;
      if (mounted) setState(() {});
    }
  }
  
  /// Activates recording mode across IMU and Wi-Fi services, resets the elapsed counter.
  /// Starts a 1-second background timer to update the duration on screen.
  Future <void> _startRecording() async {
    if (_selectedTrajectory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please, select the trajectory first.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => isRecording = true);

    try {
      // Request WiFi permission before recording
      final hasWiFiPermission = await wifiService.requestPermissions();
      if (!hasWiFiPermission) {
        throw Exception('WiFi permissions denied. Cannot record scans.');
      }
      
      // imuService.startRecording();
      wifiService.startRecording();
      // gtService.initializeSession(_selectedTrajectory!);
    } catch(e) {
      setState(() => isRecording = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error starting recording: $e'), 
                backgroundColor: Colors.red),
      );
      return;
    }
    
    elapsedSeconds = 0;
    elapsedTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() => elapsedSeconds++);
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recording started')),
    );
  }
  
  Future<void> _stopRecording() async {
    if (_isExporting) return;

    elapsedTimer?.cancel();
    elapsedTimer = null;

    final imuReadings = imuService.stopRecording();
    final wifiScans = wifiService.stopRecording();
    final pathComplete = gtService.pathComplete;
    final List<GTWaypoint> gtWaypoints = gtService.stopSession();
    final trajectoryName = _selectedTrajectory?.name ?? 'session';

    setState(() {
      isRecording = false;
      _isExporting = true;
    });

    try {
      final exportResult = await CsvExportService.exportSession(
        sessionLabel: trajectoryName,
        imuReadings: imuReadings,
        wifiScans: wifiScans,
        gtWaypoints: gtWaypoints,
      );

      if (!mounted) return;

      if (exportResult != null){
        final files = [
          XFile(exportResult.imuPath),
          XFile(exportResult.wifiPath),
          XFile(exportResult.trajectoryPath),
        ];
        await SharePlus.instance.share(
          ShareParams(
            files: files, 
            text: 'All input readings from the session: $trajectoryName'
          )
        );
      }

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReviewScreen(
            imuReadings: imuReadings,
            wifiScans: wifiScans,
            gtWaypoints: gtWaypoints,
            exportResult: exportResult,
            pathComplete: pathComplete,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to export CSV files: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  Future<void> _calibrateImu() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Expanded(child: Text('Hold the phone still…')),
          ],
        ),
      ),
    );

    final result = await imuService.calibrate();

    if (!mounted) return;
    Navigator.of(context).pop(); // close the dialog

    final msg = result.ok
        ? 'Calibrated (${result.samples} samples) — '
            'gyro bias (${result.gyroBiasX.toStringAsFixed(4)}, '
            '${result.gyroBiasY.toStringAsFixed(4)}, '
            '${result.gyroBiasZ.toStringAsFixed(4)}), '
            '|a|=${result.restAccelNorm.toStringAsFixed(2)} m/s²'
        : 'Calibration failed — make sure sensors are running.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: result.ok ? Colors.green : Colors.red,
      ),
    );
  }

  void _markTurn() {
    if (!isRecording || gtService.pathComplete) return;

    gtService.nextSegment();

    final segment = gtService.currentSegment;
    final message = gtService.pathComplete
        ? 'Path complete — ${_formatWaypointCount(gtService.waypointCount)} GT points'
        : segment != null
            ? 'Turn recorded → walk ${segment.fromNode} → ${segment.toNode} '
              '(${segment.direction.name}, ${segment.distanceInMeters}m)'
            : 'Turn recorded';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  String _formatWaypointCount(int count) => '$count waypoint${count == 1 ? '' : 's'}';
  
  @override
  Widget build(BuildContext context) {
    final readings = imuService.getCurrentReadings();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(isRecording ? 'RECORDING' : 'Ready to Record'),
        backgroundColor: isRecording ? Colors.red : Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (isRecording) ...[
                Text(
                  'Elapsed: ${_formatDuration(elapsedSeconds)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                _GroundTruthStatusCard(gtService: gtService),
              ],
              
              DropdownButtonFormField<TrajectoryBlueprint>(
                initialValue: _selectedTrajectory,
                hint: const Text('Select the Ground Truth (GT)'),
                isExpanded: true,
                onChanged: isRecording 
                    ? null 
                    : (TrajectoryBlueprint? newValue) {
                        setState(() {
                          _selectedTrajectory = newValue;
                        });
                      },
                items: AppConstants.presetTrajectories.map((TrajectoryBlueprint trajectory) {
                  return DropdownMenuItem<TrajectoryBlueprint>(
                    value: trajectory,
                    child: Text('${trajectory.name} (Start: ${trajectory.startX}, ${trajectory.startY})'),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  enabled: !isRecording,
                ),
              ),

              const SizedBox(height: 20),
              
              // Extracted out to minimize rebuilding overhead
              _SensorStatusCard(readings: readings),
              
              const SizedBox(height: 20),
              
              Text('IMU samples: ${imuService.recordedReadings.length} ✓'),
              Text('WiFi scans: ${wifiService.recordedScans.length} ✓'),
              if (isRecording)
                Text('GT waypoints: ${gtService.waypointCount} ✓'),
              
              const Spacer(),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!isRecording) ...[
                    ElevatedButton(
                      onPressed: _calibrateImu,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      child: Text(imuService.isCalibrated
                          ? 'RECALIBRATE'
                          : 'CALIBRATE'),
                    ),
                    ElevatedButton(
                      onPressed: _startRecording,
                      child: const Text('START RECORDING'),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: gtService.pathComplete ? null : _markTurn,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: Text(gtService.pathComplete ? 'PATH DONE' : 'TURN'),
                    ),
                    ElevatedButton(
                      onPressed: _isExporting ? null : _stopRecording,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text(_isExporting ? 'EXPORTING...' : 'STOP'),
                    ),
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  String _formatDuration(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }
  
  @override
  void dispose() {
    imuService.removeListener(_throttledUiUpdate);
    gtService.removeListener(_throttledUiUpdate);
    imuService.stopListening();
    elapsedTimer?.cancel(); // Critical to prevent background execution memory leaks
    super.dispose();
  }
}

class _GroundTruthStatusCard extends StatelessWidget {
  final GroundTruthService gtService;

  const _GroundTruthStatusCard({required this.gtService});

  @override
  Widget build(BuildContext context) {
    final segment = gtService.currentSegment;
    if (segment == null) return const SizedBox.shrink();

    return Card(
      color: Colors.orange.shade50,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gtService.pathComplete ? 'Ground truth: path complete' : 'Current segment',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            if (!gtService.pathComplete) ...[
              Text('${segment.fromNode} → ${segment.toNode}'),
              Text('Heading: ${segment.direction.name}, length: ${segment.distanceInMeters} m'),
            ],
            Text('Generated GT points: ${gtService.waypointCount}'),
          ],
        ),
      ),
    );
  }
}

/// Extracted stateless child widget so the text render properties are isolated
class _SensorStatusCard extends StatelessWidget {
  final Map<String, double> readings;

  const _SensorStatusCard({Key? key, required this.readings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sensor Status:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Accel: (${readings['ax']?.toStringAsFixed(2)}, '
                '${readings['ay']?.toStringAsFixed(2)}, '
                '${readings['az']?.toStringAsFixed(2)}) m/s²'),
            Text('Gyro:  (${readings['gx']?.toStringAsFixed(2)}, '
                '${readings['gy']?.toStringAsFixed(2)}, '
                '${readings['gz']?.toStringAsFixed(2)}) rad/s'),
            Text('Mag:   (${readings['mx']?.toStringAsFixed(1)}, '
                '${readings['my']?.toStringAsFixed(1)}, '
                '${readings['mz']?.toStringAsFixed(1)}) μT'),
          ],
        ),
      ),
    );
  }
}