// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gt_waypoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GTWaypointImpl _$$GTWaypointImplFromJson(Map<String, dynamic> json) =>
    _$GTWaypointImpl(
      ts: (json['ts'] as num).toInt(),
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      heading: (json['heading'] as num).toDouble(),
    );

Map<String, dynamic> _$$GTWaypointImplToJson(_$GTWaypointImpl instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'x': instance.x,
      'y': instance.y,
      'heading': instance.heading,
    };
