// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_scan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WiFiScan _$WiFiScanFromJson(Map<String, dynamic> json) {
  return _WiFiScan.fromJson(json);
}

/// @nodoc
mixin _$WiFiScan {
  int get ts => throw _privateConstructorUsedError;
  String get bssid => throw _privateConstructorUsedError;
  String get ssid => throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;
  int get freq => throw _privateConstructorUsedError;

  /// Serializes this WiFiScan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WiFiScan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WiFiScanCopyWith<WiFiScan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WiFiScanCopyWith<$Res> {
  factory $WiFiScanCopyWith(WiFiScan value, $Res Function(WiFiScan) then) =
      _$WiFiScanCopyWithImpl<$Res, WiFiScan>;
  @useResult
  $Res call({int ts, String bssid, String ssid, int rssi, int freq});
}

/// @nodoc
class _$WiFiScanCopyWithImpl<$Res, $Val extends WiFiScan>
    implements $WiFiScanCopyWith<$Res> {
  _$WiFiScanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WiFiScan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ts = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? rssi = null,
    Object? freq = null,
  }) {
    return _then(
      _value.copyWith(
            ts: null == ts
                ? _value.ts
                : ts // ignore: cast_nullable_to_non_nullable
                      as int,
            bssid: null == bssid
                ? _value.bssid
                : bssid // ignore: cast_nullable_to_non_nullable
                      as String,
            ssid: null == ssid
                ? _value.ssid
                : ssid // ignore: cast_nullable_to_non_nullable
                      as String,
            rssi: null == rssi
                ? _value.rssi
                : rssi // ignore: cast_nullable_to_non_nullable
                      as int,
            freq: null == freq
                ? _value.freq
                : freq // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WiFiScanImplCopyWith<$Res>
    implements $WiFiScanCopyWith<$Res> {
  factory _$$WiFiScanImplCopyWith(
    _$WiFiScanImpl value,
    $Res Function(_$WiFiScanImpl) then,
  ) = __$$WiFiScanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int ts, String bssid, String ssid, int rssi, int freq});
}

/// @nodoc
class __$$WiFiScanImplCopyWithImpl<$Res>
    extends _$WiFiScanCopyWithImpl<$Res, _$WiFiScanImpl>
    implements _$$WiFiScanImplCopyWith<$Res> {
  __$$WiFiScanImplCopyWithImpl(
    _$WiFiScanImpl _value,
    $Res Function(_$WiFiScanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WiFiScan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ts = null,
    Object? bssid = null,
    Object? ssid = null,
    Object? rssi = null,
    Object? freq = null,
  }) {
    return _then(
      _$WiFiScanImpl(
        ts: null == ts
            ? _value.ts
            : ts // ignore: cast_nullable_to_non_nullable
                  as int,
        bssid: null == bssid
            ? _value.bssid
            : bssid // ignore: cast_nullable_to_non_nullable
                  as String,
        ssid: null == ssid
            ? _value.ssid
            : ssid // ignore: cast_nullable_to_non_nullable
                  as String,
        rssi: null == rssi
            ? _value.rssi
            : rssi // ignore: cast_nullable_to_non_nullable
                  as int,
        freq: null == freq
            ? _value.freq
            : freq // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WiFiScanImpl implements _WiFiScan {
  const _$WiFiScanImpl({
    required this.ts,
    required this.bssid,
    required this.ssid,
    required this.rssi,
    required this.freq,
  });

  factory _$WiFiScanImpl.fromJson(Map<String, dynamic> json) =>
      _$$WiFiScanImplFromJson(json);

  @override
  final int ts;
  @override
  final String bssid;
  @override
  final String ssid;
  @override
  final int rssi;
  @override
  final int freq;

  @override
  String toString() {
    return 'WiFiScan(ts: $ts, bssid: $bssid, ssid: $ssid, rssi: $rssi, freq: $freq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WiFiScanImpl &&
            (identical(other.ts, ts) || other.ts == ts) &&
            (identical(other.bssid, bssid) || other.bssid == bssid) &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.freq, freq) || other.freq == freq));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ts, bssid, ssid, rssi, freq);

  /// Create a copy of WiFiScan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WiFiScanImplCopyWith<_$WiFiScanImpl> get copyWith =>
      __$$WiFiScanImplCopyWithImpl<_$WiFiScanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WiFiScanImplToJson(this);
  }
}

abstract class _WiFiScan implements WiFiScan {
  const factory _WiFiScan({
    required final int ts,
    required final String bssid,
    required final String ssid,
    required final int rssi,
    required final int freq,
  }) = _$WiFiScanImpl;

  factory _WiFiScan.fromJson(Map<String, dynamic> json) =
      _$WiFiScanImpl.fromJson;

  @override
  int get ts;
  @override
  String get bssid;
  @override
  String get ssid;
  @override
  int get rssi;
  @override
  int get freq;

  /// Create a copy of WiFiScan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WiFiScanImplCopyWith<_$WiFiScanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
