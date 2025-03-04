import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Sign up",
            style: TextStyles.font20BlackBold,
          ),
          centerTitle: true,
        ),
        body: SignupViewBody(),
      ),
    );
  }
}
