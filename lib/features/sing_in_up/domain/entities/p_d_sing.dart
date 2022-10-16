import 'package:equatable/equatable.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

class SingIn extends Equatable {
  final String email;
  final String pass;
  final String token;
  final bool asDoctor;

  SingIn(
      {required this.email,
      required this.pass,
      required this.token,
      this.asDoctor = false});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
