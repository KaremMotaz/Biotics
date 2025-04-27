import '../helpers/constants.dart';
import '../routing/routes.dart';
import '../services/firebase_auth_service.dart';
import '../services/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void excuteNavigation({required BuildContext context,required bool isOldStudent}) {
  bool isChooseLanguageViewSeen = Prefs.getBool(kIsChooseLanguageViewSeen);

  if (isChooseLanguageViewSeen) {
    bool isLoggedIn = FirebaseAuthService().isLoggedIn();
    if (isLoggedIn && isOldStudent) {
      GoRouter.of(context).go(Routes.homeView);
    } else {
      GoRouter.of(context).go(Routes.signInView);
    }
  } else {
    GoRouter.of(context).go(Routes.chooseLanguageView);
  }
}
