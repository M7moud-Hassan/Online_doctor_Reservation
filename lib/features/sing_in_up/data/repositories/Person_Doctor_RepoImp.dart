import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/person_doctor_remote_data.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/core/errors/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

class PersonDoctorRepoImp implements PersonDoctorRepo {
  final PDRemoteDataSourceImp pdRemoteDataSourceImp;

  PersonDoctorRepoImp({required this.pdRemoteDataSourceImp});

  @override
  Future<Either<Failure, SingIn>> singIn(SingIn person) async {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SingIn>> singUpP(Person person) async {
    return Right(await pdRemoteDataSourceImp.singUpP(person));
  }

  @override
  Future<Either<Failure, SingIn>> singUpD(Doctor doctor) async {
    return Right(await pdRemoteDataSourceImp.singUpD(doctor));
  }
}
