import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_reading.freezed.dart';
part 'wifi_reading.g.dart';

/// One row per access point per scan cycle.
/// [scanTs] = wall-clock when this scan cycle was fetched (ms epoch).
/// [lastSeenTs] = when the OS actually last saw THIS AP (ms epoch), derived
/// from the per-AP boot-relative timestamp — not the fabricated cycle time.
@freezed
abstract class WiFiReading with _$WiFiReading {
  const factory WiFiReading({
    required int scanTs,
    required int lastSeenTs,
    required String bssid,
    required String ssid,
    required int rssi,
    required int freq,
  }) = _WiFiReading;

  factory WiFiReading.fromJson(Map<String, dynamic> json) =>
      _$WiFiReadingFromJson(json);
}
