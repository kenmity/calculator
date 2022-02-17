

import 'package:flutter/material.dart';

import 'material_colors.dart';

class MyThemes {

  static final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor:Colors.white
  );

  static final darkTheme = ThemeData(
      primarySwatch: materialBlack,
      scaffoldBackgroundColor:materialBlack.shade700
  );

}