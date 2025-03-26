import 'package:biocode/core/helpers/constants.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/manager/language_cubit/language_cubit.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/services/shared_preferences_singleton.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/splash/ui/views/widgets/custom_language_check_box.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangeLanguageSection extends StatelessWidget {
  const ChangeLanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentLang = context.read<LanguageCubit>().state.languageCode;
    final newLang = currentLang == "en" ? "ar" : "en";

    return Column(
      children: [
        CustomLanguageCheckBox(
          currentLang: currentLang,
          language: 'en',
          onTap: () {
            context.read<LanguageCubit>().changeLanguage(newLang);
          },
          title: S.of(context).english,
          flagImageName: AssetsData.enFlag,
        ),
        verticalSpace(20),
        CustomLanguageCheckBox(
          currentLang: currentLang,
          language: 'ar',
          onTap: () {
            context.read<LanguageCubit>().changeLanguage(newLang);
          },
          title: S.of(context).arabic,
          flagImageName: AssetsData.arFlag,
        ),
        verticalSpace(30),
        AppTextButton(
          buttonText: S.of(context).continueButton,
          textStyle: TextStyles.semiBold16.copyWith(
            color: Colors.white,
          ),
          onPressed: () {
            Prefs.setBool(kIsChooseLanguageViewSeen, true);
            GoRouter.of(context).push(Routes.onBoardingView);
          },
        )
      ],
    );
  }
}
