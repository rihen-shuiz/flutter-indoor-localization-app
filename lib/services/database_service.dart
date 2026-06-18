import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:flutter_indoor_localization_app/models/trajectory.dart'; 
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';
import 'package:flutter_indoor_localization_app/models/wifi_reading.dart';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  
  factory DatabaseService() => _instance;
  DatabaseService._internal();
  
  Database? _db;
  Future<Database>? _dbInitFuture;
  
  /// Thread-safe database instance getter
  Future<Database> get db async {
    if (_db != null) return _db!;
    // Prevents multiple concurrent code blocks from trying to open the DB at the exact same time
    _dbInitFuture ??= _initDB();
    _db = await _dbInitFuture!;
    return _db!;
  }
  
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'indoor_localization.db');
    
    print('[DB] Opening database at $path');
    
    return openDatabase(
      path,
      version: 1,
      onConfigure: _onConfigure, // CRITICAL: Enables foreign keys
      onCreate: _createTables,
    );
  }

  /// Explicitly tell SQLite to enforce relation rules
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
  
  /// Initialize database structural blueprint
  Future<void> _createTables(Database db, int version) async {
    print('[DB] Creating tables...');
    
    // Trajectories metadata table
    await db.execute('''
      CREATE TABLE trajectories (
        traj_id TEXT PRIMARY KEY,
        collector TEXT NOT NULL,
        building TEXT NOT NULL,
        floor INTEGER NOT NULL,
        start_time INTEGER NOT NULL,
        end_time INTEGER,
        preset_path_name TEXT,
        path_description TEXT,
        phone_model TEXT,
        notes TEXT,
        uploaded INTEGER DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    ''');
    
    // IMU continuous reading array store
    await db.execute('''
      CREATE TABLE imu_readings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        traj_id TEXT NOT NULL,
        ts INTEGER NOT NULL,
        ax REAL, ay REAL, az REAL,
        gx REAL, gy REAL, gz REAL,
        mx REAL, my REAL, mz REAL,
        FOREIGN KEY(traj_id) REFERENCES trajectories(traj_id) ON DELETE CASCADE
      );
    ''');
    
    // WiFi scans snapshot store (Corrected schema naming parameters)
    await db.execute('''
      CREATE TABLE wifi_scans (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        traj_id TEXT NOT NULL,
        ts INTEGER NOT NULL,
        bssid TEXT NOT NULL,
        ssid TEXT,
        rssi INTEGER,
        freq INTEGER,
        FOREIGN KEY(traj_id) REFERENCES trajectories(traj_id) ON DELETE CASCADE
      );
    ''');
    
    // Physical reference path markers
    await db.execute('''
      CREATE TABLE gt_waypoints (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        traj_id TEXT NOT NULL,
        ts INTEGER NOT NULL,
        x REAL NOT NULL,
        y REAL NOT NULL,
        heading REAL,
        FOREIGN KEY(traj_id) REFERENCES trajectories(traj_id) ON DELETE CASCADE
      );
    ''');
    
    // Speed optimization indexes
    await db.execute('CREATE INDEX idx_imu_traj ON imu_readings(traj_id)');
    await db.execute('CREATE INDEX idx_wifi_traj ON wifi_scans(traj_id)');
    await db.execute('CREATE INDEX idx_gt_traj ON gt_waypoints(traj_id)');
    
    print('[DB] Tables created successfully');
  }
  
  /// Saves an entire trajectory collection inside an ultra-fast Batch operation
  Future<void> saveTrajectory(Trajectory traj) async {
    final database = await db;
    
    // We use a Batch to group thousands of inserts into a single disk write
    final batch = database.batch();
    
    // 1. Stage metadata
    batch.insert('trajectories', {
      'traj_id': traj.trajId,
      'collector': traj.metadata.collector,
      'building': traj.metadata.building,
      'floor': traj.metadata.floor,
      'start_time': traj.metadata.startTime,
      'end_time': traj.metadata.endTime,
      'preset_path_name': traj.metadata.presetPathName,
      'path_description': traj.metadata.pathDescription,
      'phone_model': traj.metadata.phoneModel,
      'notes': traj.metadata.notes,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    
    // 2. Stage high-frequency IMU rows
    for (final reading in traj.imuReadings) {
      batch.insert('imu_readings', {
        'traj_id': traj.trajId,
        ...reading.toJson(), // Aligned with Freezed default signatures
      });
    }
    
    // 3. Stage collected WiFi rows
    for (final scan in traj.wifiScans) {
      batch.insert('wifi_scans', {
        'traj_id': traj.trajId,
        ...scan.toJson(), // Target variable renamed to match model updates
      });
    }
    
      // 4. Stage structural reference map points
      for (final waypoint in traj.gtWaypoints) {
        batch.insert('gt_waypoints', {
          'traj_id': traj.trajId,
          ...waypoint.toJson(),
        });
    }
    
    // Commit everything together. noResult: true makes it run even faster.
    await batch.commit(noResult: true);
    print('[DB] Saved trajectory: ${traj.trajId} safely via batch engine');
  }
  
  /// Resolves database parsing directly into system components
  Future<Trajectory?> loadTrajectory(String trajId) async {
    final database = await db;
    
    final metaList = await database.query(
      'trajectories',
      where: 'traj_id = ?',
      whereArgs: [trajId],
    );
    
    if (metaList.isEmpty) return null;
    final meta = metaList.first;
    
    // Run data fetching processes together concurrently
    final results = await Future.wait([
      database.query('imu_readings', where: 'traj_id = ?', whereArgs: [trajId], orderBy: 'ts ASC'),
      database.query('wifi_scans', where: 'traj_id = ?', whereArgs: [trajId], orderBy: 'ts ASC'),
      database.query('gt_waypoints', where: 'traj_id = ?', whereArgs: [trajId], orderBy: 'ts ASC'),
    ]);
    
    final imuList = results[0];
    final wifiList = results[1];
    final gtList = results[2];
    
    return Trajectory(
      trajId: trajId,
      metadata: TrajectoryMetadata(
        collector: meta['collector'] as String,
        building: meta['building'] as String,
        floor: meta['floor'] as int,
        startTime: meta['start_time'] as int,
        endTime: meta['end_time'] as int? ?? 0,
        presetPathName: meta['preset_path_name'] as String? ?? '',
        pathDescription: meta['path_description'] as String? ?? '',
        phoneModel: meta['phone_model'] as String? ?? '',
        notes: meta['notes'] as String? ?? '',
      ),
      // Map JSON collections cleanly back into structured class entities
      imuReadings: imuList.map((m) => IMUReading.fromJson(m)).toList(),
      wifiScans: wifiList.map((m) => WiFiReading.fromJson(m)).toList(),
      gtWaypoints: gtList.map((m) => GTWaypoint.fromJson(m)).toList(),
    );
  }
  
  /// Fetch summaries of all recorded localization metrics
  Future<List<Map<String, dynamic>>> getAllTrajectories() async {
    final database = await db;
    return await database.query('trajectories', orderBy: 'created_at DESC');
  }
}