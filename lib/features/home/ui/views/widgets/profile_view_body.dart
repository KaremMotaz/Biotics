import 'package:biocode/core/functions/show_confirm_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/widgets/custom_circle_avatar.dart';
import 'package:biocode/features/home/ui/views/widgets/edit_profile_dialog.dart';
import 'package:biocode/features/home/ui/views/widgets/edit_profile_list_tile.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController =
      TextEditingController(text: "1234567890");
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              const Align(
                child: CustomCircleAvatar(),
              ),
              verticalSpace(30),
              EditProfileListTile(
                title: S.of(context).name,
                subTitle: const Text('Karim Motaz'),
                onTap: () {
                  editProfileDialog(
                    context: context,
                    textInputType: TextInputType.name,
                    title: S.of(context).enter_name_title,
                    hintText: S.of(context).name_hint,
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).name_validation;
                      }
                      return null;
                    },
                  );
                },
                icon: Icons.person,
              ),
              verticalSpace(10),
              EditProfileListTile(
                title: S.of(context).phone,
                onTap: () {
                  editProfileDialog(
                    context: context,
                    textInputType: TextInputType.phone,
                    title: S.of(context).enter_phone_title,
                    hintText: S.of(context).phone_hint,
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        phoneNumberController.clear();
                        return S.of(context).phone_validation;
                      }
                    },
                  );
                },
                icon: Icons.phone,
                subTitle: const Text('01010424919'),
              ),
              verticalSpace(10),
              EditProfileListTile(
                title: S.of(context).password,
                onTap: () {
                  showConfirmDialog(
                    context: context,
                    buttonText: S.of(context).yes,
                    bodyContent: S.of(context).confirm_change_password,
                    title: S.of(context).change_password,
                    buttonColor: Colors.red,
                    onPressed: () {
                      GoRouter.of(context).pop();
                      editProfileDialog(
                        context: context,
                        textInputType: TextInputType.emailAddress,
                        title: S.of(context).enter_email_title,
                        hintText: S.of(context).email_hint,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).email_validation;
                          }
                          return null;
                        },
                      );
                    },
                  );
                },
                icon: Icons.lock,
                subTitle: Text(
                  '..........',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    height: 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
