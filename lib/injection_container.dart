import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/remote_data_sing_in.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/repositories/sing_in_repo_imp.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_in/sing_in_bloc.dart';

import 'features/sing_in_up/domain/usecases/sing_in_person_doctor.dart';
import 'features/sing_in_up/domain/usecases/verification_email.dart';

final sl = GetIt.instance;
Future<void> init() async {
//! Features - sing in
  sl.registerFactory(() => SingInBloc(singInPD: sl(), verificationEmail: sl()));
// Bloc

// Usecases
  sl.registerLazySingleton(
    () => SingInPD(singInRepo: sl()),
  );
  sl.registerLazySingleton(() => VerificationEmail(singInRepo: sl()));
// Repository
  sl.registerLazySingleton<SingInRepo>(
      () => SingInpRepoImp(singInRemoteDataSource: sl()));

// Datasources

  sl.registerLazySingleton<SingInRemoteDataSource>(
      () => SingInRemoteDataSourceImp(firebaseAuth: FirebaseAuth.instance));
//! Core

//! External
}
