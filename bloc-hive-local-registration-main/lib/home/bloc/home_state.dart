// ignore_for_file: prefer_const_constructors_in_immutables

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final String? error;
  HomeInitial({this.error});
  @override
  List<Object?> get props => [error];
}

class SuccessfulLoginState extends HomeState {
  final String username;

  SuccessfulLoginState(this.username);

  @override
  List<Object?> get props => [username];
}

class RegisteringServicesState extends HomeState {
  @override
  List<Object?> get props => [];
}
