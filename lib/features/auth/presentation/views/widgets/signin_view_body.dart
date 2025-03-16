import 'package:biocode/core/helpers/build_snack_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:biocode/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:biocode/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:biocode/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              S.of(context).welcome_back,
              style: TextStyles.bold24.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              S.of(context).welcome_back_message,
              style: TextStyles.regular14,
            ),
            verticalSpace(32),
            const SignInForm(),
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
                context.read<SigninCubit>().signinWithGoogle();
                successSnackBar(
                  context: context,
                  message: S.of(context).login_success,
                );
              },
            ),
            verticalSpace(15.h),
            SocialLoginButton(
              title: S.of(context).sign_in_facebook,
              imageLink: AssetsData.faceBookIcon,
              onPressed: () {
                context.read<SigninCubit>().signinWithFacebook();
                successSnackBar(
                  context: context,
                  message: S.of(context).login_success,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateThenSignin(BuildContext context) {
    final signinCubit = context.read<SigninCubit>();
    if (signinCubit.formKey.currentState!.validate()) {
      signinCubit.signinWithEmailAndPassword();
      successSnackBar(
        context: context,
        message: S.of(context).login_success,
      );
    }
  }
}
