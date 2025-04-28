import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription<InternetConnectionStatus> _listener;
  InternetCubit() : super(InternetInitialState()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    _listener =
        InternetConnectionChecker.instance.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        emit(InternetDisconnectedState());
      } else if (status == InternetConnectionStatus.connected) {
        emit(InternetConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _listener.cancel();
    return super.close();
  }
}
