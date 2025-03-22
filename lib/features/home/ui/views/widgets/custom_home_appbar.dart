import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar buildHomeAppBar({required String title, required BuildContext context}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold18,
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          GoRouter.of(context).push(Routes.settingsView);
        },
        icon: const Icon(
          Icons.settings_rounded,
        ),
      )
    ],
  );
}
