part of 'sing_in_bloc.dart';

abstract class SingInState extends Equatable {
  const SingInState();

  @override
  List<Object> get props => [];
}

class SingInInitial extends SingInState {}

class CheckNetworkState extends SingInState {
  final bool isConnected;

  const CheckNetworkState({required this.isConnected});
  @override
  List<Object> get props => [isConnected];
}

class ShowPasswordState extends SingInState {}

class HidePasswordState extends SingInState {}

class StartSingInState extends SingInState {}

class SingInByEmailAndPassState extends SingInState {
  final SingInData singInData;

  const SingInByEmailAndPassState({required this.singInData});
  @override
  List<Object> get props => [singInData];
}

class MessageFailureState extends SingInState {
  final String message;
  const MessageFailureState({required this.message});
  @override
  List<Object> get props => [];
}

class StartVerificationEmailState extends SingInState {}

class EndVerificationEmailState extends SingInState {}

class BackToSingPageState extends SingInState {}
