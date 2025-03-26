import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void excuteNavigation({required BuildContext context}) {
  bool isChooseLanguageViewSeen = Prefs.getBool(kIsChooseLanguageViewSeen);

  if (isChooseLanguageViewSeen) {
    bool isLoggedIn = FirebaseAuthService().isLoggedIn();
    if (isLoggedIn) {
      GoRouter.of(context).go(Routes.homeView);
    } else {
      GoRouter.of(context).go(Routes.signInView);
    }
  } else {
    GoRouter.of(context).go(Routes.chooseLanguageView);
  }
}
