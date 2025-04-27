import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isPasswordObscureText = true;

  @override
  void dispose() {
    widget.passwordController.dispose();
    widget.emailController.dispose();
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
            hintText: S.of(context).email_label,
            controller: widget.emailController,
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
                return S.of(context).please_enter_password;
              }
              if (!AppRegex.isPasswordValid(value)) {
                return S.of(context).please_enter_valid_password;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
