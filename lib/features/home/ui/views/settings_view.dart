import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/home/ui/views/widgets/settings_view_body.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).settingsAppbarTitle,
            style: TextStyles.bold18,
          ),
          centerTitle: true,
        ),
        body: const SettingsViewBody(),
      ),
    );
  }
}
