import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_indoor_localization_app/services/imu_service.dart';
import 'package:flutter_indoor_localization_app/services/wifi_service.dart';
import 'package:flutter_indoor_localization_app/services/database_service.dart';
import 'package:flutter_indoor_localization_app/screens/review_screen.dart';
import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';
import 'package:flutter_indoor_localization_app/utils/constants.dart';
import 'package:flutter_indoor_localization_app/services/ground_truth_service.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late final IMUService imuService;
  late final WiFiService wifiService;
  late final DatabaseService dbService;
  late final GroundTruthService gtService;
  
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
    dbService = context.read<DatabaseService>();
    gtService = context.read<GroundTruthService>();

    imuService.startListening();
    imuService.addListener(_throttledUiUpdate);
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
  void _startRecording() {
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
    final String currentTrajId = 'traj_${DateTime.now().millisecondsSinceEpoch}';
    
    try {
      imuService.startRecording();
      wifiService.startRecording();
      gtService.initializeSession(_selectedTrajectory!);
    } catch(e) {
      setState(() => isRecording = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error starting recording: $e'), 
                backgroundColor: Colors.red),
      );
      return;
    }
    
    final int startTimestamp = DateTime.now().millisecondsSinceEpoch;
    final String initialHeading = _selectedTrajectory!.segments.first.direction.name;
    
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
  
  void _stopRecording() {
    elapsedTimer?.cancel();
    elapsedTimer = null;
    
    final imuReadings = imuService.stopRecording();
    final wifiScans = wifiService.stopRecording();
    
    setState(() => isRecording = false);
    gtService.clearSession();
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ReviewScreen(
          imuReadings: imuReadings,
          wifiScans: wifiScans,
        ),
      ),
    );
  }
  
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
              if (isRecording)
                Text(
                  'Elapsed: _formatDuration(elapsedSeconds)',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              
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
              
              Text('IMU samples: imuService.recordedReadings.length} ✓'),
              Text('WiFi scans: wifiService.recordedScans.length} ✓'),
              
              const Spacer(),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!isRecording)
                    ElevatedButton(
                      onPressed: _startRecording,
                      child: const Text('START RECORDING'),
                    )
                  else ...[
                    ElevatedButton(
                      onPressed: _showWaypointDialog,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text('MARK WAYPOINT'),
                    ),
                    ElevatedButton(
                      onPressed: _stopRecording,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('STOP'),
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
  
  void _showWaypointDialog() {
    // Left empty for your upcoming manual/automatic GT integration mapping
  }
  
  String _formatDuration(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }
  
  @override
  void dispose() {
    imuService.removeListener(_throttledUiUpdate);
    imuService.stopListening();
    elapsedTimer?.cancel(); // Critical to prevent background execution memory leaks
    super.dispose();
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