import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:biocode/features/on_boarding/ui/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  void excuteNaviagtion({required BuildContext context}) {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    if (isOnBoardingViewSeen) {
      bool isLoggedIn = FirebaseAuthService().isLoggedIn();
      if (isLoggedIn) {
        GoRouter.of(context).pushReplacement(Routes.homeView);
      } else {
        GoRouter.of(context).pushReplacement(Routes.signInView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use WidgetsBinding to execute the navigation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      excuteNaviagtion(context: context);
    });
    return const SafeArea(
      child: Scaffold(
        body: OnboardingViewBody(),
      ),
    );
  }
}
