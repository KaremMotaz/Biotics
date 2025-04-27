part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetInitialState extends InternetState {}
final class InternetConnectedState extends InternetState {}
final class InternetDisconnectedState extends InternetState {}
