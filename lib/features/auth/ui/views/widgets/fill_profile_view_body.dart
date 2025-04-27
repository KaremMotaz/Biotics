import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';
import 'fill_profile_form.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillProfileViewBody extends StatelessWidget {
  const FillProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                S.of(context).fillProfileTitle,
                style: TextStyles.bold20.copyWith(
                  color: AppColors.mainBlue,
                ),
              ),
            ),
            verticalSpace(8),
            Text(
              S.of(context).fillProfileDescription,
              style: TextStyles.regular14,
            ),
            verticalSpace(32),
            const FillProfileForm(),
          ],
        ),
      ),
    );
  }
}
