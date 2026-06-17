import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  // Using List<dynamic> here as placeholders. Replace with your actual IMU/WiFi data models later.
  final List<dynamic> imuReadings;
  final List<dynamic> wifiScans;

  const ReviewScreen({
    Key? key,
    required this.imuReadings,
    required this.wifiScans,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
              const SizedBox(height: 24),
              Text(
                'Data Collection Complete!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('IMU Samples Captured: ${imuReadings.length}', 
                        style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text('Wi-Fi Scans Captured: ${wifiScans.length}', 
                        style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Record Another Session'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}