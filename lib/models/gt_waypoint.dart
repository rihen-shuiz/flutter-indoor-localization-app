import 'dart:ffi';

import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gt_waypoint.freezed.dart';
part 'gt_waypoint.g.dart';

@freezed
class GTWaypoint with _$GTWaypoint {
  const factory GTWaypoint({
    required int ts,                      // timestamp (ms)
    required double x,                    // position (meters)
    required double y,                    // position (meters)
    required HeadingDirection heading,    // direction (one of [north, east, south, west])
  }) = _GTWaypoint;

  factory GTWaypoint.fromJson(Map<String, dynamic> json) =>
      _$GTWaypointFromJson(json);
}