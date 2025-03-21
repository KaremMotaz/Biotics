part of 'fill_profile_cubit.dart';

@immutable
sealed class FillProfileState {}

final class FillProfileInitialState extends FillProfileState {}

final class FillProfileLoadingState extends FillProfileState {}

final class FillProfileSuccessState extends FillProfileState {
  final StudentEntity userEntity;

  FillProfileSuccessState({required this.userEntity});
}

final class FillProfileFailureState extends FillProfileState {
  final String message;
  FillProfileFailureState({required this.message});
}
