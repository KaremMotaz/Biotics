import 'package:biocode/core/manager/theme_cubit/theme_cubit.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold20.copyWith(),
    ),
    centerTitle: true,
    actions: [
      BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          );
        },
      ),
      // IconButton(
      //   onPressed: () {},
      //   icon: const Icon(
      //     Icons.settings_rounded,
      //   ),
      // )
    ],
  );
}
