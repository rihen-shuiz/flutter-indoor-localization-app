// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IMUReading _$IMUReadingFromJson(Map<String, dynamic> json) => _IMUReading(
  ts: (json['ts'] as num).toInt(),
  sensor: json['sensor'] as String,
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
);

Map<String, dynamic> _$IMUReadingToJson(_IMUReading instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'sensor': instance.sensor,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };
