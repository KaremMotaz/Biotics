import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/assets_data.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationViewBody extends StatelessWidget {
  const OTPVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Image.asset(
            AssetsData.emailNotification,
            width: 130.w,
          ),
          verticalSpace(8),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              S.of(context).otp_verification_title,
              style: TextStyles.bold20.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            S.of(context).otp_verification_description,
            style: TextStyles.regular14,
          ),
          verticalSpace(16),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              S.of(context).otp_verification_description2,
              style: TextStyles.regular14,
            ),
          ),
          verticalSpace(32),
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
      ),
    );
  }
}
