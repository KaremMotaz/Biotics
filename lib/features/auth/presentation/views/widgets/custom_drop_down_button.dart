import 'package:biocode/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.validator,
  });
  final String hintText;
  final List<String> items;
  final FormFieldValidator<String> validator;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedGrade;
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
      onChanged: (value) {
        setState(() {
          selectedGrade = value!;
        });
      },
      value: widget.items.contains(selectedGrade) ? selectedGrade : null,
      validator: widget.validator,
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
