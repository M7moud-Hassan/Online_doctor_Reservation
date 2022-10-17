import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/p_d_sing.dart';
import '../repositories/person_doctor_repo.dart';

class SingInPD {
  SingInRepo singInRepo;
  SingInPD({required this.singInRepo});
  Future<Either<Failure, SingInData>> call(
      String email, String password) async {
    return await singInRepo.singIn(email, password);
  }
}
