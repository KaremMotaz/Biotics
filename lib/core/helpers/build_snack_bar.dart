import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';

void successSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(
          seconds: 4,
        ),
        content: customSnackbar(
          message: message,
          color: Colors.green,
          icon: Icons.check_circle,
          titleWord: S.of(context).success,
          context: context,
        )),
  );
}

void errorSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(
          seconds: 4,
        ),
        content: customSnackbar(
          message: message,
          color: Colors.red,
          icon: Icons.cancel,
          titleWord: S.of(context).error,
          context: context,
        )),
  );
}

Widget customSnackbar(
    {required String titleWord,
    required String message,
    required Color color,
    required IconData icon,
    required BuildContext context}) {
  bool isArabic = Directionality.of(context) == TextDirection.rtl;
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: const BorderSide(color: Colors.transparent),
          left: isArabic
              ? const BorderSide(color: Colors.transparent)
              : BorderSide(color: color, width: 10),
          right: isArabic
              ? BorderSide(color: color, width: 10)
              : const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpace(10),
          Icon(icon, color: color, size: 30),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleWord,
                  style: TextStyles.semiBold16.copyWith(color: Colors.black),
                ),
                verticalSpace(5),
                Text(
                  message,
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
