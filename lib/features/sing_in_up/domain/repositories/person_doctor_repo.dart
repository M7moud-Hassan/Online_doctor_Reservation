import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/core/errors/failure.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

import '../entities/p_d_sing.dart';

abstract class PersonDoctorRepo {
  Future<Either<Failure, UserCredential>> singUpP(Person person);
  Future<Either<Failure, UserCredential>> singUpD(Doctor doctor);
  Future<Either<Failure, UserCredential>> singIn(SingIn person);
}
