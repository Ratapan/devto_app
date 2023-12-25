import 'package:devto_app/data/preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHiveBD() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PreferencesModelAdapter());
}
