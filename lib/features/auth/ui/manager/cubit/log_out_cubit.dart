import 'package:biocode/features/auth/domain/auth_repo.dart';
import 'package:biocode/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.authRepo) : super(LogOutInitialState());
  final AuthRepo authRepo;

  Future<void> logOut({required S locale}) async {
    emit(LogOutLoadingState());
    final result = await authRepo.logOut(locale: locale);
    result.fold((failure) {
      emit(LogOutFailureState(message: failure.errMessage));
    }, (unit) {
      emit(LogOutSuccessState());
    });
  }
}
