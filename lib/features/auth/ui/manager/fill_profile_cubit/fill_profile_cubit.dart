import 'dart:io';

import 'package:biocode/core/functions/assets_to_file.dart';
import 'package:biocode/core/repos/images_repo/images_repo.dart';
import 'package:biocode/core/theming/assets_data.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fill_profile_state.dart';

class FillProfileCubit extends Cubit<FillProfileState> {
  FillProfileCubit(this.authRepo, this.imagesRepo)
      : super(FillProfileInitialState());

  final AuthRepo authRepo;
  final ImagesRepo imagesRepo;
  final User user = FirebaseAuth.instance.currentUser!;
  File? selectedImage;
  String? selectedAvatarPath = AssetsData.dummyUserImage;
  File? selectedAvatarPathFile;

  void selectImage({required File? image, required String? avatarPath}) async {
    selectedImage = image;
    selectedAvatarPath = avatarPath ?? selectedAvatarPath;
    selectedAvatarPathFile = await assetToFile(selectedAvatarPath!);
    emit(FillProfileImageSelectedState(selectedImage, selectedAvatarPath!));
  }

  Future<void> uploadImage() async {
    await imagesRepo.uploadImage(
        imageUrl: selectedImage ?? selectedAvatarPathFile);
  }

  getImage() async {
    final result = await imagesRepo.getImage(
        imageUrl: selectedImage ?? selectedAvatarPathFile);
    return result.fold(
      (failure) => throw failure,
      (imageUrl) => imageUrl,
    );
  }

  Future<void> fillProfile({
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController phoneNumberController,
    required String grade,
  }) async {
    emit(FillProfileLoadingState());
    await uploadImage();
    String image = await getImage();

    final result = await authRepo.addStudentData(
        studentEntity: StudentEntity(
      email: user.email!,
      uid: user.uid,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
      grade: grade,
      oldStudent: true,
      imageUrl: image,
    ));
    result.fold((failure) {
      emit(FillProfileFailureState(message: failure.errMessage));
    }, (studentEntity) {
      emit(FillProfileSuccessState(
        studentEntity: studentEntity,
      ));
    });
  }
}
