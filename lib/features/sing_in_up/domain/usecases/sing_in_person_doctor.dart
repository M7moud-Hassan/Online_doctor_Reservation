import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../entities/p_d_sing.dart';
import '../repositories/person_doctor_repo.dart';

class SingInPD {
  PersonDoctorRepo personDoctorRepo;
  SingInPD({required this.personDoctorRepo});
  Future<Either<Failure, SingIn>> call(SingIn person) async {
    return await personDoctorRepo.singIn(person);
  }
}
