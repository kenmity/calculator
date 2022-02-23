// import 'package:calculator/style/material_colors.dart';
import 'package:calculator/style/my_themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light ;
  ThemeType themeType = ThemeType.light ;
  ThemeType themeDarkType = ThemeType.dark ;
  bool get isDarkMode => themeMode == ThemeMode.dark ;

  void toggleTheme(bool isDarkMode){
    themeMode = isDarkMode ? ThemeMode.dark:ThemeMode.light  ;
    notifyListeners() ;
  }

  void setThemeMode(ThemeMode themeMode){
    this.themeMode = themeMode ;
    notifyListeners() ;
  }

  void setThemeType(ThemeType themeType , ThemeType themeDarkType){
      this.themeType = themeType ;
      this.themeDarkType = themeType ;
      notifyListeners() ;
  }
}