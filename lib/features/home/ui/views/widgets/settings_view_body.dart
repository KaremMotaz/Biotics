
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_confirm_bar.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/manager/theme_cubit/theme_cubit.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/assets_data.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/ui/manager/cubit/log_out_cubit.dart';
import 'change_lang_dialog_settings.dart';
import 'custom_settings_list_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).account,
              style: TextStyles.bold20,
            ),
            verticalSpace(20),
            ListTile(
              leading: Image.asset(AssetsData.dummyUserImage),
              title: Text("Karim Motaz", style: TextStyles.bold18),
              subtitle: const Text("Student"),
              trailing: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.profileView);
                },
                icon: const Icon(Icons.chevron_right_rounded),
              ),
              onTap: () {
                GoRouter.of(context).push(Routes.profileView);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            verticalSpace(30),
            Text(
              S.of(context).settings,
              style: TextStyles.bold20,
            ),
            verticalSpace(20),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return CustomSettingsListTile(
                  bgIconcolor: const Color(0xffe5e3fb),
                  title: S.of(context).dark_mode,
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  ),
                  icon: Icons.dark_mode_rounded,
                  iconcolor: const Color(0xff6756e5),
                );
              },
            ),
            verticalSpace(8),
            CustomSettingsListTile(
              bgIconcolor: const Color(0xffe2f9ff),
              title: S.of(context).language,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ChangeLangDialogSettings();
                  },
                );
              },
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ChangeLangDialogSettings();
                    },
                  );
                },
                icon: const Icon(Icons.chevron_right_rounded),
              ),
              icon: Icons.translate_rounded,
              iconcolor: const Color(0xff1da7ef),
            ),
            CustomSettingsListTile(
              bgIconcolor: const Color(0xfffee9f0),
              title: S.of(context).logout,
              onTap: () {
                showConfirmDialog(
                  context: context,
                  buttonText: S.of(context).logout_button,
                  bodyContent: S.of(context).logout_confirmation,
                  title: S.of(context).logout_title,
                  buttonColor: const Color(0xffdb2323),
                  onPressed: () async {
                    await context
                        .read<LogOutCubit>()
                        .logOut(locale: S.of(context));
                    if (!context.mounted) return;
                    GoRouter.of(context).pushReplacement(Routes.signInView);
                  },
                );
              },
              trailing: const SizedBox.shrink(),
              icon: Icons.logout_rounded,
              iconcolor: const Color(0xffd05b75),
            ),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
