import 'build_snack_bar.dart';
import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';
import '../widgets/app_text_button.dart';
import '../../features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void showAvatarsDialog({
  required BuildContext context,
  required FillProfileCubit fillProfileCubit,
}) {
  List<String> avatarPaths = List.generate(8, (index) {
    return "assets/avatars/avatar${index + 1}.png";
  });

  int? selectedIndex; // Store the selected avatar index

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
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
                Text(
                  S.of(context).select_your_avatar,
                  style: TextStyles.bold18,
                ),
                verticalSpace(20),
                Expanded(
                  child: StatefulBuilder(builder: (context, setState) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                isSelected ? AppColors.mainBlue : Colors.white,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: AssetImage(avatarPaths[index]),
                              backgroundColor: Theme.of(context).cardColor,
                            ),
                          ),
                        );
                      },
                      itemCount: 8,
                    );
                  }),
                ),
                AppTextButton(
                  buttonText: S.of(context).submit,
                  backgroundColor: AppColors.mainBlue,
                  textStyle: TextStyles.semiBold16.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    if (selectedIndex != null) {
                      fillProfileCubit.selectImage(
                          image: null, avatarPath: avatarPaths[selectedIndex!]);

                      successSnackBar(
                        context: context,
                        message: S.of(context).avatar_selected_successfully,
                      );
                      GoRouter.of(context).pop();
                    } else {
                      errorSnackBar(
                        context: context,
                        message: S.of(context).please_select_avatar,
                      );
                      GoRouter.of(context).pop();
                    }
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
