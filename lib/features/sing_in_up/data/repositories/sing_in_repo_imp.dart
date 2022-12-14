import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/remote_data_sing_in.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/p_d_sing.dart';

class SingInpRepoImp implements SingInRepo {
  final SingInRemoteDataSource singInRemoteDataSource;

  SingInpRepoImp({required this.singInRemoteDataSource});

  @override
  Future<Either<Failure, SingInData>> singIn(
      String email, String password) async {
    try {
      return Right(await singInRemoteDataSource.singIn(email, password));
    } on ErrorException {
      return Left(ErrorFailure());
    } on UserNotFoundException {
      return Left(UserNotFoundFailure());
    } on WrongPasswordException {
      return Left(WrongPasswordFailure());
    } on InternetIsNotConnectingException {
      return Left(InternetIsNotConnectingFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> verificationEmail(
      UserCredential userCredential) async {
    try {
      await singInRemoteDataSource.verificationEmail(userCredential);
      return const Right(unit);
    } on InternetIsNotConnectingException {
      return Left(InternetIsNotConnectingFailure());
    } on TooManyRequestsException {
      return Left(TooManyRequestsFailure());
    } on ErrorException {
      return Left(ErrorFailure());
    }
  }
}
