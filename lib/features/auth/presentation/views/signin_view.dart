import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Sign in",
            style: TextStyles.bold20.copyWith(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SigninViewBody(),
      ),
    );
  }
}
