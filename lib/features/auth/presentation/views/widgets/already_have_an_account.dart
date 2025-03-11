import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: "Already have an account?",
            style: TextStyles.medium16.copyWith(
              color: ColorsManager.gray,
            ),
          ),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(Routes.signInView);
              },
            text: "Sign in",
            style: TextStyles.medium16.copyWith(
              color: ColorsManager.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
