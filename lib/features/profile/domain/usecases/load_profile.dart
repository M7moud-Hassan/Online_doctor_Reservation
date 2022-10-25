import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/profile/domain/entities/profile.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/profile_repo.dart';

class LoadProfileInfo {
  final ProfileInfoRepo profileInfoRepo;
  LoadProfileInfo({required this.profileInfoRepo});

  Future<Either<Failure, ProfileInfo>> call(SingInData user) {
    return profileInfoRepo.loadProfileInfo(user);
  }
}
