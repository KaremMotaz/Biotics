import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitialState());

  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signinWithEmailAndPassword() async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithEmailAndPassword(
      password: passwordController.text,
      email: emailController.text,
    );
    result.fold((failure) {
      emit(SigninFailureState(message: failure.message));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithGoogle();
    result.fold((failure) {
      emit(SigninFailureState(message: failure.message));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }

  Future<void> signinWithFacebook() async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithFacebook();
    result.fold((failure) {
      emit(SigninFailureState(message: failure.message));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
  }
}
