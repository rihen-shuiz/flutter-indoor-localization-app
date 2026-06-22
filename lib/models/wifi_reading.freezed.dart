// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WiFiReading {

 int get ts; String get bssid; String get ssid; int get rssi; int get freq;
/// Create a copy of WiFiReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WiFiReadingCopyWith<WiFiReading> get copyWith => _$WiFiReadingCopyWithImpl<WiFiReading>(this as WiFiReading, _$identity);

  /// Serializes this WiFiReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WiFiReading&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.bssid, bssid) || other.bssid == bssid)&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.freq, freq) || other.freq == freq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,bssid,ssid,rssi,freq);

@override
String toString() {
  return 'WiFiReading(ts: $ts, bssid: $bssid, ssid: $ssid, rssi: $rssi, freq: $freq)';
}


}

/// @nodoc
abstract mixin class $WiFiReadingCopyWith<$Res>  {
  factory $WiFiReadingCopyWith(WiFiReading value, $Res Function(WiFiReading) _then) = _$WiFiReadingCopyWithImpl;
@useResult
$Res call({
 int ts, String bssid, String ssid, int rssi, int freq
});




}
/// @nodoc
class _$WiFiReadingCopyWithImpl<$Res>
    implements $WiFiReadingCopyWith<$Res> {
  _$WiFiReadingCopyWithImpl(this._self, this._then);

  final WiFiReading _self;
  final $Res Function(WiFiReading) _then;

/// Create a copy of WiFiReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ts = null,Object? bssid = null,Object? ssid = null,Object? rssi = null,Object? freq = null,}) {
  return _then(WiFiReading(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,bssid: null == bssid ? _self.bssid : bssid // ignore: cast_nullable_to_non_nullable
as String,ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WiFiReading].
extension WiFiReadingPatterns on WiFiReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WiFiReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WiFiReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WiFiReading value)  $default,){
final _that = this;
switch (_that) {
case _WiFiReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WiFiReading value)?  $default,){
final _that = this;
switch (_that) {
case _WiFiReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ts,  String bssid,  String ssid,  int rssi,  int freq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WiFiReading() when $default != null:
return $default(_that.ts,_that.bssid,_that.ssid,_that.rssi,_that.freq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ts,  String bssid,  String ssid,  int rssi,  int freq)  $default,) {final _that = this;
switch (_that) {
case _WiFiReading():
return $default(_that.ts,_that.bssid,_that.ssid,_that.rssi,_that.freq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ts,  String bssid,  String ssid,  int rssi,  int freq)?  $default,) {final _that = this;
switch (_that) {
case _WiFiReading() when $default != null:
return $default(_that.ts,_that.bssid,_that.ssid,_that.rssi,_that.freq);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WiFiReading implements WiFiReading {
  const _WiFiReading({required this.ts, required this.bssid, required this.ssid, required this.rssi, required this.freq});
  factory _WiFiReading.fromJson(Map<String, dynamic> json) => _$WiFiReadingFromJson(json);

@override final  int ts;
@override final  String bssid;
@override final  String ssid;
@override final  int rssi;
@override final  int freq;

/// Create a copy of WiFiReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WiFiReadingCopyWith<_WiFiReading> get copyWith => __$WiFiReadingCopyWithImpl<_WiFiReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WiFiReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WiFiReading&&(identical(other.ts, ts) || other.ts == ts)&&(identical(other.bssid, bssid) || other.bssid == bssid)&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.freq, freq) || other.freq == freq));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ts,bssid,ssid,rssi,freq);

@override
String toString() {
  return 'WiFiReading(ts: $ts, bssid: $bssid, ssid: $ssid, rssi: $rssi, freq: $freq)';
}


}

/// @nodoc
abstract mixin class _$WiFiReadingCopyWith<$Res> implements $WiFiReadingCopyWith<$Res> {
  factory _$WiFiReadingCopyWith(_WiFiReading value, $Res Function(_WiFiReading) _then) = __$WiFiReadingCopyWithImpl;
@override @useResult
$Res call({
 int ts, String bssid, String ssid, int rssi, int freq
});




}
/// @nodoc
class __$WiFiReadingCopyWithImpl<$Res>
    implements _$WiFiReadingCopyWith<$Res> {
  __$WiFiReadingCopyWithImpl(this._self, this._then);

  final _WiFiReading _self;
  final $Res Function(_WiFiReading) _then;

/// Create a copy of WiFiReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ts = null,Object? bssid = null,Object? ssid = null,Object? rssi = null,Object? freq = null,}) {
  return _then(_WiFiReading(
ts: null == ts ? _self.ts : ts // ignore: cast_nullable_to_non_nullable
as int,bssid: null == bssid ? _self.bssid : bssid // ignore: cast_nullable_to_non_nullable
as String,ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,freq: null == freq ? _self.freq : freq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
