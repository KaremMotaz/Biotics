import 'package:biocode/core/functions/excute_naviagtion.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Use `addPostFrameCallback` to avoid navigation during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      excuteNavigation(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: AppColors.mainBlue,
        )),
      ),
    );
  }
}
