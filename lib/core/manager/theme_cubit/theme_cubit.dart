import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _init();
  }
  Future<void> toggleTheme() async {
    final newTheme =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await Prefs.setBool(kIsDarkMode, newTheme == ThemeMode.dark);
    emit(newTheme);
  }

  Future<void> _init() async {
    final bool isDarkMode = await Prefs.getBool(kIsDarkMode) ?? false;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  String getFontFamily(String languageCode) {
    return languageCode == "ar" ? "Cairo" : "Roboto";
  }
}
