import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitialState());

  final AuthRepo authRepo;

  Future<void> sendLinkToResetPassword({
    required S locale,
    required TextEditingController emailController,
  }) async {
    emit(ForgotPasswordLoadingState());
    final result = await authRepo.sendLinkToResetPassword(
        email: emailController.text, locale: locale);
    result.fold(
      (failure) {
        emit(ForgotPasswordFailureState(message: failure.errMessage));
      },
      (unit) {
        emit(ForgotPasswordSuccessState());
      },
    );
  }

}
