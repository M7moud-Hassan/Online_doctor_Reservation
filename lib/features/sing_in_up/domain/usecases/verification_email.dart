import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';

class VerificationEmail {
  SingInRepo singInRepo;

  VerificationEmail({required this.singInRepo});
  Future<Either<Failure, Unit>> call(UserCredential userCredential) async {
    return await singInRepo.verificationEmail(userCredential);
  }
}
