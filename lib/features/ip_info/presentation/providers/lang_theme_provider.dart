import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LangThemeProvider extends ChangeNotifier {
  bool _isThemeDark = false;
  bool _isEnglish = true;

  Locale get lang => _isEnglish ? Locale("en") : Locale("fa");
  ThemeData get themeData => _isThemeDark ? ThemeData.dark() : ThemeData.light();

  toggleLang() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  toggleTheme() {
    _isThemeDark = !_isThemeDark;
    notifyListeners();
  }
}