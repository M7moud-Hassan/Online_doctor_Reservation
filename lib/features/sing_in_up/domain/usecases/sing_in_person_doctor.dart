import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../entities/p_d_sing.dart';
import '../repositories/person_doctor_repo.dart';

class SingInPD {
  PersonDoctorRepo personDoctorRepo;
  SingInPD({required this.personDoctorRepo});
  Future<Either<Failure, UserCredential>> call(SingIn person) async {
    return await personDoctorRepo.singIn(person);
  }
}
