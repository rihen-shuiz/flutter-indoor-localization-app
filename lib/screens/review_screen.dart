import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';
import 'package:flutter_indoor_localization_app/services/csv_export_service.dart';

class ReviewScreen extends StatelessWidget {
  final List<dynamic> imuReadings;
  final List<dynamic> wifiScans;
  final List<GTWaypoint> gtWaypoints;
  final SessionExportResult exportResult;
  final bool pathComplete;

  const ReviewScreen({
    Key? key,
    required this.imuReadings,
    required this.wifiScans,
    required this.gtWaypoints,
    required this.exportResult,
    required this.pathComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Collection Run'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
            const SizedBox(height: 16),
            Text(
              'Data Collection Complete!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            if (!pathComplete) ...[
              const SizedBox(height: 12),
              const Card(
                color: Color(0x33FF9800),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Path was not fully completed before stop. CSV files were still exported.',
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IMU samples: ${exportResult.imuCount}'),
                    const SizedBox(height: 8),
                    Text('Wi-Fi readings: ${exportResult.wifiCount}'),
                    const SizedBox(height: 8),
                    Text('Trajectory waypoints: ${exportResult.trajectoryCount}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exported CSV files',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    _ExportPathRow(label: 'Folder', path: exportResult.directoryPath),
                    const SizedBox(height: 8),
                    _ExportPathRow(label: 'IMU', path: exportResult.imuPath),
                    const SizedBox(height: 8),
                    _ExportPathRow(label: 'Wi-Fi', path: exportResult.wifiPath),
                    const SizedBox(height: 8),
                    _ExportPathRow(label: 'Trajectory', path: exportResult.trajectoryPath),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Record Another Session'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExportPathRow extends StatelessWidget {
  final String label;
  final String path;

  const _ExportPathRow({required this.label, required this.path});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 88,
          child: Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: SelectableText(path, style: const TextStyle(fontSize: 13)),
        ),
        IconButton(
          tooltip: 'Copy path',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: path));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label path copied')),
            );
          },
          icon: const Icon(Icons.copy, size: 18),
        ),
      ],
    );
  }
}
