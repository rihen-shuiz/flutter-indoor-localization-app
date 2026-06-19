import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_indoor_localization_app/models/imu_reading.dart';
import 'dart:async';

class IMUService extends ChangeNotifier {
  static final IMUService _instance = IMUService._internal();

  factory IMUService() => _instance;
  IMUService._internal();

  StreamSubscription<AccelerometerEvent>? _accelSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroSubscription;
  StreamSubscription<MagnetometerEvent>? _magSubscription;

  Timer? _recordingTimer;

  double ax = 0, ay = 0, az = 0;
  double gx = 0, gy = 0, gz = 0;
  double mx = 0, my = 0, mz = 0;

  int _accelVersion = 0;
  int _gyroVersion = 0;
  int _magVersion = 0;
  int _recordedAccelVersion = 0;
  int _recordedGyroVersion = 0;
  int _recordedMagVersion = 0;

  final List<void Function()> _listeners = [];
  final List<IMUReading> _recordedReadings = [];
  bool isRecording = false;

  List<IMUReading> get recordedReadings => List.unmodifiable(_recordedReadings);

  Future<void> startListening() async {
    if (_accelSubscription != null) return;

    print('[IMU] Starting sensor listeners...');

    final sensorInterval = SensorInterval.normalInterval;

    _accelSubscription = accelerometerEventStream(samplingPeriod: sensorInterval)
        .listen((AccelerometerEvent event) {
      ax = event.x;
      ay = event.y;
      az = event.z;
      _accelVersion++;
      _notifyListeners();
    });

    _gyroSubscription = gyroscopeEventStream(samplingPeriod: sensorInterval)
        .listen((GyroscopeEvent event) {
      gx = event.x;
      gy = event.y;
      gz = event.z;
      _gyroVersion++;
      _notifyListeners();
    });

    _magSubscription = magnetometerEventStream(samplingPeriod: sensorInterval)
        .listen((MagnetometerEvent event) {
      mx = event.x;
      my = event.y;
      mz = event.z;
      _magVersion++;
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

  void startRecording({Duration interval = const Duration(milliseconds: 20)}) {
    if (isRecording) return;

    _recordedReadings.clear();
    _recordedAccelVersion = _accelVersion;
    _recordedGyroVersion = _gyroVersion;
    _recordedMagVersion = _magVersion;
    isRecording = true;

    _recordingTimer = Timer.periodic(interval, (_) => _recordSample());
    print('[IMU] Recording started with interval ${interval.inMilliseconds}ms');
  }

  List<IMUReading> stopRecording() {
    if (!isRecording) return [];

    isRecording = false;
    _recordingTimer?.cancel();
    _recordingTimer = null;

    print('[IMU] Recording stopped (${_recordedReadings.length} samples)');
    return List.from(_recordedReadings);
  }

  void _recordSample() {
    final bool allSensorsFresh =
        _accelVersion > _recordedAccelVersion &&
        _gyroVersion > _recordedGyroVersion &&
        _magVersion > _recordedMagVersion;

    if (!allSensorsFresh) return;

    _recordedAccelVersion = _accelVersion;
    _recordedGyroVersion = _gyroVersion;
    _recordedMagVersion = _magVersion;

    _recordedReadings.add(
      IMUReading(
        ts: DateTime.now().millisecondsSinceEpoch,
        ax: ax,
        ay: ay,
        az: az,
        gx: gx,
        gy: gy,
        gz: gz,
        mx: mx,
        my: my,
        mz: mz,
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
