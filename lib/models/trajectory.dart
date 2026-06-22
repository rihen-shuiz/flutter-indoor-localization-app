import 'package:freezed_annotation/freezed_annotation.dart';
import 'imu_reading.dart';
import 'wifi_reading.dart';
import 'gt_waypoint.dart';

part 'trajectory.freezed.dart';
part 'trajectory.g.dart';

@freezed
abstract class Trajectory with _$Trajectory {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trajectory({
    required String trajId,
    required TrajectoryMetadata metadata,
    required List<IMUReading> imuReadings,
    required List<WiFiReading> wifiScans,
    required List<GTWaypoint> gtWaypoints,
  }) = _Trajectory;

  factory Trajectory.fromJson(Map<String, dynamic> json) =>
      _$TrajectoryFromJson(json);
}

@freezed
abstract class TrajectoryMetadata with _$TrajectoryMetadata {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TrajectoryMetadata({
    required String collector,
    required String building,
    required int floor,
    required int startTime,
    required int endTime,
    required String pathDescription,
    required String presetPathName,
    required String phoneModel,
    required String notes,
  }) = _TrajectoryMetadata;

  factory TrajectoryMetadata.fromJson(Map<String, dynamic> json) =>
      _$TrajectoryMetadataFromJson(json);
}