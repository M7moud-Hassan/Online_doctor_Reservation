part of 'sing_up_bloc.dart';

abstract class SingUpState extends Equatable {
  const SingUpState();

  @override
  List<Object> get props => [];
}

class SingUpInitial extends SingUpState {}

class SingUpAsDoctorState extends SingUpState {}

class SingUpAsPersonState extends SingUpState {}

class ShowPassUpState extends SingUpState {}

class ShowPassConfirmState extends SingUpState {}

class HidePassUpState extends SingUpState {}

class HidePassConfirmState extends SingUpState {}

class ChangeGenderFemaleState extends SingUpState {}

class ChangeGenderMaleState extends SingUpState {}

class StartSingUpState extends SingUpState {}

class ShowMessageError extends SingUpState {
  final String message;
  const ShowMessageError({required this.message});
  @override
  List<Object> get props => [message];
}

class FinishSingUpState extends SingUpState {
  final UserCredential userCredential;

  const FinishSingUpState(this.userCredential);

  @override
  List<Object> get props => [userCredential];
}

class LoadCertificationState extends SingUpState {
  final String nameFile;
  const LoadCertificationState(this.nameFile);
  @override
  List<Object> get props => [nameFile];
}
