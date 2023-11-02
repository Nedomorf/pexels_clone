import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pexels_clone/services/http_service.dart';
import 'package:shared_preferences_monitor/shared_preferences_monitor.dart';

import 'screens/init_screen.dart';
import 'services/storage_service.dart';

final storageService = StorageService();
final httpService = HttpService();

Future main() async {
  await dotenv.load(fileName: ".env");
  storageService.initStorageService();
  httpService.initHttpService();
  await SharedPreferencesMonitor.init();
  SharedPreferencesMonitor.setKey(GlobalKey<NavigatorState>());

  return runApp(const InitScreenWrapper());
}
