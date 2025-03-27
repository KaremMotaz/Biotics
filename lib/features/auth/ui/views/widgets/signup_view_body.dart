import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/ui/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/already_have_an_account.dart';
import 'package:biocode/features/auth/ui/views/widgets/signup_form.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
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
              S.of(context).create_account,
              style: TextStyles.bold20.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              S.of(context).signup_description,
              style: TextStyles.regular14.copyWith(),
            ),
            verticalSpace(36),
            SignUpForm(
              emailController: emailController,
              passwordController: passwordController,
              formKey: formKey,
            ),
            verticalSpace(25),
            AppTextButton(
              buttonText: S.of(context).create_account_button,
              textStyle: TextStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                validateThenSignup(context);
                emailController.clear();
                passwordController.clear();
              },
            ),
            verticalSpace(25.h),
            const Align(
              alignment: AlignmentDirectional.center,
              child: AlreadyHaveAnAccount(),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenSignup(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SignupCubit>().signupWithEmailAndPassword(
            locale: S.of(context),
            passwordController: passwordController,
            emailController: emailController,
          );
    }
  }
}
