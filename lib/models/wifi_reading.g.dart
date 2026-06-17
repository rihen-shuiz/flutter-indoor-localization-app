// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WiFiReadingImpl _$$WiFiReadingImplFromJson(Map<String, dynamic> json) =>
    _$WiFiReadingImpl(
      ts: (json['ts'] as num).toInt(),
      bssid: json['bssid'] as String,
      ssid: json['ssid'] as String,
      rssi: (json['rssi'] as num).toInt(),
      freq: (json['freq'] as num).toInt(),
    );

Map<String, dynamic> _$$WiFiReadingImplToJson(_$WiFiReadingImpl instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'freq': instance.freq,
    };
