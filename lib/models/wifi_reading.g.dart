// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WiFiReading _$WiFiReadingFromJson(Map<String, dynamic> json) => _WiFiReading(
  ts: (json['ts'] as num).toInt(),
  bssid: json['bssid'] as String,
  ssid: json['ssid'] as String,
  rssi: (json['rssi'] as num).toInt(),
  freq: (json['freq'] as num).toInt(),
);

Map<String, dynamic> _$WiFiReadingToJson(_WiFiReading instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'freq': instance.freq,
    };
