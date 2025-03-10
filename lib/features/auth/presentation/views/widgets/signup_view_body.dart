import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:biocode/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signup_form.dart';
import 'package:biocode/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: TextStyles.bold24.copyWith(
                color: ColorsManager.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
              style: TextStyles.regular14.copyWith(
                color: ColorsManager.gray,
              ),
            ),
            verticalSpace(36),
            const SignUpForm(),
            verticalSpace(25),
            AppTextButton(
              buttonText: "Create Account",
              textStyle: TextStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                context.read<SignupCubit>().signupWithEmailAndPassword();
              },
            ),
            verticalSpace(25.h),
            Align(
              alignment: AlignmentDirectional.center,
              child: AlreadyHaveAnAccount(),
            ),
            verticalSpace(25.h),
            OrDivider(),
            verticalSpace(20.h),
            SocialLoginButton(
              title: 'Sign up with google',
              imageLink: AssetsData.googleIcon,
              onPressed: () {},
            ),
            verticalSpace(15.h),
            SocialLoginButton(
              title: 'Sign up with facebook',
              imageLink: AssetsData.faceBookIcon,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
