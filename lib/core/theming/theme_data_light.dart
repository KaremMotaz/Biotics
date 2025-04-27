import 'package:flutter/material.dart';

import 'app_colors.dart';

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
    colorScheme: const ColorScheme.light(
      surface: Colors.white, // Set white for containers
    ),
    cardColor: Colors.white,

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
