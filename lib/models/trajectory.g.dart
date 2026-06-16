// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trajectory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrajectoryImpl _$$TrajectoryImplFromJson(Map<String, dynamic> json) =>
    _$TrajectoryImpl(
      trajId: json['traj_id'] as String,
      metadata: TrajectoryMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      imuReadings: (json['imu_readings'] as List<dynamic>)
          .map((e) => IMUReading.fromJson(e as Map<String, dynamic>))
          .toList(),
      wifiScans: (json['wifi_scans'] as List<dynamic>)
          .map((e) => WiFiScan.fromJson(e as Map<String, dynamic>))
          .toList(),
      gtWaypoints: (json['gt_waypoints'] as List<dynamic>)
          .map((e) => GTWaypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrajectoryImplToJson(_$TrajectoryImpl instance) =>
    <String, dynamic>{
      'traj_id': instance.trajId,
      'metadata': instance.metadata,
      'imu_readings': instance.imuReadings,
      'wifi_scans': instance.wifiScans,
      'gt_waypoints': instance.gtWaypoints,
    };

_$TrajectoryMetadataImpl _$$TrajectoryMetadataImplFromJson(
  Map<String, dynamic> json,
) => _$TrajectoryMetadataImpl(
  collector: json['collector'] as String,
  building: json['building'] as String,
  floor: (json['floor'] as num).toInt(),
  startTime: (json['start_time'] as num).toInt(),
  endTime: (json['end_time'] as num).toInt(),
  pathDescription: json['path_description'] as String,
  phoneModel: json['phone_model'] as String,
  notes: json['notes'] as String,
);

Map<String, dynamic> _$$TrajectoryMetadataImplToJson(
  _$TrajectoryMetadataImpl instance,
) => <String, dynamic>{
  'collector': instance.collector,
  'building': instance.building,
  'floor': instance.floor,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'path_description': instance.pathDescription,
  'phone_model': instance.phoneModel,
  'notes': instance.notes,
};
