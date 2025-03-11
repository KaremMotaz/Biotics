import 'package:biocode/features/auth/presentation/views/widgets/fill_profile_view_body.dart';
import 'package:flutter/material.dart';

class FillProfileView extends StatelessWidget {
  const FillProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FillProfileViewBody(),
      ),
    );
  }
}
