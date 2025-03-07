import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/features/auth/domain/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitialState());

  final AuthRepo authRepo;

  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());
    final result = await authRepo.signupWithEmailAndPassword(
      password: password,
      email: email,
    );
    result.fold((failure) {
      emit(SignupFailureState(message: failure.message));
    }, (userEntity) {
      emit(SignupSuccessState(userEntity: userEntity));
    });
  }
}
