// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gt_waypoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GTWaypoint _$GTWaypointFromJson(Map<String, dynamic> json) => _GTWaypoint(
  ts: (json['ts'] as num).toInt(),
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  heading: $enumDecode(_$HeadingDirectionEnumMap, json['heading']),
);

Map<String, dynamic> _$GTWaypointToJson(_GTWaypoint instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'x': instance.x,
      'y': instance.y,
      'heading': _$HeadingDirectionEnumMap[instance.heading]!,
    };

const _$HeadingDirectionEnumMap = {
  HeadingDirection.north: 'north',
  HeadingDirection.east: 'east',
  HeadingDirection.south: 'south',
  HeadingDirection.west: 'west',
};
