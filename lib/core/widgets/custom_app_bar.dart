import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/theme_cubit/theme_cubit.dart';
import '../theming/styles.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyles.bold18,
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
      // BlocBuilder<LanguageCubit, Locale>(
      //   builder: (context, state) {
      //     return IconButton(
      //       onPressed: () {
      //         final currentLang =
      //             context.read<LanguageCubit>().state.languageCode;
      //         final newLang = currentLang == "en" ? "ar" : "en";
      //         context.read<LanguageCubit>().changeLanguage(newLang);
      //       },
      //       icon: const Icon(
      //         Icons.translate_rounded,
      //       ),
      //     );
      //   },
      // ),
    ],
  );
}
