import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/core/errors/Failure.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

abstract class PersonDoctorRepo {
  Future<Either<Failure, SingIn>> singUp(Person person);
  Future<Either<Failure, SingIn>> singIn(SingIn person);
}
