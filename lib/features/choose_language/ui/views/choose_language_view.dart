import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AssetsData.bioticsLogoImage,
                  height: 70.h,
                ),
              ),
              verticalSpace(10),
              const Text("Biotics"),
              verticalSpace(10),
              const Text("Your Biology Journey Starts Here"),
              verticalSpace(120),
              const Text("What is your preferred language?"),
              verticalSpace(20),
              const Text("Arabic"),
              const Text("English"),
            ],
          ),
        ),
      ),
    );
  }
}
