import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_indoor_localization_app/models/gt_waypoint.dart';
import 'package:flutter_indoor_localization_app/models/trajectory_blueprint.dart';

class GroundTruthService extends ChangeNotifier {
  static final GroundTruthService _instance = GroundTruthService._internal();
  factory GroundTruthService() => _instance;
  GroundTruthService._internal();

  TrajectoryBlueprint? _activeBlueprint;
  int _currentSegmentIndex = 0;
  
  double _currentX = 0.0;
  double _currentY = 0.0;
  
  late int _segmentStartTime; 

  final StreamController<GTWaypoint> _waypointController = 
      StreamController<GTWaypoint>.broadcast();

  double get currentX => _currentX;
  double get currentY => _currentY;
  bool get hasActiveTrajectory => _activeBlueprint != null;
  Stream<GTWaypoint> get waypointsStream => _waypointController.stream;

  void initializeSession(TrajectoryBlueprint blueprint) {
    if (blueprint.segments.isEmpty) {
      throw ArgumentError('Blueprint must have at least one segment');
    }
    
    _activeBlueprint = blueprint;
    _currentSegmentIndex = 0;
    _currentX = blueprint.startX;
    _currentY = blueprint.startY;
    _segmentStartTime = DateTime.now().millisecondsSinceEpoch;
    
    _emitSingleWaypoint(_segmentStartTime, _currentX, _currentY, blueprint.segments.first.direction);
    notifyListeners();
  }

  /// Вызывается при фиксации ПОВОРОТА (переход на следующий отрезок)
  void nextSegment() {
    if (_activeBlueprint == null) return;

    final segmentEndTime = DateTime.now().millisecondsSinceEpoch;
    
    // 1. Ретроспективно нарезаем только что пройденный отрезок по 100 мс
    _interpolateAndEmitSegment(segmentEndTime);
    
    // 2. Только ПОСЛЕ расчета шагаем к следующему индексу сегмента
    if (_currentSegmentIndex < _activeBlueprint!.segments.length - 1) {
      _currentSegmentIndex++;
      _segmentStartTime = DateTime.now().millisecondsSinceEpoch; // Сбрасываем таймер для нового отрезка
      
      final nextSeg = _activeBlueprint!.segments[_currentSegmentIndex];
      print('[GT Service] 🔄 Переключились на: ${nextSeg.fromNode} → ${nextSeg.toNode} (${nextSeg.direction.name})');
      notifyListeners();
    } else {
      print('[GT Service] 🏁 Достигнут конец всей цепочки пресета. Идем за рамками плана.');
    }
  }

  /// Вызывается при нажатии кнопки СТОП на экране записи
  void stopSession() {
    if (_activeBlueprint == null) return;

    final sessionEndTime = DateTime.now().millisecondsSinceEpoch;
    
    // Донарезаем по 100 мс текущий отрезок до момента остановки
    _interpolateAndEmitSegment(sessionEndTime);
    
    print('[GT Service] Сессия завершена. Все точки сгенерированы.');
    clearSession();
  }

  /// Ключевой метод: берет отрезок, считает скорость и генерирует точки каждые 100 мс
  void _interpolateAndEmitSegment(int endTime) {
    final segment = _activeBlueprint!.segments[_currentSegmentIndex];
    final totalDurationMs = endTime - _segmentStartTime;
    
    if (totalDurationMs <= 0) return;

    // Точные координаты старта текущего отрезка
    final startX = _getSegmentStartX();
    final startY = _getSegmentStartY();

    print('[GT Service] 📐 Интерполяция отрезка ${segment.fromNode} → ${segment.toNode}');
    print('Пройдено за: ${totalDurationMs}мс, Длина отрезка: ${segment.distanceInMeters}м');

    // Цикл с шагом в 100 миллисекунд
    for (int t = 0; t <= totalDurationMs; t += 100) {
      final double progress = t / totalDurationMs; // Значение от 0.0 до 1.0
      final double distanceTraveled = segment.distanceInMeters * progress;

      double x = startX;
      double y = startY;

      // Считаем смещение в зависимости от компасного направления
      switch (segment.direction) {
        case HeadingDirection.north: y += distanceTraveled; break;
        case HeadingDirection.south: y -= distanceTraveled; break;
        case HeadingDirection.east:  x += distanceTraveled; break;
        case HeadingDirection.west:  x -= distanceTraveled; break;
      }

      // ВАЖНО: Передаем абсолютное системное время (миллисекунды), 
      // чтобы сопоставить этот Ground Truth с временными метками Wi-Fi и IMU сканов.
      final int absoluteTimestamp = _segmentStartTime + t;
      _emitSingleWaypoint(absoluteTimestamp, x, y, segment.direction);
    }

    // В финале обновляем глобальные координаты сервиса до эталонной точки конца отрезка
    _currentX = startX;
    _currentY = startY;
    switch (segment.direction) {
      case HeadingDirection.north: _currentY += segment.distanceInMeters; break;
      case HeadingDirection.south: _currentY -= segment.distanceInMeters; break;
      case HeadingDirection.east:  _currentX += segment.distanceInMeters; break;
      case HeadingDirection.west:  _currentX -= segment.distanceInMeters; break;
    }
  }

  void _emitSingleWaypoint(int timestamp, double x, double y, HeadingDirection direction) {
    _waypointController.add(
      GTWaypoint(
        ts: timestamp,
        x: double.parse(x.toStringAsFixed(3)), // Округляем до миллиметров для чистоты
        y: double.parse(y.toStringAsFixed(3)),
        heading: direction, 
      ),
    );
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
    _currentX = 0.0;
    _currentY = 0.0;
    notifyListeners();
  }

  @override
  void dispose() {
    _waypointController.close();
    super.dispose();
  }
}