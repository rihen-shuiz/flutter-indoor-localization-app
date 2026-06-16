// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IMUReadingImpl _$$IMUReadingImplFromJson(Map<String, dynamic> json) =>
    _$IMUReadingImpl(
      ts: (json['ts'] as num).toInt(),
      ax: (json['ax'] as num).toDouble(),
      ay: (json['ay'] as num).toDouble(),
      az: (json['az'] as num).toDouble(),
      gx: (json['gx'] as num).toDouble(),
      gy: (json['gy'] as num).toDouble(),
      gz: (json['gz'] as num).toDouble(),
      mx: (json['mx'] as num).toDouble(),
      my: (json['my'] as num).toDouble(),
      mz: (json['mz'] as num).toDouble(),
    );

Map<String, dynamic> _$$IMUReadingImplToJson(_$IMUReadingImpl instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'ax': instance.ax,
      'ay': instance.ay,
      'az': instance.az,
      'gx': instance.gx,
      'gy': instance.gy,
      'gz': instance.gz,
      'mx': instance.mx,
      'my': instance.my,
      'mz': instance.mz,
    };
