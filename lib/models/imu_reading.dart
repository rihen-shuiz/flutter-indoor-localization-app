import 'package:freezed_annotation/freezed_annotation.dart';

part 'imu_reading.freezed.dart';
part 'imu_reading.g.dart';

/// One row per individual sensor event (Format A).
/// `sensor` is 'accel' | 'gyro' | 'mag'; `ts` is the arrival time of THAT
/// event only — channels are never fused into a single fabricated timestamp.
@freezed
abstract class IMUReading with _$IMUReading {
  const factory IMUReading({
    required int ts,
    required String sensor,
    required double x,
    required double y,
    required double z,
  }) = _IMUReading;

  factory IMUReading.fromJson(Map<String, dynamic> json) =>
      _$IMUReadingFromJson(json);
}
