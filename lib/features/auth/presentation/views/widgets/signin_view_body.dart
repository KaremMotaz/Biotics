import 'package:biocode/features/auth/presentation/views/widgets/email_and_password.dart';
import 'package:flutter/material.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EmailAndPassword(),
          ],
        ),
      ),
    );
  }
}
