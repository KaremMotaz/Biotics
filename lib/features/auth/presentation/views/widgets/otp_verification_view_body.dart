import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationViewBody extends StatelessWidget {
  const OTPVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          buttonText: S.of(context).otp_verification_button,
          textStyle: TextStyles.semiBold16.copyWith(
            color: Colors.white,
          ),
          onPressed: () {
            GoRouter.of(context).push(Routes.signInView);
          },
        ),
      ],
    );
  }
}
