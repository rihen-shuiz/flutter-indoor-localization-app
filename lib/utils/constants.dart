import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';

class AppConstants {
  static const List<TrajectoryBlueprint> presetTrajectories = [
    TrajectoryBlueprint(
      name: "The First Trajectory",
      startX: 0.0,
      startY: 0.0,
      segments: [
        TrajectorySegment(fromNode: 'A', toNode: 'C', distanceInMeters: 30.0, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'C', toNode: 'D', distanceInMeters: 7.0, direction: HeadingDirection.east),
        TrajectorySegment(fromNode: 'D', toNode: 'G', distanceInMeters: 3.0, direction: HeadingDirection.north),
        TrajectorySegment(fromNode: 'G', toNode: 'L', distanceInMeters: 10.0, direction: HeadingDirection.east),
      ],
    ),
    TrajectoryBlueprint(
      name: "The Second Trajectory",
      startX: 7.0,
      startY: 45.0,
      segments: [
        TrajectorySegment(fromNode: 'K', toNode: 'F', distanceInMeters: 8.0, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'F', toNode: 'E', distanceInMeters: 8.0, direction: HeadingDirection.west),
        TrajectorySegment(fromNode: 'E', toNode: 'C', distanceInMeters: 8.0, direction: HeadingDirection.south),
        TrajectorySegment(fromNode: 'C', toNode: 'H', distanceInMeters: 8.0, direction: HeadingDirection.west),
      ],
    ),
  ];
}