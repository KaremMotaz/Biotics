import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/student_entity.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitialState());

  final AuthRepo authRepo;

  Future<void> signupWithEmailAndPassword({
    required S locale,
    required TextEditingController passwordController,
    required TextEditingController emailController,
  }) async {
    emit(SignupLoadingState());
    final result = await authRepo.signupWithEmailAndPassword(
      password: passwordController.text,
      email: emailController.text,
      locale: locale,
    );
    await authRepo.sendEmailVerification(locale: locale);
    result.fold((failure) {
      emit(SignupFailureState(message: failure.errMessage));
    }, (userEntity) {
      emit(SignupSuccessState(userEntity: userEntity));
    });
  }

}
