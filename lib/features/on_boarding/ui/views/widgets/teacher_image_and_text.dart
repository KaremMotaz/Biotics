import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherImageAndText extends StatelessWidget {
  const TeacherImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onPrimary, // Dynamic color
                Theme.of(context).colorScheme.onPrimary.withAlpha(0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.12, 0.4],
            ),
          ),
          child: Image.asset(
            AssetsData.onBoardingTeacher,
            height: 500.h,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Text(
            S.of(context).explore_biology,
            style: TextStyles.bold30.copyWith(
              color: AppColors.mainBlue,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
