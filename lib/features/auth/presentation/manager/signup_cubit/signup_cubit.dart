import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitialState());

  final AuthRepo authRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signupWithEmailAndPassword() async {
    emit(SignupLoadingState());
    final result = await authRepo.signupWithEmailAndPassword(
      password: passwordController.text,
      email: emailController.text,
    );
    result.fold((failure) {
      emit(SignupFailureState(message: failure.message));
    }, (userEntity) {
      emit(SignupSuccessState(userEntity: userEntity));
    });
  }
    void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
