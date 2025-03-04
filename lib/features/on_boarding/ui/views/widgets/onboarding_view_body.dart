import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/on_boarding/ui/views/widgets/bio_logo_and_name.dart';
import 'package:biocode/features/on_boarding/ui/views/widgets/teacher_image_and_text.dart';
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
            BioLogoAndName(),
            verticalSpace(30.h),
            TeacherImageAndText(),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: Column(
                children: [
                  Text(
                    "Learn everything from cells to ecosystems\n with Biotics",
                    style: TextStyles.medium16.copyWith(
                      color: ColorsManager.gray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(20.h),
                  AppTextButton(
                    buttonText: "Begin Learning",
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
