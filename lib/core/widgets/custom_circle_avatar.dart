import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';
import '../functions/choose_image_source_dialog.dart';
import '../functions/image_picker_helper.dart';
import '../theming/assets_data.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FillProfileCubit, FillProfileState>(
      builder: (context, state) {
        final fillProfileCubit = context.read<FillProfileCubit>();

        String? selectedAvatarPath = fillProfileCubit.selectedAvatarPath;
        File? image = fillProfileCubit.selectedImage;

        if (state is FillProfileImageSelectedState) {
          selectedAvatarPath = state.selectedAvatarPath;
          image = state.selectedImage;
        }
        return Stack(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: image != null
                  ? FileImage(image)
                  : AssetImage(selectedAvatarPath!),
              backgroundColor: Theme.of(context).cardColor,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () async {
                  chooseImageSourceDialog(
                      context: context,
                      pickImageFromGallery:() => pickImageFromGallery(fillProfileCubit), fillProfileCubit: fillProfileCubit);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xfff8f8f8),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Image.asset(
                    AssetsData.editIcon,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
