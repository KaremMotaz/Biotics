import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/home/ui/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyles.bold18,
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
