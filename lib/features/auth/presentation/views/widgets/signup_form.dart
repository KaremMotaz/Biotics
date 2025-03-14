import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:biocode/features/auth/presentation/views/widgets/password_validations.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;

  // validation booleans
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: S.of(context).email_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).email_empty_error;
              }
              if (!AppRegex.isEmailValid(value)) {
                return S.of(context).email_invalid_error;
              }
              return null;
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: S.of(context).password_hint,
            isObscureText: isPasswordObscureText,
            controller: context.read<SignupCubit>().passwordController,
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
                return S.of(context).password_empty_error;
              }
              if (!AppRegex.isPasswordValid(value)) {
                return S.of(context).password_invalid_error;
              }
              return null;
            },
          ),
          verticalSpace(24),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
            S.of(context).password_requirements,
              style: TextStyles.regular14,
            ),
          ),
          verticalSpace(10),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
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
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
}
