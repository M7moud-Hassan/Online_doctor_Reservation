import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../datasources/remote_upload_cer.dart';

class UploadCertificationRepoImp implements UploadCertificationRepo {
  UploadCertificationData uploadCertificationData;
  UploadCertificationRepoImp({required this.uploadCertificationData});

  @override
  Future<Either<Failure, Unit>> uploadCertification(String path, name) async {
    try {
      return Right(await uploadCertificationData.uploadFile(path, name));
    } on InternetIsNotConnectingException {
      return Left(InternetIsNotConnectingFailure());
    } on ErrorException {
      return Left(ErrorFailure());
    }
  }
}
