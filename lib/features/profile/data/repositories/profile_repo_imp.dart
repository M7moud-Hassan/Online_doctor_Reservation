import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/features/profile/data/datasources/profile_remote_data.dart';
import 'package:online_doctor_reservation/features/profile/domain/entities/profile.dart';
import 'package:online_doctor_reservation/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/profile/domain/repositories/profile_repo.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';

class ProfileInfoRepoImp implements ProfileInfoRepo {
  final ProfileRemoteData profileRemoteData;

  ProfileInfoRepoImp({required this.profileRemoteData});
  @override
  Future<Either<Failure, ProfileInfo>> loadProfileInfo(SingInData user) async {
    try {
      return Right(await profileRemoteData.loadInfo(
          user.userCredential.user!.email!,
          user.isDoctor ? "Doctor" : "Person"));
    } on InternetIsNotConnectingException {
      return Left(InternetIsNotConnectingFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
