import 'package:devto_app/data/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ApiTokenProvider extends ChangeNotifier {
  String _apiToken = '';
  late Box<PreferencesModel> _preferencesBox;

  ApiTokenProvider() {
    init();
  }

  String get apiToken => _apiToken;

  Future<void> init() async {
    _preferencesBox = await Hive.openBox<PreferencesModel>('preferencesBox');
    final prefs = _preferencesBox.get('apiPrefs');
    if (prefs != null) {
      _apiToken = prefs.apiToken;
    } else {
      // Establece un valor predeterminado o deja el token vacío si es lo adecuado
      await _preferencesBox.put('apiPrefs', PreferencesModel('', true, true));
    }
    notifyListeners();
  }

  Future<void> setApiToken(String newToken) async {
    _apiToken = newToken;
    final prefs = _preferencesBox.get('apiPrefs');
    if (prefs != null) {
      await _preferencesBox.put('apiPrefs',
          PreferencesModel(newToken, prefs.isLight, prefs.btnLeft));
    }
    notifyListeners();
  }
}
