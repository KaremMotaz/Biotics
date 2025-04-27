import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/assets_data.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/signin_cubit/signin_cubit.dart';
import 'dont_have_an_account.dart';
import 'or_divider.dart';
import 'sign_in_form.dart';
import 'social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).welcome_back,
              style: TextStyles.bold20.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              S.of(context).welcome_back_message,
              style: TextStyles.regular14,
            ),
            verticalSpace(32),
            SignInForm(
              emailController: emailController,
              passwordController: passwordController,
              formKey: formKey,
            ),
            verticalSpace(5),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.forgotPasswordView);
                },
                child: Text(
                  S.of(context).forgot_password,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ),
            ),
            verticalSpace(25),
            AppTextButton(
              buttonText: S.of(context).sign_in_button,
              textStyle: TextStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                validateThenSignin(context);
                emailController.clear();
                passwordController.clear();
              },
            ),
            verticalSpace(25.h),
            const DontHaveAnAccount(),
            verticalSpace(25.h),
            const OrDivider(),
            verticalSpace(20.h),
            SocialLoginButton(
              title: S.of(context).sign_in_google,
              imageLink: AssetsData.googleIcon,
              onPressed: () {
                context
                    .read<SigninCubit>()
                    .signinWithGoogle(locale: S.of(context));
              },
            ),
            verticalSpace(15.h),
            SocialLoginButton(
              title: S.of(context).sign_in_facebook,
              imageLink: AssetsData.faceBookIcon,
              onPressed: () {
                context
                    .read<SigninCubit>()
                    .signinWithFacebook(locale: S.of(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateThenSignin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SigninCubit>().signinWithEmailAndPassword(
            locale: S.of(context),
            passwordController: passwordController,
            emailController: emailController,
          );
    }
  }
}
