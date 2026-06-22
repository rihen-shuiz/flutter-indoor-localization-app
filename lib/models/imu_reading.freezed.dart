// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IMUReading {

 int get ts; String get sensor; double get x; double get y; double get z;
/// Create a copy of IMUReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IMUReadingCopyWith<IMUReading> get copyWith => _$IMUReadingCopyWithImpl<IMUReading>(this as IMUReading, _$identity);

  /// Serializes this IMUReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IMUReading&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,sensor,x,y,z);

@override
String toString() {
  return 'IMUReading(ts: $ts, sensor: $sensor, x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class $IMUReadingCopyWith<$Res>  {
  factory $IMUReadingCopyWith(IMUReading value, $Res Function(IMUReading) _then) = _$IMUReadingCopyWithImpl;
@useResult
$Res call({
 int ts, String sensor, double x, double y, double z
});




}
/// @nodoc
class _$IMUReadingCopyWithImpl<$Res>
    implements $IMUReadingCopyWith<$Res> {
  _$IMUReadingCopyWithImpl(this._self, this._then);

  final IMUReading _self;
  final $Res Function(IMUReading) _then;

/// Create a copy of IMUReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ts = null,Object? sensor = null,Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(IMUReading(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [IMUReading].
extension IMUReadingPatterns on IMUReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IMUReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IMUReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IMUReading value)  $default,){
final _that = this;
switch (_that) {
case _IMUReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IMUReading value)?  $default,){
final _that = this;
switch (_that) {
case _IMUReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ts,  String sensor,  double x,  double y,  double z)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IMUReading() when $default != null:
return $default(_that.ts,_that.sensor,_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ts,  String sensor,  double x,  double y,  double z)  $default,) {final _that = this;
switch (_that) {
case _IMUReading():
return $default(_that.ts,_that.sensor,_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ts,  String sensor,  double x,  double y,  double z)?  $default,) {final _that = this;
switch (_that) {
case _IMUReading() when $default != null:
return $default(_that.ts,_that.sensor,_that.x,_that.y,_that.z);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IMUReading implements IMUReading {
  const _IMUReading({required this.ts, required this.sensor, required this.x, required this.y, required this.z});
  factory _IMUReading.fromJson(Map<String, dynamic> json) => _$IMUReadingFromJson(json);

@override final  int ts;
@override final  String sensor;
@override final  double x;
@override final  double y;
@override final  double z;

/// Create a copy of IMUReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IMUReadingCopyWith<_IMUReading> get copyWith => __$IMUReadingCopyWithImpl<_IMUReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IMUReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IMUReading&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.sensor, sensor) || other.sensor == sensor)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,sensor,x,y,z);

@override
String toString() {
  return 'IMUReading(ts: $ts, sensor: $sensor, x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class _$IMUReadingCopyWith<$Res> implements $IMUReadingCopyWith<$Res> {
  factory _$IMUReadingCopyWith(_IMUReading value, $Res Function(_IMUReading) _then) = __$IMUReadingCopyWithImpl;
@override @useResult
$Res call({
 int ts, String sensor, double x, double y, double z
});




}
/// @nodoc
class __$IMUReadingCopyWithImpl<$Res>
    implements _$IMUReadingCopyWith<$Res> {
  __$IMUReadingCopyWithImpl(this._self, this._then);

  final _IMUReading _self;
  final $Res Function(_IMUReading) _then;

/// Create a copy of IMUReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ts = null,Object? sensor = null,Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_IMUReading(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,sensor: null == sensor ? _self.sensor : sensor // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
