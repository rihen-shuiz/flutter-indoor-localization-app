// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trajectory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Trajectory {

 String get trajId; TrajectoryMetadata get metadata; List<IMUReading> get imuReadings; List<WiFiReading> get wifiScans; List<GTWaypoint> get gtWaypoints;
/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrajectoryCopyWith<Trajectory> get copyWith => _$TrajectoryCopyWithImpl<Trajectory>(this as Trajectory, _$identity);

  /// Serializes this Trajectory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trajectory&&(identical(other.trajId, trajId) || other.trajId == trajId)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.imuReadings, imuReadings)&&const DeepCollectionEquality().equals(other.wifiScans, wifiScans)&&const DeepCollectionEquality().equals(other.gtWaypoints, gtWaypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trajId,metadata,const DeepCollectionEquality().hash(imuReadings),const DeepCollectionEquality().hash(wifiScans),const DeepCollectionEquality().hash(gtWaypoints));

@override
String toString() {
  return 'Trajectory(trajId: $trajId, metadata: $metadata, imuReadings: $imuReadings, wifiScans: $wifiScans, gtWaypoints: $gtWaypoints)';
}


}

/// @nodoc
abstract mixin class $TrajectoryCopyWith<$Res>  {
  factory $TrajectoryCopyWith(Trajectory value, $Res Function(Trajectory) _then) = _$TrajectoryCopyWithImpl;
@useResult
$Res call({
 String trajId, TrajectoryMetadata metadata, List<IMUReading> imuReadings, List<WiFiReading> wifiScans, List<GTWaypoint> gtWaypoints
});


$TrajectoryMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$TrajectoryCopyWithImpl<$Res>
    implements $TrajectoryCopyWith<$Res> {
  _$TrajectoryCopyWithImpl(this._self, this._then);

  final Trajectory _self;
  final $Res Function(Trajectory) _then;

/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trajId = null,Object? metadata = null,Object? imuReadings = null,Object? wifiScans = null,Object? gtWaypoints = null,}) {
  return _then(Trajectory(
trajId: null == trajId ? _self.trajId : trajId // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as TrajectoryMetadata,imuReadings: null == imuReadings ? _self.imuReadings : imuReadings // ignore: cast_nullable_to_non_nullable
as List<IMUReading>,wifiScans: null == wifiScans ? _self.wifiScans : wifiScans // ignore: cast_nullable_to_non_nullable
as List<WiFiReading>,gtWaypoints: null == gtWaypoints ? _self.gtWaypoints : gtWaypoints // ignore: cast_nullable_to_non_nullable
as List<GTWaypoint>,
  ));
}
/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrajectoryMetadataCopyWith<$Res> get metadata {
  
  return $TrajectoryMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trajectory].
extension TrajectoryPatterns on Trajectory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trajectory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trajectory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trajectory value)  $default,){
final _that = this;
switch (_that) {
case _Trajectory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trajectory value)?  $default,){
final _that = this;
switch (_that) {
case _Trajectory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trajId,  TrajectoryMetadata metadata,  List<IMUReading> imuReadings,  List<WiFiReading> wifiScans,  List<GTWaypoint> gtWaypoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trajectory() when $default != null:
return $default(_that.trajId,_that.metadata,_that.imuReadings,_that.wifiScans,_that.gtWaypoints);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trajId,  TrajectoryMetadata metadata,  List<IMUReading> imuReadings,  List<WiFiReading> wifiScans,  List<GTWaypoint> gtWaypoints)  $default,) {final _that = this;
switch (_that) {
case _Trajectory():
return $default(_that.trajId,_that.metadata,_that.imuReadings,_that.wifiScans,_that.gtWaypoints);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trajId,  TrajectoryMetadata metadata,  List<IMUReading> imuReadings,  List<WiFiReading> wifiScans,  List<GTWaypoint> gtWaypoints)?  $default,) {final _that = this;
switch (_that) {
case _Trajectory() when $default != null:
return $default(_that.trajId,_that.metadata,_that.imuReadings,_that.wifiScans,_that.gtWaypoints);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Trajectory implements Trajectory {
  const _Trajectory({required this.trajId, required this.metadata, required  List<IMUReading> imuReadings, required  List<WiFiReading> wifiScans, required  List<GTWaypoint> gtWaypoints}): _imuReadings = imuReadings,_wifiScans = wifiScans,_gtWaypoints = gtWaypoints;
  factory _Trajectory.fromJson(Map<String, dynamic> json) => _$TrajectoryFromJson(json);

@override final  String trajId;
@override final  TrajectoryMetadata metadata;
 final  List<IMUReading> _imuReadings;
@override List<IMUReading> get imuReadings {
  if (_imuReadings is EqualUnmodifiableListView) return _imuReadings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imuReadings);
}

 final  List<WiFiReading> _wifiScans;
@override List<WiFiReading> get wifiScans {
  if (_wifiScans is EqualUnmodifiableListView) return _wifiScans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wifiScans);
}

 final  List<GTWaypoint> _gtWaypoints;
@override List<GTWaypoint> get gtWaypoints {
  if (_gtWaypoints is EqualUnmodifiableListView) return _gtWaypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gtWaypoints);
}


