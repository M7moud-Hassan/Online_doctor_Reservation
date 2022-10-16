import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repositories/person_doctor_repo.dart';

class SingIn {
  PersonDoctorRepo personDoctorRepo;
  SingIn({required this.personDoctorRepo});
  Future<Either<Failure, SingIn>> call(SingIn person) async {
    return await personDoctorRepo.singInD(person);
  }
}
