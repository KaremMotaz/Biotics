import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/features/auth/ui/views/widgets/password_validations.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

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

  @override
  void initState() {
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextFormField(
            textInputType: TextInputType.emailAddress,
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
            controller: widget.emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: S.of(context).password_hint,
            isObscureText: isPasswordObscureText,
            controller: widget.passwordController,
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

  void setupPasswordControllerListener() {
    widget.passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(widget.passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(widget.passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(widget.passwordController.text);
        hasNumber = AppRegex.hasNumber(widget.passwordController.text);
        hasMinLength = AppRegex.hasMinLength(widget.passwordController.text);
      });
    });
  }
}
