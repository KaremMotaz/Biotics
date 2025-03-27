import 'package:biocode/core/services/firebase_auth_service.dart';
import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitialState());

  final AuthRepo authRepo;

  Future<bool> showUserIsOldOrNot() async {
    if (FirebaseAuthService().isLoggedIn()) {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      StudentEntity studentData = await authRepo.getStudentData(uid: uid);
      bool oldStudent = studentData.oldStudent;
      return oldStudent;
    }
    return false;
  }

  Future<void> signinWithEmailAndPassword({
    required S locale,
    required TextEditingController passwordController,
    required TextEditingController emailController,
  }) async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithEmailAndPassword(
      password: passwordController.text,
      email: emailController.text,
      locale: locale,
    );
    result.fold((failure) {
      emit(SigninFailureState(message: failure.errMessage));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }

  Future<void> signinWithGoogle({required S locale}) async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithGoogle(locale: locale);
    result.fold((failure) {
      emit(SigninFailureState(message: failure.errMessage));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }

  Future<void> signinWithFacebook({required S locale}) async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithFacebook(locale: locale);
    result.fold((failure) {
      emit(SigninFailureState(message: failure.errMessage));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }

  getUserData() async {}
}
