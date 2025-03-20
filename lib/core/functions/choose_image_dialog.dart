import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void chooseImageSourceDialog({
  required BuildContext context,
  required Future<void> Function() pickImageFromGallery,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          width: 180.w,
          height: 180.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                buttonText: S.of(context).from_avatars,
                backgroundColor: AppColors.gray,
                textStyle: TextStyles.semiBold16.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  showAvatarsDialog(context);
                },
              ),
              verticalSpace(20),
              AppTextButton(
                buttonText: S.of(context).from_gallery,
                backgroundColor: AppColors.gray,
                textStyle: TextStyles.semiBold16.copyWith(
                  color: Colors.white,
                ),
                onPressed: () async {
                  await pickImageFromGallery();
                  if (context.mounted) {
                    GoRouter.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showAvatarsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, top: 8.h, bottom: 24.h),
          child: SizedBox(
            width: 400.w,
            height: 310.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
                Text(S.of(context).select_your_avatar,
                    style: TextStyles.bold18),
                verticalSpace(20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage: AssetImage(
                                "assets/avatars/avatar${index + 1}.png"),
                            backgroundColor: Theme.of(context).cardColor,
                          ),
                        ),
                      );
                    },
                    itemCount: 8,
                  ),
                ),
                AppTextButton(
                  buttonText: S.of(context).submit,
                  backgroundColor: AppColors.mainBlue,
                  textStyle: TextStyles.semiBold16.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
