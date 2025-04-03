import 'package:biocode/core/functions/show_avatar_dialog.dart';
import 'package:biocode/core/functions/build_snack_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void chooseImageSourceDialog({
  required BuildContext context,
  required Future<void> Function() pickImageFromGallery,
  required FillProfileCubit fillProfileCubit,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          width: 180.w,
          height: 220.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkModeGray
                : AppColors.lighterGray,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.close_rounded,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.lighterGray
                          : AppColors.darkModeGray),
                ),
              ),
              verticalSpace(10),
              AppTextButton(
                buttonText: S.of(context).from_avatars,
                backgroundColor: AppColors.gray,
                textStyle: TextStyles.semiBold16.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                  showAvatarsDialog(
                    context: context,
                    fillProfileCubit: fillProfileCubit,
                  );
                },
              ),
              verticalSpace(20),
              AppTextButton(
                buttonText: S.of(context).from_gallery,
                backgroundColor: AppColors.gray,
                textStyle: TextStyles.semiBold16.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  pickImageFromGallery;
                  if (context.mounted) {
                    successSnackBar(
                      context: context,
                      message: S.of(context).image_selected_successfully,
                    );
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
