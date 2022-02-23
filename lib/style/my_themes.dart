

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'material_colors.dart';

enum ThemeType {
  light,
  dark,
  red,
  redDark,
  blue,
  blueDark,
}

final themeTypeData = {
  ThemeType.light: MyThemes.lightTheme,
  ThemeType.dark: MyThemes.darkTheme,
  ThemeType.red: MyThemes.redTheme,
  ThemeType.redDark: MyThemes.redDarkTheme,
  ThemeType.blue: MyThemes.blueTheme,
  ThemeType.blueDark: MyThemes.blueDarkTheme,
};

class MyThemes {

  static final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor:Colors.white,
      textTheme: TextTheme(
          button: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 14,
            )
          ),
          bodyText2: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 14,
            fontFamily: 'NotoSansTC',
          )
      )
  );

  static final darkTheme = ThemeData(
      primarySwatch: materialBlack,
      scaffoldBackgroundColor:materialBlack.shade400,
      textTheme: TextTheme(
        button: GoogleFonts.lato(
            textStyle: const TextStyle(
            fontSize: 14,
          )
        ),
        bodyText2: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'NotoSansTC',
        )
      )
  );

  static final redTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor:Colors.white,
    textTheme: TextTheme(
        button: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 14,
              )
        ),
        bodyText2: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'NotoSansTC',
        )
    )

    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.red,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );

  static final redDarkTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor:materialBlack.shade700,
    textTheme: TextTheme(
        button: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 14,
            )
        ),
        bodyText2: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'NotoSansTC',
        )
    )

    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.red,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );

  static final blueTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor:Colors.white,
      textTheme: TextTheme(
          button: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 14,
              )
          ),
          bodyText2: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'NotoSansTC',
          )
      )
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.blue,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );

  static final blueDarkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor:materialBlack.shade700,
    textTheme: TextTheme(
        button: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 14,
            )
        ),
        bodyText2: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'NotoSansTC',
        )
    )
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.blue,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );
}



// TextTheme(
//     bodyText2: GoogleFonts.shizuru(
//       textStyle: TextStyle(
//         color: Colors.grey.shade900,
//         fontSize: 30,
//         fontFamily: 'NotoSansTC',
//       )
//     ),
// ),


// textButtonTheme: TextButtonThemeData(
//   style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
// )



// 使用藍色顏方案但是預設的浮動按鈕FloatingActionButton變其他色
// colorScheme: ColorScheme.fromSwatch(
//   primarySwatch: Colors.blue,
// ).copyWith(
//   secondary: Colors.green,
// ),