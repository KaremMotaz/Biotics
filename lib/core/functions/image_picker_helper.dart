import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../features/auth/ui/manager/fill_profile_cubit/fill_profile_cubit.dart';

Future<void>  pickImageFromGallery(FillProfileCubit cubit) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    cubit.selectImage(image: File(pickedImage.path), avatarPath: null);
  }
}
