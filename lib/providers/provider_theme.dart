import 'package:devto_app/data/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme;
  late Box<PreferencesModel> _preferencesBox;

  ThemeProvider() : _currentTheme = ThemeData.light() {
    _init();
  }

  ThemeData get currentTheme => _currentTheme;

  Future<void> _init() async {
    // Abre la caja de Hive
    _preferencesBox = await Hive.openBox<PreferencesModel>('preferencesBox');

    // Carga el estado del tema
    final prefs = _preferencesBox.get('themePrefs');

    if (prefs != null) {
      _currentTheme = prefs.isLight ? ThemeData.light() : ThemeData.dark();
    } else {
      // Si no hay preferencias guardadas, crea una con el valor por defecto

      await _preferencesBox.put('themePrefs', PreferencesModel('', true));
    }
    notifyListeners();
  }

  Future<void> changeMode() async {
    _currentTheme = (_currentTheme == ThemeData.dark())
        ? ThemeData.light()
        : ThemeData.dark();
    //cambio de tema mi app
    await _updatePreferences(_currentTheme == ThemeData.dark() ? false : true);
    //cambio de tema mi app
  }

  Future<void> _updatePreferences(bool isLight) async {
    final prefs = _preferencesBox.get('themePrefs');
    
    if (prefs != null) {
      await _preferencesBox.put(
          'themePrefs', PreferencesModel(prefs.apiToken, isLight));
    }
    notifyListeners();
  }
}
