import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(text: S.of(context).signup_prompt, style: TextStyles.medium16),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context).push(Routes.signUpView);
              },
            text: S.of(context).signup_title,
            style: TextStyles.medium16.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
