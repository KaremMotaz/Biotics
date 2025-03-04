import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsManager.lightGray,
          ),
        ),
        horizontalSpace(10),
        Text(
          "Or",
          style: TextStyles.font14GrayRegular,
        ),
        horizontalSpace(10),
        Expanded(
          child: Divider(
            color: ColorsManager.lightGray,
          ),
        ),
      ],
    );
  }
}
