import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/features/splash/ui/views/widgets/change_language_section.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AssetsData.bioticsLogoImage,
                  height: 70.h,
                ),
              ),
              verticalSpace(10),
              Text("Biotics", style: TextStyles.bold20),
              verticalSpace(10),
              Text(S.of(context).biologyJourney, style: TextStyles.medium16),
              verticalSpace(120),
              Text(
                S.of(context).preferredLanguage,
                style: TextStyles.bold18,
              ),
              verticalSpace(30),
              const ChangeLanguageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
