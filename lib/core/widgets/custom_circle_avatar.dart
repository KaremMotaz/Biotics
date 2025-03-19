import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({super.key});

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  File? image;
  Future pickImageFromGallery() async {
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
              : const AssetImage("assets/images/dummy_image.png"),
          backgroundColor: Colors.white,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              pickImageFromGallery();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xfff8f8f8),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Image.asset(
                "assets/images/edit.png",
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
