import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingInData extends Equatable {
  final UserCredential userCredential;
  final bool isDoctor;
  const SingInData({
    required this.userCredential,
    required this.isDoctor,
  });
  @override
  List<Object?> get props => [userCredential, isDoctor];
}
