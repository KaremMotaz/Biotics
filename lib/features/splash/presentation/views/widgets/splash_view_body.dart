import 'package:biocode/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.logo);
  }
}
