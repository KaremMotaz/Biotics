import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'widgets/otp_view_body_bloc_consumer.dart';

class OTPVerificationView extends StatelessWidget {
  const OTPVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: S.of(context).otp_appbar_title),
      body: const SafeArea(
        child: OtpViewBodyBlocConsumer(),
      ),
    );
  }
}
