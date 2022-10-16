import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/person_doctor_remote_data.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import '../../../../core/errors/failure.dart';

class PersonDoctorRepoImp implements PersonDoctorRepo {
  final PDRemoteDataSourceImp pdRemoteDataSourceImp;

  PersonDoctorRepoImp({required this.pdRemoteDataSourceImp});

  @override
  Future<Either<Failure, UserCredential>> singIn(SingIn person) async {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> singUpP(Person person) async {
    return singUp(pdRemoteDataSourceImp.singUpP(person));
  }

  @override
  Future<Either<Failure, UserCredential>> singUpD(Doctor doctor) async {
    return singUp(pdRemoteDataSourceImp.singUpD(doctor));
  }

  Future<Either<Failure, UserCredential>> singUp(
      Future<UserCredential> fun) async {
    try {
      return Right(await fun);
    } on EmailInvalidException {
      return Left(EmailIsInvalidFailur());
    } on EmailIsUseException {
      return Left(EmailIsInvalidFailur());
    } on PasswordWeakException {
      return Left(PasswordWeakFailur());
    } on ErrorException {
      return Left(ErrorFailure());
    }
  }
}
