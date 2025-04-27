import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.validator,
    required this.selectedGrade,
    required this.onChanged,
  });
  final String hintText;
  final List<String> items;
  final FormFieldValidator<String> validator;
  final String? selectedGrade;
  final void Function(String?)? onChanged;

  @override
  State<CustomDropDownButton> createState() =>
      _CustomDropDownMenuSettingsState();
}

class _CustomDropDownMenuSettingsState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DropdownButtonFormField(
      dropdownColor: isDarkMode ? AppColors.darkModeGray : Colors.white,
      decoration: InputDecoration(
        enabledBorder: buildOutLineInputBorder(
          borderColor: AppColors.lighterGray,
        ),
        focusedBorder: buildOutLineInputBorder(
          borderColor: AppColors.mainBlue,
        ),
        errorBorder: buildOutLineInputBorder(
          borderColor: Colors.red,
        ),
        focusedErrorBorder: buildOutLineInputBorder(
          borderColor: Colors.red,
        ),
        filled: true,
      ),
      hint: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          widget.hintText,
          style: TextStyle(
            color: isDarkMode ? Colors.white : AppColors.gray,
          ),
        ),
      ),
      items: widget.items.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Text(e),
          ),
        );
      }).toList(),
      value: widget.items.contains(widget.selectedGrade)
          ? widget.selectedGrade
          : null,
      validator: widget.validator,
      onChanged: widget.onChanged,
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
