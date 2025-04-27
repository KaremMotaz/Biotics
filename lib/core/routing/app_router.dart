import 'package:go_router/go_router.dart';

import '../../features/auth/ui/views/fill_profile_view.dart';
import '../../features/auth/ui/views/forgot_password_view.dart';
import '../../features/auth/ui/views/otp_verification_view.dart';
import '../../features/auth/ui/views/signin_view.dart';
import '../../features/auth/ui/views/signup_view.dart';
import '../../features/home/ui/views/home_view.dart';
import '../../features/home/ui/views/profile_view.dart';
import '../../features/home/ui/views/settings_view.dart';
import '../../features/on_boarding/ui/views/onboarding_view.dart';
import '../../features/splash/ui/views/choose_language_view.dart';
import '../../features/splash/ui/views/splash_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.chooseLanguageView,
        builder: (context, state) => const ChooseLanguageView(),
      ),
      GoRoute(
        path: Routes.onBoardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: Routes.signInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.fillProfileView,
        builder: (context, state) => const FillProfileView(),
      ),
      GoRoute(
        path: Routes.forgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: Routes.oTPVerificationView,
        builder: (context, state) => const OTPVerificationView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: Routes.profileView,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
