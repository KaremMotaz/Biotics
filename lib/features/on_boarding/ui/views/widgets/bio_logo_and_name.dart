import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BioLogoAndName extends StatelessWidget {
  const BioLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsData.bioticsLogo,
          height: 28.h,
          colorFilter: const ColorFilter.mode(
            AppColors.mainBlue,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          'Biotics',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.bold,
            fontSize: 26,
          ),
          
        ),
      ],
    );
  }
}
