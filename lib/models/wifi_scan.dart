import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_scan.freezed.dart';
part 'wifi_scan.g.dart';

@freezed
class WiFiScan with _$WiFiScan {
  const factory WiFiScan({
    required int ts,
    required String bssid,
    required String ssid,
    required int rssi,
    required int freq,
  }) = _WiFiScan;

  factory WiFiScan.fromJson(Map<String, dynamic> json) => 
      _$WiFiScanFromJson(json);
}
