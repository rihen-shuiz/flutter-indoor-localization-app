// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trajectory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Trajectory _$TrajectoryFromJson(Map<String, dynamic> json) {
  return _Trajectory.fromJson(json);
}

/// @nodoc
mixin _$Trajectory {
  String get trajId => throw _privateConstructorUsedError;
  TrajectoryMetadata get metadata => throw _privateConstructorUsedError;
  List<IMUReading> get imuReadings => throw _privateConstructorUsedError;
  List<WiFiReading> get wifiScans => throw _privateConstructorUsedError;
  List<GTWaypoint> get gtWaypoints => throw _privateConstructorUsedError;

  /// Serializes this Trajectory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrajectoryCopyWith<Trajectory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrajectoryCopyWith<$Res> {
  factory $TrajectoryCopyWith(
    Trajectory value,
    $Res Function(Trajectory) then,
  ) = _$TrajectoryCopyWithImpl<$Res, Trajectory>;
  @useResult
  $Res call({
    String trajId,
    TrajectoryMetadata metadata,
    List<IMUReading> imuReadings,
    List<WiFiReading> wifiScans,
    List<GTWaypoint> gtWaypoints,
  });

  $TrajectoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$TrajectoryCopyWithImpl<$Res, $Val extends Trajectory>
    implements $TrajectoryCopyWith<$Res> {
  _$TrajectoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trajId = null,
    Object? metadata = null,
    Object? imuReadings = null,
    Object? wifiScans = null,
    Object? gtWaypoints = null,
  }) {
    return _then(
      _value.copyWith(
            trajId: null == trajId
                ? _value.trajId
                : trajId // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as TrajectoryMetadata,
            imuReadings: null == imuReadings
                ? _value.imuReadings
                : imuReadings // ignore: cast_nullable_to_non_nullable
                      as List<IMUReading>,
            wifiScans: null == wifiScans
                ? _value.wifiScans
                : wifiScans // ignore: cast_nullable_to_non_nullable
                      as List<WiFiReading>,
            gtWaypoints: null == gtWaypoints
                ? _value.gtWaypoints
                : gtWaypoints // ignore: cast_nullable_to_non_nullable
                      as List<GTWaypoint>,
          )
          as $Val,
    );
  }

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrajectoryMetadataCopyWith<$Res> get metadata {
    return $TrajectoryMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrajectoryImplCopyWith<$Res>
    implements $TrajectoryCopyWith<$Res> {
  factory _$$TrajectoryImplCopyWith(
    _$TrajectoryImpl value,
    $Res Function(_$TrajectoryImpl) then,
  ) = __$$TrajectoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String trajId,
    TrajectoryMetadata metadata,
    List<IMUReading> imuReadings,
    List<WiFiReading> wifiScans,
    List<GTWaypoint> gtWaypoints,
  });

  @override
  $TrajectoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$TrajectoryImplCopyWithImpl<$Res>
    extends _$TrajectoryCopyWithImpl<$Res, _$TrajectoryImpl>
    implements _$$TrajectoryImplCopyWith<$Res> {
  __$$TrajectoryImplCopyWithImpl(
    _$TrajectoryImpl _value,
    $Res Function(_$TrajectoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trajId = null,
    Object? metadata = null,
    Object? imuReadings = null,
    Object? wifiScans = null,
    Object? gtWaypoints = null,
  }) {
    return _then(
      _$TrajectoryImpl(
        trajId: null == trajId
            ? _value.trajId
            : trajId // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: null == metadata
            ? _value.metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as TrajectoryMetadata,
        imuReadings: null == imuReadings
            ? _value._imuReadings
            : imuReadings // ignore: cast_nullable_to_non_nullable
                  as List<IMUReading>,
        wifiScans: null == wifiScans
            ? _value._wifiScans
            : wifiScans // ignore: cast_nullable_to_non_nullable
                  as List<WiFiReading>,
        gtWaypoints: null == gtWaypoints
            ? _value._gtWaypoints
            : gtWaypoints // ignore: cast_nullable_to_non_nullable
                  as List<GTWaypoint>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrajectoryImpl implements _Trajectory {
  const _$TrajectoryImpl({
    required this.trajId,
    required this.metadata,
    required final List<IMUReading> imuReadings,
    required final List<WiFiReading> wifiScans,
    required final List<GTWaypoint> gtWaypoints,
  }) : _imuReadings = imuReadings,
       _wifiScans = wifiScans,
       _gtWaypoints = gtWaypoints;

  factory _$TrajectoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrajectoryImplFromJson(json);

  @override
  final String trajId;
  @override
  final TrajectoryMetadata metadata;
  final List<IMUReading> _imuReadings;
  @override
  List<IMUReading> get imuReadings {
    if (_imuReadings is EqualUnmodifiableListView) return _imuReadings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imuReadings);
  }

  final List<WiFiReading> _wifiScans;
  @override
  List<WiFiReading> get wifiScans {
    if (_wifiScans is EqualUnmodifiableListView) return _wifiScans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wifiScans);
  }

  final List<GTWaypoint> _gtWaypoints;
  @override
  List<GTWaypoint> get gtWaypoints {
    if (_gtWaypoints is EqualUnmodifiableListView) return _gtWaypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gtWaypoints);
  }

  @override
  String toString() {
    return 'Trajectory(trajId: $trajId, metadata: $metadata, imuReadings: $imuReadings, wifiScans: $wifiScans, gtWaypoints: $gtWaypoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrajectoryImpl &&
            (identical(other.trajId, trajId) || other.trajId == trajId) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(
              other._imuReadings,
              _imuReadings,
            ) &&
            const DeepCollectionEquality().equals(
              other._wifiScans,
              _wifiScans,
            ) &&
            const DeepCollectionEquality().equals(
              other._gtWaypoints,
              _gtWaypoints,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    trajId,
    metadata,
    const DeepCollectionEquality().hash(_imuReadings),
    const DeepCollectionEquality().hash(_wifiScans),
    const DeepCollectionEquality().hash(_gtWaypoints),
  );

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrajectoryImplCopyWith<_$TrajectoryImpl> get copyWith =>
      __$$TrajectoryImplCopyWithImpl<_$TrajectoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrajectoryImplToJson(this);
  }
}

abstract class _Trajectory implements Trajectory {
  const factory _Trajectory({
    required final String trajId,
    required final TrajectoryMetadata metadata,
    required final List<IMUReading> imuReadings,
    required final List<WiFiReading> wifiScans,
    required final List<GTWaypoint> gtWaypoints,
  }) = _$TrajectoryImpl;

  factory _Trajectory.fromJson(Map<String, dynamic> json) =
      _$TrajectoryImpl.fromJson;

  @override
  String get trajId;
  @override
  TrajectoryMetadata get metadata;
  @override
  List<IMUReading> get imuReadings;
  @override
  List<WiFiReading> get wifiScans;
  @override
  List<GTWaypoint> get gtWaypoints;

  /// Create a copy of Trajectory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrajectoryImplCopyWith<_$TrajectoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrajectoryMetadata _$TrajectoryMetadataFromJson(Map<String, dynamic> json) {
  return _TrajectoryMetadata.fromJson(json);
}

/// @nodoc
mixin _$TrajectoryMetadata {
  String get collector => throw _privateConstructorUsedError;
  String get building => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  int get startTime => throw _privateConstructorUsedError;
  int get endTime => throw _privateConstructorUsedError;
  String get pathDescription => throw _privateConstructorUsedError;
  String get presetPathName => throw _privateConstructorUsedError;
  String get phoneModel => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this TrajectoryMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrajectoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrajectoryMetadataCopyWith<TrajectoryMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrajectoryMetadataCopyWith<$Res> {
  factory $TrajectoryMetadataCopyWith(
    TrajectoryMetadata value,
    $Res Function(TrajectoryMetadata) then,
  ) = _$TrajectoryMetadataCopyWithImpl<$Res, TrajectoryMetadata>;
  @useResult
  $Res call({
    String collector,
    String building,
    int floor,
    int startTime,
    int endTime,
    String pathDescription,
    String presetPathName,
    String phoneModel,
    String notes,
  });
}

/// @nodoc
class _$TrajectoryMetadataCopyWithImpl<$Res, $Val extends TrajectoryMetadata>
    implements $TrajectoryMetadataCopyWith<$Res> {
  _$TrajectoryMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrajectoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collector = null,
    Object? building = null,
    Object? floor = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? pathDescription = null,
    Object? presetPathName = null,
    Object? phoneModel = null,
    Object? notes = null,
  }) {
    return _then(
      _value.copyWith(
            collector: null == collector
                ? _value.collector
                : collector // ignore: cast_nullable_to_non_nullable
                      as String,
            building: null == building
                ? _value.building
                : building // ignore: cast_nullable_to_non_nullable
                      as String,
            floor: null == floor
                ? _value.floor
                : floor // ignore: cast_nullable_to_non_nullable
                      as int,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as int,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as int,
            pathDescription: null == pathDescription
                ? _value.pathDescription
                : pathDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            presetPathName: null == presetPathName
                ? _value.presetPathName
                : presetPathName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneModel: null == phoneModel
                ? _value.phoneModel
                : phoneModel // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrajectoryMetadataImplCopyWith<$Res>
    implements $TrajectoryMetadataCopyWith<$Res> {
  factory _$$TrajectoryMetadataImplCopyWith(
    _$TrajectoryMetadataImpl value,
    $Res Function(_$TrajectoryMetadataImpl) then,
  ) = __$$TrajectoryMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String collector,
    String building,
    int floor,
    int startTime,
    int endTime,
    String pathDescription,
    String presetPathName,
    String phoneModel,
    String notes,
  });
}

/// @nodoc
class __$$TrajectoryMetadataImplCopyWithImpl<$Res>
    extends _$TrajectoryMetadataCopyWithImpl<$Res, _$TrajectoryMetadataImpl>
    implements _$$TrajectoryMetadataImplCopyWith<$Res> {
  __$$TrajectoryMetadataImplCopyWithImpl(
    _$TrajectoryMetadataImpl _value,
    $Res Function(_$TrajectoryMetadataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrajectoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collector = null,
    Object? building = null,
    Object? floor = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? pathDescription = null,
    Object? presetPathName = null,
    Object? phoneModel = null,
    Object? notes = null,
  }) {
    return _then(
      _$TrajectoryMetadataImpl(
        collector: null == collector
            ? _value.collector
            : collector // ignore: cast_nullable_to_non_nullable
                  as String,
        building: null == building
            ? _value.building
            : building // ignore: cast_nullable_to_non_nullable
                  as String,
        floor: null == floor
            ? _value.floor
            : floor // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as int,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as int,
        pathDescription: null == pathDescription
            ? _value.pathDescription
            : pathDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        presetPathName: null == presetPathName
            ? _value.presetPathName
            : presetPathName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneModel: null == phoneModel
            ? _value.phoneModel
            : phoneModel // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TrajectoryMetadataImpl implements _TrajectoryMetadata {
  const _$TrajectoryMetadataImpl({
    required this.collector,
    required this.building,
    required this.floor,
    required this.startTime,
    required this.endTime,
    required this.pathDescription,
    required this.presetPathName,
    required this.phoneModel,
    required this.notes,
  });

  factory _$TrajectoryMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrajectoryMetadataImplFromJson(json);

  @override
  final String collector;
  @override
  final String building;
  @override
  final int floor;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final String pathDescription;
  @override
  final String presetPathName;
  @override
  final String phoneModel;
  @override
  final String notes;

  @override
  String toString() {
    return 'TrajectoryMetadata(collector: $collector, building: $building, floor: $floor, startTime: $startTime, endTime: $endTime, pathDescription: $pathDescription, presetPathName: $presetPathName, phoneModel: $phoneModel, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrajectoryMetadataImpl &&
            (identical(other.collector, collector) ||
                other.collector == collector) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.pathDescription, pathDescription) ||
                other.pathDescription == pathDescription) &&
            (identical(other.presetPathName, presetPathName) ||
                other.presetPathName == presetPathName) &&
            (identical(other.phoneModel, phoneModel) ||
                other.phoneModel == phoneModel) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    collector,
    building,
    floor,
    startTime,
    endTime,
    pathDescription,
    presetPathName,
    phoneModel,
    notes,
  );

  /// Create a copy of TrajectoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrajectoryMetadataImplCopyWith<_$TrajectoryMetadataImpl> get copyWith =>
      __$$TrajectoryMetadataImplCopyWithImpl<_$TrajectoryMetadataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TrajectoryMetadataImplToJson(this);
  }
}

abstract class _TrajectoryMetadata implements TrajectoryMetadata {
  const factory _TrajectoryMetadata({
    required final String collector,
    required final String building,
    required final int floor,
    required final int startTime,
    required final int endTime,
    required final String pathDescription,
    required final String presetPathName,
    required final String phoneModel,
    required final String notes,
  }) = _$TrajectoryMetadataImpl;

  factory _TrajectoryMetadata.fromJson(Map<String, dynamic> json) =
      _$TrajectoryMetadataImpl.fromJson;

  @override
  String get collector;
  @override
  String get building;
  @override
  int get floor;
  @override
  int get startTime;
  @override
  int get endTime;
  @override
  String get pathDescription;
  @override
  String get presetPathName;
  @override
  String get phoneModel;
  @override
  String get notes;

  /// Create a copy of TrajectoryMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrajectoryMetadataImplCopyWith<_$TrajectoryMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
