import 'package:wifi_scan/wifi_scan.dart';
import 'dart:async';

import 'package:flutter_indoor_localization_app/models/wifi_reading.dart';
import 'package:permission_handler/permission_handler.dart';

class WiFiService {
  static final WiFiService _instance = WiFiService._internal();
  
  factory WiFiService() => _instance;
  WiFiService._internal();
  
  final List<WiFiReading> _recordedScans = [];
  Timer? _scanTimer;
  bool isRecording = false;
  
  // Cache of the latest discovered Access Points
  List<WiFiAccessPoint> discoveredAPs = [];
  
  // UI Listener notification hook
  final List<void Function()> _listeners = [];

  /// Expose an unmodifiable view of recorded scans for extra safety
  List<WiFiReading> get recordedScans => List.unmodifiable(_recordedScans);

  /// Request WiFi scan permissions and check hardware readiness
  Future<bool> requestPermissions() async {
    try {
      // For Android 13+, request NEARBY_WIFI_DEVICES permission
      PermissionStatus status;
      if (await Permission.nearbyWifiDevices.isDenied) {
        status = await Permission.nearbyWifiDevices.request();
      } else {
        status = await Permission.nearbyWifiDevices.status;
      }
      // Fallback to location permission for older Android versions
      if (!status.isGranted) {
        status = await Permission.location.request();
      }
      
      if (!status.isGranted) {
        print('[WiFi] Permission denied');
        return false;
      }
      
      // Check if hardware supports WiFi scanning
      final canGetResults = await WiFiScan.instance.canGetScannedResults();
      if (canGetResults != CanGetScannedResults.yes) {
        print('[WiFi] Cannot get scanned networks. Reason: $canGetResults');
        return false;
      }
      
      return true;
    } catch (e) {
      print('[WiFi] Permission request failed: $e');
      return false;
    }
  }
  
  /// Get available WiFi networks cached by the OS
  Future<List<WiFiAccessPoint>> scanNetworks() async {
    try {
      // Corrected API method name
      final access = await WiFiScan.instance.getScannedResults();
      discoveredAPs = access;
      print('[WiFi] Found ${discoveredAPs.length} networks');
      return discoveredAPs;
    } catch (e) {
      print('[WiFi] Fetching scanned results failed: $e');
      return [];
    }
  }
  
  /// Start periodic WiFi collection
  void startRecording({Duration interval = const Duration(seconds: 3)}) {
    if (isRecording) return; // Guard against duplicate timer generation

    _recordedScans.clear();
    isRecording = true;
    
    // Execute immediately on startup
    _doScan();
    
    // Setup clean periodic interval management
    _scanTimer = Timer.periodic(interval, (_) => _doScan());
    print('[WiFi] Recording started (interval: ${interval.inSeconds}s)');
  }
  
  /// Performs one snapshot parse and appends values to data-store
  Future<void> _doScan() async {
    if (!isRecording) return;

    try {
      // Optional: Request Android/iOS to actively perform a fresh hardware scan.
      // Note: Subject to aggressive OS throttling!
      final canStartScan = await WiFiScan.instance.canStartScan();
      if (canStartScan == CanStartScan.yes) {
        await WiFiScan.instance.startScan();
      }

      final aps = await scanNetworks();
      final ts = DateTime.now().millisecondsSinceEpoch;
      
      for (final ap in aps) {
        final scan = WiFiReading(
          ts: ts,
          bssid: ap.bssid,
          ssid: ap.ssid.isEmpty ? 'Hidden Network' : ap.ssid,
          rssi: ap.level,  // Signal strength in dBm
          freq: ap.frequency,
        );
        
        _recordedScans.add(scan);
      }
      _notifyListeners();
    } catch (e) {
      print('[WiFi] Scan recording cycle error: $e');
    }
  }
  
  /// Stop recording data and clean up memory loops
  List<WiFiReading> stopRecording() {
    if (!isRecording) return [];

    _scanTimer?.cancel();
    _scanTimer = null;
    isRecording = false;
    
    print('[WiFi] Recording stopped (${_recordedScans.length} records captured)');
    
    // Defensive cloning prevents manipulation leaks
    return List.from(_recordedScans);
  }

  // --- UI Binding Mechanics ---
  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
  
  void addListener(void Function() callback) => _listeners.add(callback);
  void removeListener(void Function() callback) => _listeners.remove(callback);
}