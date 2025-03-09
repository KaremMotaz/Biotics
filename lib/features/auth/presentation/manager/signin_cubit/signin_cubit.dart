import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitialState());
  final AuthRepo authRepo;
  Future<void> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoadingState());
    final result = await authRepo.signinWithEmailAndPassword(
      password: password,
      email: email,
    );
    result.fold((failure) {
      emit(SigninFailureState(message: failure.message));
    }, (userEntity) {
      emit(SigninSuccessState(userEntity: userEntity));
    });
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
