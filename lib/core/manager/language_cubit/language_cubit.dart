import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/constants.dart';
import '../../services/shared_preferences_singleton.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale("en")) {
    _loadLanguage();
  }
  Future<void> changeLanguage(String languageCode) async {
    await Prefs.setString(kLanguageKey, languageCode);
    emit(Locale(languageCode));
  }

  Future<void> _loadLanguage() async {
    final String languageCode = await Prefs.getString(kLanguageKey) ?? "en";
    emit(Locale(languageCode.isNotEmpty ? languageCode : "en"));
  }
}
