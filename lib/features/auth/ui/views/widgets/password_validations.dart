import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

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
        buildValidationRow(S.of(context).password_lowercase, hasLowerCase),
        verticalSpace(4),
        buildValidationRow(S.of(context).password_uppercase, hasUpperCase),
        verticalSpace(4),
        buildValidationRow(
            S.of(context).password_special_characters, hasSpecialCharacters),
        verticalSpace(4),
        buildValidationRow(S.of(context).password_number, hasNumber),
        verticalSpace(4),
        buildValidationRow(S.of(context).password_length, hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: hasValidated ? Colors.green : null,
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
