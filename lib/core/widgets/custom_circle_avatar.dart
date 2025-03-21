
import 'package:biocode/core/functions/choose_image_source_dialog.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({super.key});

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  String selectedAvatarPath = AssetsData.dummyUserImage;
  File? image;
  Future<void> pickImageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: image != null
              ? FileImage(image!)
              : AssetImage(selectedAvatarPath),
          backgroundColor: Theme.of(context).cardColor,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () async {
              chooseImageSourceDialog(
                context: context,
                pickImageFromGallery: pickImageFromGallery,
                onAvatarSelected: (newPath) {
                  setState(() {
                    selectedAvatarPath = newPath;
                  });
                },
              );
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
  }
}
