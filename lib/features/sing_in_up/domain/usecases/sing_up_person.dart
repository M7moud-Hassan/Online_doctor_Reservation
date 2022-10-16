import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/Failure.dart';
import '../entities/p_d_sing.dart';

class SingUpP {
  PersonDoctorRepo personDoctorRepo;
  SingUpP({required this.personDoctorRepo});
  Future<Either<Failure, SingIn>> call(Person person) async {
    return personDoctorRepo.singUpP(person);
  }
}
