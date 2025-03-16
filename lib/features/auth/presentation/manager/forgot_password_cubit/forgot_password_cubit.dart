import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitialState());

  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  Future<void> sendLinkToResetPassword() async {
    emit(ForgotPasswordLoadingState());
    final result =
        await authRepo.sendLinkToResetPassword(email: emailController.text);
    result.fold(
      (failure) {
        emit(ForgotPasswordFailureState(message: failure.message));
      },
      (unit) {
        emit(ForgotPasswordSuccessState());
      },
    );
  }

  void dispose() {
    emailController.dispose();
  }
}
