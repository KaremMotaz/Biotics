import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/on_boarding/ui/views/widgets/bio_logo_and_name.dart';
import 'package:biocode/features/on_boarding/ui/views/widgets/teacher_image_and_text.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          children: [
            const BioLogoAndName(),
            verticalSpace(30.h),
            const TeacherImageAndText(),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: Column(
                children: [
                  Text(
                    S.of(context).onboarding_title,
                    style: TextStyles.medium16,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20.h),
                  AppTextButton(
                    buttonText: S.of(context).begin_learning,
                    textStyle: TextStyles.semiBold16.copyWith(
                      color: Colors.white,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(Routes.signInView);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
