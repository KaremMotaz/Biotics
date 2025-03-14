import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.lightGray,
          ),
        ),
        horizontalSpace(10),
        Text(
          S.of(context).or,
          style: TextStyles.regular14
        ),
        horizontalSpace(10),
        const Expanded(
          child: Divider(
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
