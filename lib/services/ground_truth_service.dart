import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';
import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';
import 'package:flutter_indoor_localization_app/utils/constants.dart';

class GroundTruthService extends ChangeNotifier {
  static final GroundTruthService _instance = GroundTruthService._internal();
  factory GroundTruthService() => _instance;
  GroundTruthService._internal();

  TrajectoryBlueprint? _activeBlueprint;
  int _currentSegmentIndex = 0;
  bool _pathComplete = false;

  double _currentX = 0.0;
  double _currentY = 0.0;

  late int _segmentStartTime;

  final List<GTWaypoint> _collectedWaypoints = [];
  final StreamController<GTWaypoint> _waypointController =
      StreamController<GTWaypoint>.broadcast();

  double get currentX => _currentX;
  double get currentY => _currentY;
  int get waypointCount => _collectedWaypoints.length;
  bool get hasActiveTrajectory => _activeBlueprint != null;
  bool get pathComplete => _pathComplete;
  int get currentSegmentIndex => _currentSegmentIndex;
  TrajectorySegment? get currentSegment =>
      _activeBlueprint != null ? _activeBlueprint!.segments[_currentSegmentIndex] : null;
  Stream<GTWaypoint> get waypointsStream => _waypointController.stream;
  List<GTWaypoint> get collectedWaypoints => List.unmodifiable(_collectedWaypoints);

  void initializeSession(TrajectoryBlueprint blueprint) {
    if (blueprint.segments.isEmpty) {
      throw ArgumentError('Blueprint must have at least one segment');
    }

    _activeBlueprint = blueprint;
    _currentSegmentIndex = 0;
    _pathComplete = false;
    _currentX = blueprint.startX;
    _currentY = blueprint.startY;
    _segmentStartTime = DateTime.now().millisecondsSinceEpoch;
    _collectedWaypoints.clear();

    notifyListeners();
  }

  /// Called when the user turns at a node (advance to the next segment).
  void nextSegment() {
    if (_activeBlueprint == null || _pathComplete) return;

    final segmentEndTime = DateTime.now().millisecondsSinceEpoch;
    _interpolateAndEmitSegment(segmentEndTime);

    if (_currentSegmentIndex < _activeBlueprint!.segments.length - 1) {
      _currentSegmentIndex++;
      _segmentStartTime = DateTime.now().millisecondsSinceEpoch;

      final nextSeg = _activeBlueprint!.segments[_currentSegmentIndex];
      debugPrint(
        '[GT Service] Turn → segment ${_currentSegmentIndex + 1}/'
        '${_activeBlueprint!.segments.length}: '
        '${nextSeg.fromNode} → ${nextSeg.toNode} (${nextSeg.direction.name})',
      );
    } else {
      _pathComplete = true;
      debugPrint('[GT Service] Reached end of preset path.');
    }

    notifyListeners();
  }

  /// Called when recording stops. Returns all generated ground-truth waypoints.
  List<GTWaypoint> stopSession() {
    if (_activeBlueprint == null) return [];

    final sessionEndTime = DateTime.now().millisecondsSinceEpoch;
    _interpolateAndEmitSegment(sessionEndTime);

    debugPrint(
      '[GT Service] Session complete — ${_collectedWaypoints.length} waypoints generated.',
    );

    final result = List<GTWaypoint>.from(_collectedWaypoints);
    clearSession();
    return result;
  }

  /// Interpolates the current segment at [AppConstants.gtWaypointIntervalMs] steps,
  /// then always emits the exact endpoint at [endTime].
  void _interpolateAndEmitSegment(int endTime) {
    final segment = _activeBlueprint!.segments[_currentSegmentIndex];
    final totalDurationMs = endTime - _segmentStartTime;

    if (totalDurationMs <= 0) return;

    final startX = _getSegmentStartX();
    final startY = _getSegmentStartY();
    final intervalMs = AppConstants.gtWaypointIntervalMs;
    final impliedVelocityMps = segment.distanceInMeters / (totalDurationMs / 1000.0);

    debugPrint(
      '[GT Service] Interpolating ${segment.fromNode} → ${segment.toNode}: '
      '${totalDurationMs}ms, ${segment.distanceInMeters}m, '
      '${impliedVelocityMps.toStringAsFixed(2)} m/s',
    );

    for (int t = 0; t < totalDurationMs; t += intervalMs) {
      _emitInterpolatedWaypoint(
        elapsedMs: t,
        totalDurationMs: totalDurationMs,
        startX: startX,
        startY: startY,
        segment: segment,
      );
    }

    // Always land exactly on the node at the real turn/stop timestamp.
    _emitInterpolatedWaypoint(
      elapsedMs: totalDurationMs,
      totalDurationMs: totalDurationMs,
      startX: startX,
      startY: startY,
      segment: segment,
    );

    _currentX = startX;
    _currentY = startY;
    switch (segment.direction) {
      case HeadingDirection.north:
        _currentY += segment.distanceInMeters;
        break;
      case HeadingDirection.south:
        _currentY -= segment.distanceInMeters;
        break;
      case HeadingDirection.east:
        _currentX += segment.distanceInMeters;
        break;
      case HeadingDirection.west:
        _currentX -= segment.distanceInMeters;
        break;
    }
  }

  void _emitInterpolatedWaypoint({
    required int elapsedMs,
    required int totalDurationMs,
    required double startX,
    required double startY,
    required TrajectorySegment segment,
  }) {
    final progress = elapsedMs / totalDurationMs;
    final distanceTraveled = segment.distanceInMeters * progress;

    double x = startX;
    double y = startY;

    switch (segment.direction) {
      case HeadingDirection.north:
        y += distanceTraveled;
        break;
      case HeadingDirection.south:
        y -= distanceTraveled;
        break;
      case HeadingDirection.east:
        x += distanceTraveled;
        break;
      case HeadingDirection.west:
        x -= distanceTraveled;
        break;
    }

    _emitSingleWaypoint(_segmentStartTime + elapsedMs, x, y, segment.direction);
  }

  void _emitSingleWaypoint(int timestamp, double x, double y, HeadingDirection direction) {
    final waypoint = GTWaypoint(
      ts: timestamp,
      x: double.parse(x.toStringAsFixed(3)),
      y: double.parse(y.toStringAsFixed(3)),
      heading: direction,
    );
    _collectedWaypoints.add(waypoint);
    _waypointController.add(waypoint);
  }

  double _getSegmentStartX() {
    double x = _activeBlueprint!.startX;
    for (int i = 0; i < _currentSegmentIndex; i++) {
      final seg = _activeBlueprint!.segments[i];
      if (seg.direction == HeadingDirection.east) x += seg.distanceInMeters;
      if (seg.direction == HeadingDirection.west) x -= seg.distanceInMeters;
    }
    return x;
  }

  double _getSegmentStartY() {
    double y = _activeBlueprint!.startY;
    for (int i = 0; i < _currentSegmentIndex; i++) {
      final seg = _activeBlueprint!.segments[i];
      if (seg.direction == HeadingDirection.north) y += seg.distanceInMeters;
      if (seg.direction == HeadingDirection.south) y -= seg.distanceInMeters;
    }
    return y;
  }

  void clearSession() {
    _activeBlueprint = null;
    _currentSegmentIndex = 0;
    _pathComplete = false;
    _currentX = 0.0;
    _currentY = 0.0;
    _collectedWaypoints.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _waypointController.close();
    super.dispose();
  }
}
