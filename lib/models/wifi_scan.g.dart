// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WiFiScanImpl _$$WiFiScanImplFromJson(Map<String, dynamic> json) =>
    _$WiFiScanImpl(
      ts: (json['ts'] as num).toInt(),
      bssid: json['bssid'] as String,
      ssid: json['ssid'] as String,
      rssi: (json['rssi'] as num).toInt(),
      freq: (json['freq'] as num).toInt(),
    );

Map<String, dynamic> _$$WiFiScanImplToJson(_$WiFiScanImpl instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'bssid': instance.bssid,
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'freq': instance.freq,
    };
