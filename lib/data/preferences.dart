import 'package:hive_flutter/hive_flutter.dart';
part 'preferences.g.dart';

@HiveType(typeId: 1)
class PreferencesModel {
  @HiveField(0)
  final String apiToken;

  @HiveField(1)
  final bool isLight;

  PreferencesModel(this.apiToken, this.isLight);
}
