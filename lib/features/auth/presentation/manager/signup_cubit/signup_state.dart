part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitialState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final UserEntity userEntity;

  SignupSuccessState({required this.userEntity});
}

final class SignupFailureState extends SignupState {
  final String message;
  SignupFailureState({required this.message});
}
