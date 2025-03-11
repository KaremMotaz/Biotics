import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.imageLink,
    required this.onPressed,
  });
  final String title;
  final String imageLink;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(color: ColorsManager.lightGray),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            double.maxFinite,
            60.h,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold15.copyWith(
            color: const Color.fromARGB(255, 110, 108, 108),
          ),
        ),
        leading: SvgPicture.asset(imageLink),
      ),
    );
  }
}
