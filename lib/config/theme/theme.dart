import 'package:drill_app/config/theme/button_theme.dart';
import 'package:drill_app/config/theme/checkbox_themedata.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/config/theme/input_decoration_theme.dart';
import 'package:drill_app/config/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ThemeConfig {

  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      primarySwatch: primaryMaterialColor,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
