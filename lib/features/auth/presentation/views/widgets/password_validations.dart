import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(4),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(4),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(4),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(4),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color:  hasValidated ? Colors.green : null,
          size: 16,
        ),
        horizontalSpace(5),
        Text(
          text,
          style: TextStyles.regular14.copyWith(
            color: hasValidated ? Colors.green : null,
          ),
        )
      ],
    );
  }
}
