// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class EmailIsUseFailur extends Failure {
  @override
  List<Object?> get props => [];
}

class PasswordWeakFailur extends Failure {
  @override
  List<Object?> get props => [];
}

class EmailIsInvalidFailur extends Failure {
  @override
  List<Object?> get props => [];
}

class ErrorFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InternetIsNotConnectingFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class TooManyRequestsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
