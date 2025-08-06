import 'package:fit_scale/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;
  ThemeData get themeData => _themeData;
  static const String _themePrefKey = 'isDarkMode';

  ThemeProvider() {
    _loadTheme();
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() async {
    if (_themeData == AppTheme.lightTheme) {
      _themeData = AppTheme.darkTheme;
      _saveThemePreference(true);
    } else {
      _themeData = AppTheme.lightTheme;
      _saveThemePreference(false);
    }
    notifyListeners();
  }

  Future<void> _saveThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePrefKey, isDarkMode);
  }

  Future<void> _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool(_themePrefKey) ?? false;
    _themeData = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}