/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrajectoryCopyWith<_Trajectory> get copyWith => __$TrajectoryCopyWithImpl<_Trajectory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrajectoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trajectory&&(identical(other.trajId, trajId) || other.trajId == trajId)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._imuReadings, _imuReadings)&&const DeepCollectionEquality().equals(other._wifiScans, _wifiScans)&&const DeepCollectionEquality().equals(other._gtWaypoints, _gtWaypoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trajId,metadata,const DeepCollectionEquality().hash(_imuReadings),const DeepCollectionEquality().hash(_wifiScans),const DeepCollectionEquality().hash(_gtWaypoints));

@override
String toString() {
  return 'Trajectory(trajId: $trajId, metadata: $metadata, imuReadings: $imuReadings, wifiScans: $wifiScans, gtWaypoints: $gtWaypoints)';
}


}

/// @nodoc
abstract mixin class _$TrajectoryCopyWith<$Res> implements $TrajectoryCopyWith<$Res> {
  factory _$TrajectoryCopyWith(_Trajectory value, $Res Function(_Trajectory) _then) = __$TrajectoryCopyWithImpl;
@override @useResult
$Res call({
 String trajId, TrajectoryMetadata metadata, List<IMUReading> imuReadings, List<WiFiReading> wifiScans, List<GTWaypoint> gtWaypoints
});


@override $TrajectoryMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$TrajectoryCopyWithImpl<$Res>
    implements _$TrajectoryCopyWith<$Res> {
  __$TrajectoryCopyWithImpl(this._self, this._then);

  final _Trajectory _self;
  final $Res Function(_Trajectory) _then;

/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trajId = null,Object? metadata = null,Object? imuReadings = null,Object? wifiScans = null,Object? gtWaypoints = null,}) {
  return _then(_Trajectory(
trajId: null == trajId ? _self.trajId : trajId // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as TrajectoryMetadata,imuReadings: null == imuReadings ? _self._imuReadings : imuReadings // ignore: cast_nullable_to_non_nullable
as List<IMUReading>,wifiScans: null == wifiScans ? _self._wifiScans : wifiScans // ignore: cast_nullable_to_non_nullable
as List<WiFiReading>,gtWaypoints: null == gtWaypoints ? _self._gtWaypoints : gtWaypoints // ignore: cast_nullable_to_non_nullable
as List<GTWaypoint>,
  ));
}

