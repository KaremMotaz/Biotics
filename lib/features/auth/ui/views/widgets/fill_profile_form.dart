import 'package:biocode/core/helpers/app_regex.dart';
import 'package:biocode/core/helpers/spacing.dart';
import 'package:biocode/core/theming/styles.dart';
import 'package:biocode/core/widgets/app_text_button.dart';
import 'package:biocode/core/widgets/app_text_form_field.dart';
import 'package:biocode/core/widgets/custom_circle_avatar.dart';
import 'package:biocode/features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import 'package:biocode/features/auth/ui/views/widgets/custom_drop_down_menu.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillProfileForm extends StatefulWidget {
  const FillProfileForm({super.key});

  @override
  State<FillProfileForm> createState() => _FillProfileFormState();
}

class _FillProfileFormState extends State<FillProfileForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? selectedGrade; // Store selected grade
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
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
          controller: phoneNumberController,
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
          onChanged: (value) {
            setState(() {
              selectedGrade = value!;
            });
          },
          selectedGrade: selectedGrade,
        ),
        verticalSpace(32),
        AppTextButton(
          buttonText: S.of(context).fillProfileSubmitButton,
          textStyle: TextStyles.semiBold16.copyWith(
            color: Colors.white,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<FillProfileCubit>().fillProfile(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    phoneNumberController: phoneNumberController,
                    grade: selectedGrade!,
                  );
            }
          },
        ),
      ]),
    );
  }
}
