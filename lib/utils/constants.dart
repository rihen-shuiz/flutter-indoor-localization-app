import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';

class AppConstants {
  /// Ground-truth waypoint spacing during segment interpolation (ms).
  /// 100 ms ≈ 10 Hz — aligns with typical Wi-Fi scan cadence and validation density checks.
  static const int gtWaypointIntervalMs = 100;

  static const List<TrajectoryBlueprint> presetTrajectories = [
    TrajectoryBlueprint(
      name: "The First Trajectory",
      startX: 0.0,
      startY: 0.0,
      segments: [
        TrajectorySegment(fromNode: 'A', toNode: 'C', distanceInMeters: 37.9668, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'C', toNode: 'D', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'D', toNode: 'G', distanceInMeters: 4.424, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'G', toNode: 'L', distanceInMeters: 7.1785, direction: HeadingDirection.east),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Second Trajectory",
      startX: 8.5658,
      startY: 61.3764,
      segments: [
        TrajectorySegment(fromNode: 'K', toNode: 'F', distanceInMeters: 14.9005, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'F', toNode: 'E', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'E', toNode: 'C', distanceInMeters: 8.5091, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'C', toNode: 'H', distanceInMeters: 21.5655, direction: HeadingDirection.west),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Third Trajectory",
      startX: 0.0,
      startY: 61.3674,
      segments: [
        TrajectorySegment(fromNode: 'J', toNode: 'E', distanceInMeters: 14.8915, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'E', toNode: 'F', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'F', toNode: 'K', distanceInMeters: 14.9005, direction: HeadingDirection.north),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Fourth Trajectory",
      startX: -21.723,
      startY: 46.4759,
      segments: [
        TrajectorySegment(fromNode: 'I', toNode: 'E', distanceInMeters: 21.723, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'E', toNode: 'C', distanceInMeters: 8.5091, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'C', toNode: 'D', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'D', toNode: 'G', distanceInMeters: 4.424, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'G', toNode: 'L', distanceInMeters: 7.1785, direction: HeadingDirection.east),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Fifth Trajectory",
      startX: 8.5658,
      startY: 37.9668,
      segments: [
        TrajectorySegment(fromNode: 'D', toNode: 'C', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'C', toNode: 'E', distanceInMeters: 8.5091, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'E', toNode: 'F', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'F', toNode: 'K', distanceInMeters: 14.9005, direction: HeadingDirection.north),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Sixth Trajectory",
      startX:8.5658,
      startY: 42.3908,
      segments: [
        TrajectorySegment(fromNode: 'G', toNode: 'D', distanceInMeters: 4.424, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'D', toNode: 'C', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'C', toNode: 'A', distanceInMeters: 37.9668, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'A', toNode: 'B', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'B', toNode: 'D', distanceInMeters: 37.9668, direction: HeadingDirection.north),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Seventh Trajectory",
      startX: 0.0,
      startY: 0.0,
      segments: [
        TrajectorySegment(fromNode: 'A', toNode: 'B', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'B', toNode: 'D', distanceInMeters: 37.9668, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'D', toNode: 'C', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'C', toNode: 'E', distanceInMeters: 8.5091, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'E', toNode: 'I', distanceInMeters: 21.723, direction: HeadingDirection.west),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Eighth Trajectory",
      startX: 0.0,
      startY: 0.0,
      segments: [
        TrajectorySegment(fromNode: 'A', toNode: 'C', distanceInMeters: 37.9668, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'C', toNode: 'H', distanceInMeters: 21.5655, direction: HeadingDirection.west),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Ninth Trajectory",
      startX: 8.5658,
      startY: 46.4759,
      segments: [
        TrajectorySegment(fromNode: 'F', toNode: 'E', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'E', toNode: 'C', distanceInMeters: 8.5091, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'C', toNode: 'D', distanceInMeters: 8.5658, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'D', toNode: 'G', distanceInMeters: 4.424, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'G', toNode: 'L', distanceInMeters: 7.1785, direction: HeadingDirection.east),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Tenth Trajectory",
      startX: 8.5658,
      startY: 42.3908,
      segments: [
        TrajectorySegment(fromNode: 'G', toNode: 'F', distanceInMeters: 4.0851, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'F', toNode: 'E', distanceInMeters: 8.5658, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'E', toNode: 'J', distanceInMeters: 14.8915, direction: HeadingDirection.north),
      ],
    ),
  ];
}