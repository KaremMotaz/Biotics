import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:biocode/features/auth/presentation/views/widgets/email_and_password.dart';
import 'package:biocode/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:biocode/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: TextStyles.font24BlueBold,
            ),
            verticalSpace(8),
            Text(
              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyles.font14GrayRegular,
            ),
            verticalSpace(36),
            Column(
              children: [
                const EmailAndPassword(),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpace(25),
                AppTextButton(
                  buttonText: "Sign in",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {},
                ),
                verticalSpace(25.h),
                DontHaveAnAccount(),
                verticalSpace(25.h),
                OrDivider(),
                verticalSpace(20.h),
                SocialLoginButton(
                  title: 'Sign in with google',
                  imageLink: AssetsData.googleIcon,
                  onPressed: () {},
                ),
                verticalSpace(15.h),
                SocialLoginButton(
                  title: 'Sign in with facebook',
                  imageLink: AssetsData.faceBookIcon,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
