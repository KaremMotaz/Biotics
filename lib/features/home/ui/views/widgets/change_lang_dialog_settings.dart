import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/manager/language_cubit/language_cubit.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/assets_data.dart';
import '../../../../../generated/l10n.dart';
import 'change_language_list_tile.dart';

class ChangeLangDialogSettings extends StatelessWidget {
  const ChangeLangDialogSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentLang = context.read<LanguageCubit>().state.languageCode;
    final newLang = currentLang == "en" ? "ar" : "en";
    return Dialog(
      backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.darkModeGray : AppColors.lighterGray,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SizedBox(
          height: 180.h,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 26,
                  ),
                ),
              ),
              ChangeLanguageListTile(
                currentLang: currentLang,
                language: 'en',
                onTap: () {
                  context.read<LanguageCubit>().changeLanguage(newLang);
                },
                title: S.of(context).english,
                flagImageName: AssetsData.enFlag,
              ),
              ChangeLanguageListTile(
                currentLang: currentLang,
                language: 'ar',
                onTap: () {
                  context.read<LanguageCubit>().changeLanguage(newLang);
                },
                title: S.of(context).arabic,
                flagImageName: AssetsData.arFlag,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
