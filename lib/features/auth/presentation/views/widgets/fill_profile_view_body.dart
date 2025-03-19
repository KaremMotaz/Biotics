import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/presentation/views/widgets/fill_profile_form.dart';
import 'package:biocode/generated/l10n.dart';
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
