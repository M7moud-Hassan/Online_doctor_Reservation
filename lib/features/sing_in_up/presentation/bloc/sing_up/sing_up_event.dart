part of 'sing_up_bloc.dart';

abstract class SingUpEvent extends Equatable {
  const SingUpEvent();

  @override
  List<Object> get props => [];
}

class SingUpAsDoctorEvent extends SingUpEvent {}

class SignUpAsPersonEvent extends SingUpEvent {}

class ShowPassUpEvent extends SingUpEvent {}

class ShowConfirmPassEvent extends SingUpEvent {}

class HidePassUpEvent extends SingUpEvent {}

class HideConfirmPassEvent extends SingUpEvent {}

class ChangeGenderMaleEvent extends SingUpEvent {}

class ChangeGenderFemaleEvent extends SingUpEvent {}

class SingUpPersonEvent extends SingUpEvent {
  final Person person;
  const SingUpPersonEvent(this.person);
  @override
  List<Object> get props => [person];
}

class LoadCertificationEvent extends SingUpEvent {
  final String nameFile;

  const LoadCertificationEvent(this.nameFile);
}
