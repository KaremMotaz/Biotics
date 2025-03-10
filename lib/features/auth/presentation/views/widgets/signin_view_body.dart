import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:biocode/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:biocode/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:biocode/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              style: TextStyles.bold24.copyWith(
                color: ColorsManager.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              style: TextStyles.regular14.copyWith(
                color: ColorsManager.gray,
              ),
            ),
            verticalSpace(36),
            Column(
              children: [
                const SignInForm(),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyles.regular13.copyWith(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                ),
                verticalSpace(25),
                AppTextButton(
                  buttonText: "Sign in",
                  textStyle: TextStyles.semiBold16.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<SigninCubit>().signinWithEmailAndPassword();
                  },
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
