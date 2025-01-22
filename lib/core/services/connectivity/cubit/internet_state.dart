part of 'internet_cubit.dart';

sealed class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

final class InternetInitial extends InternetState {}

final class ConnectedState extends InternetState {}

final class NotConnectedState extends InternetState {}
