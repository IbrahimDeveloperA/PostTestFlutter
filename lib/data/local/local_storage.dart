import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/core/constants/app_constants.dart';

@lazySingleton
final class LocalStorage {
  LocalStorage(this._prefs);

  final SharedPreferences _prefs;

  bool getTheme() {
    return _prefs.getBool(AppConstants.themeKey) ?? false;
  }

  Future<void> changeTheme(bool value) async {
    await _prefs.setBool(AppConstants.themeKey, value);
  }
}
