import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/build_snack_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).forgot_password_title,
            style: TextStyles.bold24.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
          verticalSpace(8),
          Text(
            S.of(context).forgot_password_description,
            style: TextStyles.regular14,
          ),
          verticalSpace(32),
          Form(
              key: context.read<ForgotPasswordCubit>().formKey,
            child: AppTextFormField(
              hintText: S.of(context).enter_email,
              controller: context.read<ForgotPasswordCubit>().emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).please_enter_email;
                }
                if (!AppRegex.isEmailValid(value)) {
                  return S.of(context).please_enter_valid_email;
                }
                return null;
              },
            ),
          ),
          verticalSpace(32),
          AppTextButton(
            buttonText: S.of(context).reset_password_button,
            textStyle: TextStyles.semiBold16.copyWith(
              color: Colors.white,
            ),
            onPressed: () {
              validateThenSendLinkToResetPassword(context);
            },
          ),
        ],
      ),
    );
  }

  void validateThenSendLinkToResetPassword(BuildContext context) {
    final forgotPasswordCubit = context.read<ForgotPasswordCubit>();
    if (forgotPasswordCubit.formKey.currentState!.validate()) {
      forgotPasswordCubit.sendLinkToResetPassword(locale: S.of(context));
      successSnackBar(
        context: context,
        message: S.of(context).reset_password_success_message,
      );
    }
  }
}
