import 'package:biocode/core/helpers/build_snack_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signup_form.dart';
import 'package:biocode/generated/l10n.dart';
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
              S.of(context).create_account,
              style: TextStyles.bold24.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
            verticalSpace(8),
            Text(
              S.of(context).signup_description,
              style: TextStyles.regular14.copyWith(),
            ),
            verticalSpace(36),
            const SignUpForm(),
            verticalSpace(25),
            AppTextButton(
              buttonText: S.of(context).create_account_button,
              textStyle: TextStyles.semiBold16.copyWith(
                color: Colors.white,
              ),
              onPressed: () {
                validateThenSignup(context);
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
    final signupCubit = context.read<SignupCubit>();
    if (signupCubit.formKey.currentState!.validate()) {
      signupCubit.signupWithEmailAndPassword();
      successSnackBar(
        context: context,
        message: S.of(context).signup_success,
      );
    }
  }
}
