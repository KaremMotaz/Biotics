import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataDark({required String fontFamily}) {
  return ThemeData(
    primaryColor: AppColors.mainBlue,
    scaffoldBackgroundColor: AppColors.darkModeGray,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.dark(
      onPrimary: AppColors.darkModeGray, // Dark mode alternative for white
    ),
    textTheme: Typography.whiteCupertino.apply(
      bodyColor: AppColors.lightGray,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.darkModeGray,
      hintStyle: TextStyle(
        color: AppColors.lightGray,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.darkModeGray,
      iconTheme: IconThemeData(color: AppColors.lightGray),
      titleTextStyle: TextStyle(
        color: AppColors.lightGray,
      ),
    ),
  );
}
