import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';
import 'dart:async';

class IMUService extends ChangeNotifier {
  static final IMUService _instance = IMUService._internal();

  factory IMUService() => _instance;
  IMUService._internal();

  // ~100 Hz target; real devices may cap this.
  static const Duration samplingPeriod = Duration(milliseconds: 10);

  StreamSubscription<AccelerometerEvent>? _accelSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroSubscription;
  StreamSubscription<MagnetometerEvent>? _magSubscription;

  // Latest values, kept only for the live UI readout.
  double ax = 0, ay = 0, az = 0;
  double gx = 0, gy = 0, gz = 0;
  double mx = 0, my = 0, mz = 0;

  final List<void Function()> _listeners = [];
  final List<IMUReading> _recordedReadings = [];
  bool isRecording = false;

  List<IMUReading> get recordedReadings => List.unmodifiable(_recordedReadings);

  Future<void> startListening() async {
    if (_accelSubscription != null) return;

    print('[IMU] Starting sensor listeners...');

    _accelSubscription =
        accelerometerEventStream(samplingPeriod: samplingPeriod)
            .listen((AccelerometerEvent event) {
      ax = event.x;
      ay = event.y;
      az = event.z;
      _record('accel', event.x, event.y, event.z);
      _notifyListeners();
    });

    _gyroSubscription = gyroscopeEventStream(samplingPeriod: samplingPeriod)
        .listen((GyroscopeEvent event) {
      gx = event.x;
      gy = event.y;
      gz = event.z;
      _record('gyro', event.x, event.y, event.z);
      _notifyListeners();
    });

    _magSubscription =
        magnetometerEventStream(samplingPeriod: samplingPeriod)
            .listen((MagnetometerEvent event) {
      mx = event.x;
      my = event.y;
      mz = event.z;
      _record('mag', event.x, event.y, event.z);
      _notifyListeners();
    });
  }

  void stopListening() {
    stopRecording();

    _accelSubscription?.cancel();
    _gyroSubscription?.cancel();
    _magSubscription?.cancel();

    _accelSubscription = null;
    _gyroSubscription = null;
    _magSubscription = null;

    print('[IMU] Stopped sensor listeners');
  }

  Future<bool> areSensorsAvailable() async {
    try {
      const timeout = Duration(milliseconds: 500);
      await accelerometerEventStream().first.timeout(timeout);
      await gyroscopeEventStream().first.timeout(timeout);
      await magnetometerEventStream().first.timeout(timeout);
      return true;
    } catch (e) {
      print('[IMU] Sensor availability check failed or timed out: $e');
      return false;
    }
  }

  void startRecording() {
    if (isRecording) return;
    _recordedReadings.clear();
    isRecording = true;
    print('[IMU] Recording started (per-sensor, '
        '${samplingPeriod.inMilliseconds}ms target)');
  }

  List<IMUReading> stopRecording() {
    if (!isRecording) return [];
    isRecording = false;
    print('[IMU] Recording stopped (${_recordedReadings.length} samples)');
    return List.from(_recordedReadings);
  }

  /// Appends a single sensor event with its own arrival timestamp.
  /// Wall-clock now() keeps IMU comparable to WiFi/GT (same clock) and
  /// avoids cross-platform ambiguity of event.timestamp's epoch.
  void _record(String sensor, double x, double y, double z) {
    if (!isRecording) return;
    _recordedReadings.add(
      IMUReading(
        ts: DateTime.now().millisecondsSinceEpoch,
        sensor: sensor,
        x: x,
        y: y,
        z: z,
      ),
    );
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void addListener(void Function() callback) => _listeners.add(callback);
  void removeListener(void Function() callback) => _listeners.remove(callback);

  Map<String, double> getCurrentReadings() => {
        'ax': ax,
        'ay': ay,
        'az': az,
        'gx': gx,
        'gy': gy,
        'gz': gz,
        'mx': mx,
        'my': my,
        'mz': mz,
      };
}
