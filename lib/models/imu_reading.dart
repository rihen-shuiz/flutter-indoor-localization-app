import 'package:freezed_annotation/freezed_annotation.dart';

part 'imu_reading.freezed.dart';
part 'imu_reading.g.dart';

@freezed
class IMUReading with _$IMUReading {
  const factory IMUReading({
    required int ts,
    required double ax,
    required double ay,
    required double az,
    required double gx,
    required double gy,
    required double gz,
    required double mx,
    required double my,
    required double mz,
  }) = _IMUReading;

  factory IMUReading.fromJson(Map<String, dynamic> json) => 
      _$IMUReadingFromJson(json);
}