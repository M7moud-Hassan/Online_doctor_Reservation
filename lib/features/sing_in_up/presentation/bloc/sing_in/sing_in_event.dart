part of 'sing_in_bloc.dart';

abstract class SingInEvent extends Equatable {
  const SingInEvent();

  @override
  List<Object> get props => [];
}

class CheckNetwortEvent extends SingInEvent {}

class ShowPasswordEvent extends SingInEvent {}

class HidePasswordEvent extends SingInEvent {}

class StartSingInEvent extends SingInEvent {
  final String email;
  final String password;
  const StartSingInEvent({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class VerificationEmailEvent extends SingInEvent {
  final UserCredential userCredential;
  const VerificationEmailEvent({required this.userCredential});
  @override
  List<Object> get props => [userCredential];
}

class BackToSingPageEvent extends SingInEvent {}
