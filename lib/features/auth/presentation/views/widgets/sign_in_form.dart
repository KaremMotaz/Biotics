import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isPasswordObscureText = true;

  // validation booleans
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<SigninCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SigninCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: S.of(context).email_label,
            controller: context.read<SigninCubit>().emailController,
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
          verticalSpace(18),
          AppTextFormField(
            hintText: S.of(context).password_label,
            isObscureText: isPasswordObscureText,
            controller: context.read<SigninCubit>().passwordController,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              icon: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_password;
              }
              if (!AppRegex.isPasswordValid(value)) {
                return S.of(context).please_enter_valid_password;
              }
              return null;
            },
          ),
          verticalSpace(5),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
}
