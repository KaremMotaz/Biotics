import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/ui/views/widgets/otp_view_body_bloc_consumer.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class OTPVerificationView extends StatelessWidget {
  const OTPVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).otp_appbar_title),
        body: const OtpViewBodyBlocConsumer(),
      ),
    );
  }
}
