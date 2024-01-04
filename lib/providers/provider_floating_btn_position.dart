import 'package:devto_app/data/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BtnPositionProvider extends ChangeNotifier {
  bool _currentPosition;
  late Box<PreferencesModel> _preferencesBox;

  BtnPositionProvider() : _currentPosition = true {
    _init();
  }

  bool get currentPosition => _currentPosition;

  Future<void> _init() async {
    // Abre la caja de Hive
    _preferencesBox = await Hive.openBox<PreferencesModel>('preferencesBox');

    // Carga el estado de la posicion
    final prefs = _preferencesBox.get('positionBtnPrefs');

    if (prefs != null) {
      _currentPosition = prefs.btnLeft ? true : false;
    } else {
      await _preferencesBox.put(
          'positionBtnPrefs', PreferencesModel('', true, true));
    }
    notifyListeners();
  }

  Future<void> changePosition() async {
    _currentPosition = (_currentPosition == false) ? true : false;
    await _updatePreferences((_currentPosition == false) ? false : true);
  }

  Future<void> _updatePreferences(bool btnLeft) async {
    final prefs = _preferencesBox.get('positionBtnPrefs');

    if (prefs != null) {
      await _preferencesBox.put('positionBtnPrefs',
          PreferencesModel(prefs.apiToken, prefs.isLight, btnLeft));
    }
    notifyListeners();
  }
}
