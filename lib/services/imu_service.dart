import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';

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

  // --- Calibration state (gyro bias from a static hold) ---
  double gyroBiasX = 0, gyroBiasY = 0, gyroBiasZ = 0;
  double restAccelNorm = 0; // mean |accel| at rest, for QA (~9.81 expected)
  bool isCalibrated = false;

  bool _isCalibrating = false;
  final List<(double, double, double)> _calibGyro = [];
  final List<double> _calibAccelNorm = [];

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
      if (_isCalibrating) {
        _calibAccelNorm.add(
            sqrt(event.x * event.x + event.y * event.y + event.z * event.z));
      }
      _record('accel', event.x, event.y, event.z);
      _notifyListeners();
    });

    _gyroSubscription = gyroscopeEventStream(samplingPeriod: samplingPeriod)
        .listen((GyroscopeEvent event) {
      gx = event.x;
      gy = event.y;
      gz = event.z;
      if (_isCalibrating) {
        _calibGyro.add((event.x, event.y, event.z));
      }
      // Recorded gyro is bias-corrected; live gx/gy/gz stay raw for the readout.
      _record('gyro', event.x - gyroBiasX, event.y - gyroBiasY,
          event.z - gyroBiasZ);
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

  /// Estimate gyroscope bias while the phone is held still.
  /// Averages gyro samples over [duration]; the mean is the zero-rate offset
  /// (gyro should read 0 at rest). Subtracted from all recorded gyro rows.
  Future<CalibrationResult> calibrate(
      {Duration duration = const Duration(seconds: 3)}) async {
    if (_accelSubscription == null) {
      return const CalibrationResult(ok: false, samples: 0);
    }
    _calibGyro.clear();
    _calibAccelNorm.clear();
    _isCalibrating = true;

    await Future.delayed(duration);
    _isCalibrating = false;

    if (_calibGyro.isEmpty) {
      return const CalibrationResult(ok: false, samples: 0);
    }

    double sx = 0, sy = 0, sz = 0;
    for (final (x, y, z) in _calibGyro) {
      sx += x;
      sy += y;
      sz += z;
    }
    final n = _calibGyro.length;
    gyroBiasX = sx / n;
    gyroBiasY = sy / n;
    gyroBiasZ = sz / n;

    restAccelNorm = _calibAccelNorm.isEmpty
        ? 0
        : _calibAccelNorm.reduce((a, b) => a + b) / _calibAccelNorm.length;

    isCalibrated = true;
    _notifyListeners();
    print('[IMU] Calibrated: gyroBias=($gyroBiasX,$gyroBiasY,$gyroBiasZ) '
        'restAccelNorm=$restAccelNorm from $n samples');

    return CalibrationResult(
      ok: true,
      samples: n,
      gyroBiasX: gyroBiasX,
      gyroBiasY: gyroBiasY,
      gyroBiasZ: gyroBiasZ,
      restAccelNorm: restAccelNorm,
    );
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

class CalibrationResult {
  final bool ok;
  final int samples;
  final double gyroBiasX, gyroBiasY, gyroBiasZ, restAccelNorm;

  const CalibrationResult({
    required this.ok,
    required this.samples,
    this.gyroBiasX = 0,
    this.gyroBiasY = 0,
    this.gyroBiasZ = 0,
    this.restAccelNorm = 0,
  });
}
