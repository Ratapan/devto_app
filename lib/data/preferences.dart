import 'package:hive_flutter/hive_flutter.dart';
part 'preferences.g.dart';

@HiveType(typeId: 1)
class PreferencesModel {
  @HiveField(0)
  final String apiToken;

  @HiveField(1)
  final bool isLight;
  
  @HiveField(2)
  final bool btnLeft;

  PreferencesModel(this.apiToken, this.isLight, this.btnLeft);
}
