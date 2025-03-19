import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    this.textStyle,
    required this.validator,
    this.textInputType,
  });
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? isObscureText;
  final TextStyle? textStyle;
  final Function(String?) validator;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.name,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            buildOutLineInputBorder(
              borderColor: AppColors.mainBlue,
            ),
        enabledBorder: enabledBorder ??
            buildOutLineInputBorder(
              borderColor: AppColors.lighterGray,
            ),
        errorBorder: buildOutLineInputBorder(
          borderColor: Colors.red,
        ),
        focusedErrorBorder: buildOutLineInputBorder(
          borderColor: Colors.red,
        ),
        hintStyle: TextStyles.regular14,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: textStyle ?? TextStyles.medium14,
      validator: (value) {
        return validator(value);
      },
    );
  }
}

OutlineInputBorder buildOutLineInputBorder({required Color borderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: 1.3,
    ),
    borderRadius: BorderRadius.circular(16),
  );
}
