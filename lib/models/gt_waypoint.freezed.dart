// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gt_waypoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GTWaypoint {

 int get ts; double get x; double get y; HeadingDirection get heading;
/// Create a copy of GTWaypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GTWaypointCopyWith<GTWaypoint> get copyWith => _$GTWaypointCopyWithImpl<GTWaypoint>(this as GTWaypoint, _$identity);

  /// Serializes this GTWaypoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GTWaypoint&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.heading, heading) || other.heading == heading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,x,y,heading);

@override
String toString() {
  return 'GTWaypoint(ts: $ts, x: $x, y: $y, heading: $heading)';
}


}

/// @nodoc
abstract mixin class $GTWaypointCopyWith<$Res>  {
  factory $GTWaypointCopyWith(GTWaypoint value, $Res Function(GTWaypoint) _then) = _$GTWaypointCopyWithImpl;
@useResult
$Res call({
 int ts, double x, double y, HeadingDirection heading
});




}
/// @nodoc
class _$GTWaypointCopyWithImpl<$Res>
    implements $GTWaypointCopyWith<$Res> {
  _$GTWaypointCopyWithImpl(this._self, this._then);

  final GTWaypoint _self;
  final $Res Function(GTWaypoint) _then;

/// Create a copy of GTWaypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ts = null,Object? x = null,Object? y = null,Object? heading = null,}) {
  return _then(GTWaypoint(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as HeadingDirection,
  ));
}

}


/// Adds pattern-matching-related methods to [GTWaypoint].
extension GTWaypointPatterns on GTWaypoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GTWaypoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GTWaypoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GTWaypoint value)  $default,){
final _that = this;
switch (_that) {
case _GTWaypoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GTWaypoint value)?  $default,){
final _that = this;
switch (_that) {
case _GTWaypoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ts,  double x,  double y,  HeadingDirection heading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GTWaypoint() when $default != null:
return $default(_that.ts,_that.x,_that.y,_that.heading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ts,  double x,  double y,  HeadingDirection heading)  $default,) {final _that = this;
switch (_that) {
case _GTWaypoint():
return $default(_that.ts,_that.x,_that.y,_that.heading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ts,  double x,  double y,  HeadingDirection heading)?  $default,) {final _that = this;
switch (_that) {
case _GTWaypoint() when $default != null:
return $default(_that.ts,_that.x,_that.y,_that.heading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GTWaypoint implements GTWaypoint {
  const _GTWaypoint({required this.ts, required this.x, required this.y, required this.heading});
  factory _GTWaypoint.fromJson(Map<String, dynamic> json) => _$GTWaypointFromJson(json);

@override final  int ts;
@override final  double x;
@override final  double y;
@override final  HeadingDirection heading;

/// Create a copy of GTWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GTWaypointCopyWith<_GTWaypoint> get copyWith => __$GTWaypointCopyWithImpl<_GTWaypoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GTWaypointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GTWaypoint&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.heading, heading) || other.heading == heading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,x,y,heading);

@override
String toString() {
  return 'GTWaypoint(ts: $ts, x: $x, y: $y, heading: $heading)';
}


}

/// @nodoc
abstract mixin class _$GTWaypointCopyWith<$Res> implements $GTWaypointCopyWith<$Res> {
  factory _$GTWaypointCopyWith(_GTWaypoint value, $Res Function(_GTWaypoint) _then) = __$GTWaypointCopyWithImpl;
@override @useResult
$Res call({
 int ts, double x, double y, HeadingDirection heading
});




}
/// @nodoc
class __$GTWaypointCopyWithImpl<$Res>
    implements _$GTWaypointCopyWith<$Res> {
  __$GTWaypointCopyWithImpl(this._self, this._then);

  final _GTWaypoint _self;
  final $Res Function(_GTWaypoint) _then;

/// Create a copy of GTWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ts = null,Object? x = null,Object? y = null,Object? heading = null,}) {
  return _then(_GTWaypoint(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as HeadingDirection,
  ));
}


}

// dart format on
