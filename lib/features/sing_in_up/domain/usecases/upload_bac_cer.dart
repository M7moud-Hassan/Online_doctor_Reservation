import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';

class UploadCertification {
  final UploadCertificationRepo uploadCertificationRepo;

  UploadCertification({required this.uploadCertificationRepo});

  Future<Either<Failure, Unit>> call(String path, String name) {
    return uploadCertificationRepo.uploadCertification(path, name);
  }
}
