import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/core/errors/failure.dart';
import 'package:online_doctor_reservation/features/profile/domain/entities/profile.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';

abstract class ProfileInfoRepo {
  Future<Either<Failure, ProfileInfo>> loadProfileInfo(SingInData users);
}
