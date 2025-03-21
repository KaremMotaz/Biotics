import 'package:biocode/core/widgets/custom_app_bar.dart';
import 'package:biocode/features/auth/ui/views/widgets/fill_profile_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class FillProfileView extends StatelessWidget {
  const FillProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: S.of(context).fillProfileAppBar),
        body: const FillProfileViewBody(),
      ),
    );
  }
}
