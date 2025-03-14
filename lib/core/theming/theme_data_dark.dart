import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataDark({required String fontFamily}) {
  return ThemeData(
    primaryColor: AppColors.mainBlue,
    scaffoldBackgroundColor: AppColors.darkModeGray,
    fontFamily: fontFamily,
    iconTheme: const IconThemeData(color: AppColors.lightGray),
    listTileTheme: const ListTileThemeData(
      textColor: AppColors.lightGray,
    ),
    colorScheme: const ColorScheme.dark(
      onPrimary: AppColors.darkModeGray, // Dark mode alternative for white
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.darkModeGray,
      hintStyle: TextStyle(
        color: AppColors.lightGray,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkModeGray,
      iconTheme: const IconThemeData(color: AppColors.lightGray),
      titleTextStyle: TextStyle(
        color: AppColors.lightGray,
        fontFamily: fontFamily,
      ),
    ),
  );
}
