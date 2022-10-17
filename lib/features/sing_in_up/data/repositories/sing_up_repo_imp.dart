import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/remote_data_sing_up.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';

class SingUpRepoImp implements SingUpRepo {
  final SingUpRemoteDataSource singUpRemoteDataSource;

  SingUpRepoImp({required this.singUpRemoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> singUpP(Person person) async {
    return singUp(singUpRemoteDataSource.singUpP(person));
  }

  @override
  Future<Either<Failure, UserCredential>> singUpD(Doctor doctor) async {
    return singUp(singUpRemoteDataSource.singUpD(doctor));
  }

  Future<Either<Failure, UserCredential>> singUp(
      Future<UserCredential> fun) async {
    try {
      return Right(await fun);
    } on EmailInvalidException {
      return Left(EmailIsInvalidFailur());
    } on EmailIsUseException {
      return Left(EmailIsUseFailur());
    } on PasswordWeakException {
      return Left(PasswordWeakFailur());
    } on ErrorException {
      return Left(ErrorFailure());
    }
  }
}