/// Create a copy of Trajectory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrajectoryMetadataCopyWith<$Res> get metadata {
  
  return $TrajectoryMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$TrajectoryMetadata {

 String get collector; String get building; int get floor; int get startTime; int get endTime; String get pathDescription; String get presetPathName; String get phoneModel; String get notes;
/// Create a copy of TrajectoryMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrajectoryMetadataCopyWith<TrajectoryMetadata> get copyWith => _$TrajectoryMetadataCopyWithImpl<TrajectoryMetadata>(this as TrajectoryMetadata, _$identity);

  /// Serializes this TrajectoryMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrajectoryMetadata&&(identical(other.collector, collector) || other.collector == collector)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.pathDescription, pathDescription) || other.pathDescription == pathDescription)&&(identical(other.presetPathName, presetPathName) || other.presetPathName == presetPathName)&&(identical(other.phoneModel, phoneModel) || other.phoneModel == phoneModel)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,collector,building,floor,startTime,endTime,pathDescription,presetPathName,phoneModel,notes);

@override
String toString() {
  return 'TrajectoryMetadata(collector: $collector, building: $building, floor: $floor, startTime: $startTime, endTime: $endTime, pathDescription: $pathDescription, presetPathName: $presetPathName, phoneModel: $phoneModel, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TrajectoryMetadataCopyWith<$Res>  {
  factory $TrajectoryMetadataCopyWith(TrajectoryMetadata value, $Res Function(TrajectoryMetadata) _then) = _$TrajectoryMetadataCopyWithImpl;
@useResult
$Res call({
 String collector, String building, int floor, int startTime, int endTime, String pathDescription, String presetPathName, String phoneModel, String notes
});




}
/// @nodoc
class _$TrajectoryMetadataCopyWithImpl<$Res>
    implements $TrajectoryMetadataCopyWith<$Res> {
  _$TrajectoryMetadataCopyWithImpl(this._self, this._then);

  final TrajectoryMetadata _self;
  final $Res Function(TrajectoryMetadata) _then;

/// Create a copy of TrajectoryMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collector = null,Object? building = null,Object? floor = null,Object? startTime = null,Object? endTime = null,Object? pathDescription = null,Object? presetPathName = null,Object? phoneModel = null,Object? notes = null,}) {
  return _then(TrajectoryMetadata(
collector: null == collector ? _self.collector : collector // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,pathDescription: null == pathDescription ? _self.pathDescription : pathDescription // ignore: cast_nullable_to_non_nullable
as String,presetPathName: null == presetPathName ? _self.presetPathName : presetPathName // ignore: cast_nullable_to_non_nullable
as String,phoneModel: null == phoneModel ? _self.phoneModel : phoneModel // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrajectoryMetadata].
extension TrajectoryMetadataPatterns on TrajectoryMetadata {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrajectoryMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrajectoryMetadata() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrajectoryMetadata value)  $default,){
final _that = this;
switch (_that) {
case _TrajectoryMetadata():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrajectoryMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _TrajectoryMetadata() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String collector,  String building,  int floor,  int startTime,  int endTime,  String pathDescription,  String presetPathName,  String phoneModel,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrajectoryMetadata() when $default != null:
return $default(_that.collector,_that.building,_that.floor,_that.startTime,_that.endTime,_that.pathDescription,_that.presetPathName,_that.phoneModel,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String collector,  String building,  int floor,  int startTime,  int endTime,  String pathDescription,  String presetPathName,  String phoneModel,  String notes)  $default,) {final _that = this;
switch (_that) {
case _TrajectoryMetadata():
return $default(_that.collector,_that.building,_that.floor,_that.startTime,_that.endTime,_that.pathDescription,_that.presetPathName,_that.phoneModel,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String collector,  String building,  int floor,  int startTime,  int endTime,  String pathDescription,  String presetPathName,  String phoneModel,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _TrajectoryMetadata() when $default != null:
return $default(_that.collector,_that.building,_that.floor,_that.startTime,_that.endTime,_that.pathDescription,_that.presetPathName,_that.phoneModel,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TrajectoryMetadata implements TrajectoryMetadata {
  const _TrajectoryMetadata({required this.collector, required this.building, required this.floor, required this.startTime, required this.endTime, required this.pathDescription, required this.presetPathName, required this.phoneModel, required this.notes});
  factory _TrajectoryMetadata.fromJson(Map<String, dynamic> json) => _$TrajectoryMetadataFromJson(json);

@override final  String collector;
@override final  String building;
@override final  int floor;
@override final  int startTime;
@override final  int endTime;
@override final  String pathDescription;
@override final  String presetPathName;
@override final  String phoneModel;
@override final  String notes;

/// Create a copy of TrajectoryMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrajectoryMetadataCopyWith<_TrajectoryMetadata> get copyWith => __$TrajectoryMetadataCopyWithImpl<_TrajectoryMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrajectoryMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrajectoryMetadata&&(identical(other.collector, collector) || other.collector == collector)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.pathDescription, pathDescription) || other.pathDescription == pathDescription)&&(identical(other.presetPathName, presetPathName) || other.presetPathName == presetPathName)&&(identical(other.phoneModel, phoneModel) || other.phoneModel == phoneModel)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,collector,building,floor,startTime,endTime,pathDescription,presetPathName,phoneModel,notes);

@override
String toString() {
  return 'TrajectoryMetadata(collector: $collector, building: $building, floor: $floor, startTime: $startTime, endTime: $endTime, pathDescription: $pathDescription, presetPathName: $presetPathName, phoneModel: $phoneModel, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TrajectoryMetadataCopyWith<$Res> implements $TrajectoryMetadataCopyWith<$Res> {
  factory _$TrajectoryMetadataCopyWith(_TrajectoryMetadata value, $Res Function(_TrajectoryMetadata) _then) = __$TrajectoryMetadataCopyWithImpl;
@override @useResult
$Res call({
 String collector, String building, int floor, int startTime, int endTime, String pathDescription, String presetPathName, String phoneModel, String notes
});




}
/// @nodoc
class __$TrajectoryMetadataCopyWithImpl<$Res>
    implements _$TrajectoryMetadataCopyWith<$Res> {
  __$TrajectoryMetadataCopyWithImpl(this._self, this._then);

  final _TrajectoryMetadata _self;
  final $Res Function(_TrajectoryMetadata) _then;

/// Create a copy of TrajectoryMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collector = null,Object? building = null,Object? floor = null,Object? startTime = null,Object? endTime = null,Object? pathDescription = null,Object? presetPathName = null,Object? phoneModel = null,Object? notes = null,}) {
  return _then(_TrajectoryMetadata(
collector: null == collector ? _self.collector : collector // ignore: cast_nullable_to_non_nullable
as String,building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String,floor: null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,pathDescription: null == pathDescription ? _self.pathDescription : pathDescription // ignore: cast_nullable_to_non_nullable
as String,presetPathName: null == presetPathName ? _self.presetPathName : presetPathName // ignore: cast_nullable_to_non_nullable
as String,phoneModel: null == phoneModel ? _self.phoneModel : phoneModel // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
