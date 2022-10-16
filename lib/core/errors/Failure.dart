import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class EmailIsUseFailur extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PasswordWeakFailur extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmailIsInvalidFailur extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
