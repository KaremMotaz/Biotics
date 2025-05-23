import 'package:biocode/core/manager/language_cubit/language_cubit.dart';
import 'package:biocode/core/manager/theme_cubit/theme_cubit.dart';
import 'package:biocode/core/theming/theme_data_dark.dart';
import 'package:biocode/core/theming/theme_data_light.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BioticsApp extends StatelessWidget {
  const BioticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider(
            create: (_) => LanguageCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return BlocBuilder<LanguageCubit, Locale>(
              builder: (context, locale) {
                final fontFamily = context
                    .read<ThemeCubit>()
                    .getFontFamily(locale.languageCode);
                return MaterialApp.router(
                  title: "Biotics App",
                  theme: getThemeDataLight(fontFamily: fontFamily),
                  darkTheme: getThemeDataDark(fontFamily: fontFamily),
                  themeMode: themeMode,
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                  locale: locale, // Default language
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
