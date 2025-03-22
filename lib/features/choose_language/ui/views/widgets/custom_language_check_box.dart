import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLanguageCheckBox extends StatelessWidget {
  const CustomLanguageCheckBox({
    super.key,
    required this.currentLang,
    required this.language,
    required this.onTap,
    required this.title,
    required this.flagImageName,
  });
  final String currentLang;
  final String language;
  final VoidCallback onTap;
  final String title;
  final String flagImageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.gray
              : AppColors.lighterGray,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(flagImageName),
          ),
          title: Text(title),
          trailing: currentLang == language
              ? Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 18,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.gray
                        : AppColors.lighterGray,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
