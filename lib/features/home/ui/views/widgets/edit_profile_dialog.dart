import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

editProfileDialog({
  required BuildContext context,
  // required void Function() onPressed,
  required String title,
  required String hintText,
  required TextEditingController controller,
  required Function(String?) validator,
  TextInputType? textInputType,
}) {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkModeGray
                : Colors.white,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.bold18.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.lighterGray
                              : AppColors.darkModeGray),
                    ),
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.lighterGray
                            : AppColors.darkModeGray,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                AppTextFormField(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkModeGray
                          : const Color.fromARGB(255, 244, 241, 241),
                  textInputType: textInputType,
                  hintText: hintText,
                  controller: controller,
                  validator: validator,
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        buttonText: S.of(context).cancel,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppColors.lighterGray
                                : const Color.fromARGB(255, 233, 231, 231),
                        verticalPadding: 10,
                        buttonHieght: 30,
                        borderRadius: 12,
                        textStyle: TextStyles.semiBold16.copyWith(
                          color: AppColors.darkModeGray,
                          fontSize: 16,
                        ),
                        onPressed: () {
                          controller.clear();
                          GoRouter.of(context).pop();
                        },
                      ),
                    ),
                    horizontalSpace(20),
                    Expanded(
                      child: AppTextButton(
                        buttonText: S.of(context).save,
                        backgroundColor: AppColors.mainBlue,
                        verticalPadding: 10,
                        buttonHieght: 30,
                        borderRadius: 12,
                        textStyle: TextStyles.semiBold16.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.clear();
                            GoRouter.of(context).pop();
                          }
                        },
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
