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
