import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/p_d_sing.dart';

class SingUpP {
  PersonDoctorRepo personDoctorRepo;
  SingUpP({required this.personDoctorRepo});
  Future<Either<Failure, UserCredential>> call(Person person) async {
    return personDoctorRepo.singUpP(person);
  }
}
