import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/build_snack_bar.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/routing/routes.dart';
import 'package:biocode/core/theming/app_colors.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/core/widgets/custom_circle_avatar.dart';
import 'package:biocode/features/auth/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FillProfileForm extends StatefulWidget {
  const FillProfileForm({super.key});

  @override
  State<FillProfileForm> createState() => _FillProfileFormState();
}

class _FillProfileFormState extends State<FillProfileForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
      const CustomCircleAvatar(),
        verticalSpace(30),
        AppTextFormField(
          hintText: S.of(context).firstName,
          controller: firstNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).pleaseEnterFirstName;
            }
            return null;
          },
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: S.of(context).lastName,
          controller: lastNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).pleaseEnterLastName;
            }
            return null;
          },
        ),
        verticalSpace(16),
        AppTextFormField(
          textInputType: TextInputType.phone,
          hintText: S.of(context).yourPhoneNumber,
          controller: phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).pleaseEnterYourPhoneNumber;
            }
            if (!AppRegex.isPhoneNumberValid(value)) {
              return S.of(context).pleaseEnterValidPhoneNumber;
            }
            return null;
          },
        ),
        verticalSpace(16),
        CustomDropDownButton(
          hintText: S.of(context).selectGrade,
          items: [
            S.of(context).fourthPrimary,
            S.of(context).fifthPrimary,
            S.of(context).sixthPrimary,
            S.of(context).firstPreparatory,
            S.of(context).secondPreparatory,
            S.of(context).thirdPreparatory,
            S.of(context).firstSecondary,
            S.of(context).secondSecondary,
            S.of(context).thirdSecondary,
            S.of(context).bioChemistry,
          ],
          validator: (String? value) =>
              value == null ? S.of(context).pleaseSelectGrade : null,
        ),
        verticalSpace(32),
        AppTextButton(
          buttonText: S.of(context).fillProfileSubmitButton,
          textStyle: TextStyles.semiBold16.copyWith(
            color: Colors.white,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              successSnackBar(
                context: context,
                message: S.of(context).fill_profile_success_message,
              );
              GoRouter.of(context).pushReplacement(Routes.homeView);
            }
            
          },
        ),
      ]),
    );
  }
}
