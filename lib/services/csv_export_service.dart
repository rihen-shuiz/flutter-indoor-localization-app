import 'dart:io';

import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';
import 'package:flutter_indoor_localization_app/models/wifi_reading.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class SessionExportResult {
  final String directoryPath;
  final String imuPath;
  final String wifiPath;
  final String trajectoryPath;
  final int imuCount;
  final int wifiCount;
  final int trajectoryCount;

  const SessionExportResult({
    required this.directoryPath,
    required this.imuPath,
    required this.wifiPath,
    required this.trajectoryPath,
    required this.imuCount,
    required this.wifiCount,
    required this.trajectoryCount,
  });
}

class CsvExportService {
  static Future<SessionExportResult> exportSession({
    required String sessionLabel,
    required List<IMUReading> imuReadings,
    required List<WiFiReading> wifiScans,
    required List<GTWaypoint> gtWaypoints,
  }) async {
    final sortedImu = List<IMUReading>.from(imuReadings)
      ..sort((a, b) => a.ts.compareTo(b.ts));
    final sortedWifi = List<WiFiReading>.from(wifiScans)
      ..sort((a, b) => a.lastSeenTs.compareTo(b.lastSeenTs));
    final sortedGt = List<GTWaypoint>.from(gtWaypoints)
      ..sort((a, b) => a.ts.compareTo(b.ts));

    final stamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final safeLabel = _sanitizeFileName(sessionLabel);
    final baseDir = await getApplicationDocumentsDirectory();
    final sessionDir = Directory(
      p.join(baseDir.path, 'exports', '${stamp}_$safeLabel'),
    );
    await sessionDir.create(recursive: true);

    final imuPath = p.join(sessionDir.path, 'imu_${safeLabel}_$stamp.csv');
    final wifiPath = p.join(sessionDir.path, 'wifi_${safeLabel}_$stamp.csv');
    final trajectoryPath = p.join(
        sessionDir.path, 'trajectory_${safeLabel}_$stamp.csv');

    await File(imuPath).writeAsString(_buildImuCsv(sortedImu));
    await File(wifiPath).writeAsString(_buildWifiCsv(sortedWifi));
    await File(trajectoryPath).writeAsString(_buildTrajectoryCsv(sortedGt));

    return SessionExportResult(
      directoryPath: sessionDir.path,
      imuPath: imuPath,
      wifiPath: wifiPath,
      trajectoryPath: trajectoryPath,
      imuCount: sortedImu.length,
      wifiCount: sortedWifi.length,
      trajectoryCount: sortedGt.length,
    );
  }

  static String _buildImuCsv(List<IMUReading> readings) {
    final buffer = StringBuffer('ts,sensor,x,y,z\n');
    for (final r in readings) {
      buffer.writeln(
        '${r.ts},${r.sensor},${_num(r.x)},${_num(r.y)},${_num(r.z)}',
      );
    }
    return buffer.toString();
  }

  static String _buildWifiCsv(List<WiFiReading> readings) {
    final buffer = StringBuffer('scanTs,lastSeenTs,bssid,ssid,rssi,freq\n');
    for (final r in readings) {
      buffer.writeln(
        '${r.scanTs},${r.lastSeenTs},'
        '${_csvField(r.bssid)},${_csvField(r.ssid)},${r.rssi},${r.freq}',
      );
    }
    return buffer.toString();
  }

  static String _buildTrajectoryCsv(List<GTWaypoint> waypoints) {
    final buffer = StringBuffer('ts,x,y,heading\n');
    for (final w in waypoints) {
      buffer.writeln(
        '${w.ts},${_num(w.x)},${_num(w.y)},${_csvField(w.heading.name)}',
      );
    }
    return buffer.toString();
  }

  static String _num(double value) => value.toStringAsFixed(6);

  static String _csvField(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }

  static String _sanitizeFileName(String value) {
    final sanitized = value
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    return sanitized.isEmpty ? 'session' : sanitized;
  }
}
