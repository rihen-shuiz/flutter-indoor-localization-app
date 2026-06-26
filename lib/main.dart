import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Clear, direct imports from your actual directories
import 'package:flutter_indoor_localization_app/screens/recording_screen.dart';
import 'package:flutter_indoor_localization_app/services/imu_service.dart';
import 'package:flutter_indoor_localization_app/services/wifi_service.dart';
import 'package:flutter_indoor_localization_app/services/ground_truth_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IMUService>(create: (_) => IMUService()),
        Provider<WiFiService>(create: (_) => WiFiService()),
        ChangeNotifierProvider(create: (_) => GroundTruthService())
      ],
      child: MaterialApp(
        title: 'Indoor Localization PDR',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: const RecordingScreen(),
      ),
    );
  }
}