enum HeadingDirection { north, east, south, west }

class TrajectorySegment {
  final String fromNode;
  final String toNode;
  final double distanceInMeters;
  final HeadingDirection direction;

  const TrajectorySegment({
    required this.fromNode,
    required this.toNode,
    required this.distanceInMeters,
    required this.direction,
  });
}

class TrajectoryBlueprint {
  final String name;
  final double startX;
  final double startY;
  final List<TrajectorySegment> segments;

  const TrajectoryBlueprint({
    required this.name,
    required this.startX,
    required this.startY,
    required this.segments,
  });
}