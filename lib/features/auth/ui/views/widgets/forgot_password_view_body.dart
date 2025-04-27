import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/functions/build_snack_bar.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/assets_data.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../manager/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

final TextEditingController emailController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).forgot_password_title,
            style: TextStyles.bold20.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
          verticalSpace(8),
          Text(
            S.of(context).forgot_password_description,
            style: TextStyles.regular14,
          ),
          Image.asset(AssetsData.forgotPassword),
          Form(
            key: _formKey,
            child: AppTextFormField(
              hintText: S.of(context).enter_email,
              controller: emailController,
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
          verticalSpace(24),
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
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().sendLinkToResetPassword(
            locale: S.of(context),
            emailController: emailController,
          );
      successSnackBar(
        context: context,
        message: S.of(context).reset_password_success_message,
      );
    }
  }
}
