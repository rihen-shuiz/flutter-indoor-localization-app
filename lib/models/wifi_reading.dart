import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_reading.freezed.dart';
part 'wifi_reading.g.dart';

@freezed
class WiFiReading with _$WiFiReading {
  const factory WiFiReading({
    required int ts,
    required String bssid,
    required String ssid,
    required int rssi,
    required int freq,
  }) = _WiFiReading;

  factory WiFiReading.fromJson(Map<String, dynamic> json) => 
      _$WiFiReadingFromJson(json);
}
