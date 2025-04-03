import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

showConfirmDialog({
  required BuildContext context,
  required String buttonText,
  required String bodyContent,
  required String title,
  required Color buttonColor,
  required VoidCallback onPressed,
  String? cancelButtonText,
  double? heightOfDialog,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 30.w, end: 30.w, top: 24.h, bottom: 24.h),
          child: SizedBox(
            height: heightOfDialog ?? 210.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.bold20,
                    ),
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                Text(
                  bodyContent,
                  style: TextStyles.bold17,
                ),
                verticalSpace(30),
                Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        buttonText: cancelButtonText ?? S.of(context).cancel,
                        backgroundColor: const Color(0xffeaeaec),
                        verticalPadding: 10,
                        buttonHieght: 30,
                        borderRadius: 12,
                        textStyle: TextStyles.semiBold16.copyWith(
                          color: AppColors.darkModeGray,
                          fontSize: 16,
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    ),
                    horizontalSpace(20),
                    Expanded(
                      child: AppTextButton(
                        buttonText: buttonText,
                        backgroundColor: buttonColor,
                        verticalPadding: 10,
                        buttonHieght: 30,
                        borderRadius: 12,
                        textStyle: TextStyles.semiBold16.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
