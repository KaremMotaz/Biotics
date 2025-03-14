import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataLight({required String fontFamily}) {
  return ThemeData(
    primaryColor: AppColors.mainBlue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: fontFamily,
    iconTheme: const IconThemeData(
      color: AppColors.gray,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: AppColors.gray,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.moreLighterGray,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.gray),
      titleTextStyle: TextStyle(
        color: AppColors.gray,
        fontFamily: fontFamily,
      ),
    ),
  );
}
