import 'dart:math';
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';
import 'package:flutter_indoor_localization_app/models/wifi_reading.dart';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';

class DataQualityValidator {
  static DataQualityScore validateTrajectory({
    required List<IMUReading> imuReadings,
    required List<WiFiReading> wifiReadings, // Fixed type and naming convention
    required List<GTWaypoint> gtWaypoints,
  }) {
    int score = 100;
    final List<String> issues = [];

    // Zero-check safety boundaries
    if (imuReadings.isEmpty) {
      return const DataQualityScore(
        score: 0, 
        issues: ['Critical Error: IMU dataset is completely empty'], 
        isValid: false,
      );
    }

    // --- CHECK 1: High-Performance IMU Frequency & Jitter Analysis ---
    double totalGap = 0;
    double maxGap = 0;
    int jitterCount = 0;
    
    for (int i = 0; i < imuReadings.length - 1; i++) {
      final gap = (imuReadings[i + 1].ts - imuReadings[i].ts).toDouble();
      totalGap += gap;
      if (gap > maxGap) maxGap = gap;
      
      // Target is ~6.67ms (150Hz). If a gap exceeds 20ms, a frame drop occurred.
      if (gap > 20.0) {
        jitterCount++;
      }
    }
    
    final avgGap = totalGap / (imuReadings.length - 1);
    final calculatedHz = 1000.0 / avgGap;

    if (avgGap < 4.0 || avgGap > 12.0) {
      score -= 20;
      issues.add('IMU frequency unstable: ${calculatedHz.toStringAsFixed(1)} Hz (Target: ~150Hz)');
    }
    if (jitterCount > (imuReadings.length * 0.05)) {
      score -= 15;
      issues.add('Severe IMU packet jitter: detected $jitterCount massive gaps (Max gap: ${maxGap.toStringAsFixed(0)}ms)');
    }

    // --- CHECK 2: WiFi Coverage Density ---
    if (wifiReadings.length < 3) {
      score -= 30;
      issues.add('Insufficient WiFi coverage: captured only ${wifiReadings.length} readings');
    }

    // --- CHECK 3: Ground Truth Alignment & Path Continuity ---
    final int trajectoryDurationMs = imuReadings.last.ts - imuReadings.first.ts;
    final double durationMins = trajectoryDurationMs / 1000.0 / 60.0;

    if (gtWaypoints.length < 2) {
      score -= 35;
      issues.add('Invalid Ground Truth: Trajectory requires at least 2 anchor waypoints (Start/End)');
    } else if (durationMins > 0.05) {
      final density = gtWaypoints.length / durationMins;
      if (density < 0.8) {
        score -= 10;
        issues.add('Sparse ground truth checkpoints: (${density.toStringAsFixed(1)} nodes/min)');
      }
    }

    // --- CHECK 4: Orientation-Agnostic Gravity Norm Check ---
    double sumMagnitude = 0;
    for (final r in imuReadings) {
      sumMagnitude += sqrt((r.ax * r.ax) + (r.ay * r.ay) + (r.az * r.az));
    }
    final meanGravityNorm = sumMagnitude / imuReadings.length;
    
    if (meanGravityNorm < 9.5 || meanGravityNorm > 10.3) {
      score -= 20;
      issues.add('Accelerometer scaling error: mean gravity norm is ${meanGravityNorm.toStringAsFixed(2)} m/s² (Expected ~9.81)');
    }

    // --- CHECK 5: Proportional WiFi RSSI Anomaly Ratio ---
    int corruptWifiReadings = 0;
    for (final reading in wifiReadings) {
      if (reading.rssi < -100 || reading.rssi > -15) {
        corruptWifiReadings++;
      }
    }
    if (corruptWifiReadings > 0) {
      final double corruptRatio = corruptWifiReadings / wifiReadings.length;
      final deduction = (corruptRatio * 25).round().clamp(5, 25);
      score -= deduction;
      issues.add('Corrupt Wi-Fi signal values: ${(corruptRatio * 100).toStringAsFixed(1)}% of readings out of range');
    }

    // --- CHECK 6: Chronological Synchronization Matrix ---
    if (wifiReadings.isNotEmpty) {
      final bool logsOverlap = (wifiReadings.first.ts >= imuReadings.first.ts) && 
                              (wifiReadings.last.ts <= imuReadings.last.ts);
      if (!logsOverlap) {
        score -= 30;
        issues.add('Critical Time Sync Error: Wi-Fi sample timestamps do not align inside IMU timeline boundaries');
      }
    }

    return DataQualityScore(
      score: score.clamp(0, 100),
      issues: issues,
      isValid: score >= 65,
    );
  }
}

// Immutable, clean data capsule for scoring responses
class DataQualityScore {
  final int score;
  final List<String> issues;
  final bool isValid;

  const DataQualityScore({
    required this.score,
    required this.issues,
    required this.isValid,
  });
}