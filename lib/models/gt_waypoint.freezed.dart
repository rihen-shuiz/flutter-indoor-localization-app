// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gt_waypoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GTWaypoint _$GTWaypointFromJson(Map<String, dynamic> json) {
  return _GTWaypoint.fromJson(json);
}

/// @nodoc
mixin _$GTWaypoint {
  int get ts => throw _privateConstructorUsedError; // timestamp (ms)
  double get x => throw _privateConstructorUsedError; // position (meters)
  double get y => throw _privateConstructorUsedError; // position (meters)
  HeadingDirection get heading => throw _privateConstructorUsedError;

  /// Serializes this GTWaypoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GTWaypoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GTWaypointCopyWith<GTWaypoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GTWaypointCopyWith<$Res> {
  factory $GTWaypointCopyWith(
    GTWaypoint value,
    $Res Function(GTWaypoint) then,
  ) = _$GTWaypointCopyWithImpl<$Res, GTWaypoint>;
  @useResult
  $Res call({int ts, double x, double y, HeadingDirection heading});
}

/// @nodoc
class _$GTWaypointCopyWithImpl<$Res, $Val extends GTWaypoint>
    implements $GTWaypointCopyWith<$Res> {
  _$GTWaypointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GTWaypoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ts = null,
    Object? x = null,
    Object? y = null,
    Object? heading = null,
  }) {
    return _then(
      _value.copyWith(
            ts: null == ts
                ? _value.ts
                : ts // ignore: cast_nullable_to_non_nullable
                      as int,
            x: null == x
                ? _value.x
                : x // ignore: cast_nullable_to_non_nullable
                      as double,
            y: null == y
                ? _value.y
                : y // ignore: cast_nullable_to_non_nullable
                      as double,
            heading: null == heading
                ? _value.heading
                : heading // ignore: cast_nullable_to_non_nullable
                      as HeadingDirection,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GTWaypointImplCopyWith<$Res>
    implements $GTWaypointCopyWith<$Res> {
  factory _$$GTWaypointImplCopyWith(
    _$GTWaypointImpl value,
    $Res Function(_$GTWaypointImpl) then,
  ) = __$$GTWaypointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int ts, double x, double y, HeadingDirection heading});
}

/// @nodoc
class __$$GTWaypointImplCopyWithImpl<$Res>
    extends _$GTWaypointCopyWithImpl<$Res, _$GTWaypointImpl>
    implements _$$GTWaypointImplCopyWith<$Res> {
  __$$GTWaypointImplCopyWithImpl(
    _$GTWaypointImpl _value,
    $Res Function(_$GTWaypointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GTWaypoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ts = null,
    Object? x = null,
    Object? y = null,
    Object? heading = null,
  }) {
    return _then(
      _$GTWaypointImpl(
        ts: null == ts
            ? _value.ts
            : ts // ignore: cast_nullable_to_non_nullable
                  as int,
        x: null == x
            ? _value.x
            : x // ignore: cast_nullable_to_non_nullable
                  as double,
        y: null == y
            ? _value.y
            : y // ignore: cast_nullable_to_non_nullable
                  as double,
        heading: null == heading
            ? _value.heading
            : heading // ignore: cast_nullable_to_non_nullable
                  as HeadingDirection,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GTWaypointImpl implements _GTWaypoint {
  const _$GTWaypointImpl({
    required this.ts,
    required this.x,
    required this.y,
    required this.heading,
  });

  factory _$GTWaypointImpl.fromJson(Map<String, dynamic> json) =>
      _$$GTWaypointImplFromJson(json);

  @override
  final int ts;
  // timestamp (ms)
  @override
  final double x;
  // position (meters)
  @override
  final double y;
  // position (meters)
  @override
  final HeadingDirection heading;

  @override
  String toString() {
    return 'GTWaypoint(ts: $ts, x: $x, y: $y, heading: $heading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GTWaypointImpl &&
            (identical(other.ts, ts) || other.ts == ts) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.heading, heading) || other.heading == heading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ts, x, y, heading);

  /// Create a copy of GTWaypoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GTWaypointImplCopyWith<_$GTWaypointImpl> get copyWith =>
      __$$GTWaypointImplCopyWithImpl<_$GTWaypointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GTWaypointImplToJson(this);
  }
}

abstract class _GTWaypoint implements GTWaypoint {
  const factory _GTWaypoint({
    required final int ts,
    required final double x,
    required final double y,
    required final HeadingDirection heading,
  }) = _$GTWaypointImpl;

  factory _GTWaypoint.fromJson(Map<String, dynamic> json) =
      _$GTWaypointImpl.fromJson;

  @override
  int get ts; // timestamp (ms)
  @override
  double get x; // position (meters)
  @override
  double get y; // position (meters)
  @override
  HeadingDirection get heading;

  /// Create a copy of GTWaypoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GTWaypointImplCopyWith<_$GTWaypointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
