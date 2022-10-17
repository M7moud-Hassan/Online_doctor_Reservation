import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/p_d_sing.dart';

abstract class SingInRemoteDataSource {
  Future<SingInData> singIn(String email, String password);
  Future<Unit> verificationEmail(UserCredential userCredential);
}

class SingInRemoteDataSourceImp implements SingInRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  SingInRemoteDataSourceImp({required this.firebaseAuth});
  @override
  Future<Unit> verificationEmail(UserCredential userCredential) async {
    try {
      await userCredential.user!.sendEmailVerification();
      return Future.value(unit);
    } catch (e) {
      throw ErrorException();
    }
  }

  @override
  Future<SingInData> singIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      bool doctor = await isDoctor(email);
      return SingInData(userCredential: userCredential, isDoctor: doctor);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw UserNotFoundException();
      } else if (e.code == "wrong-password") {
        throw WrongPasswordException();
      } else {
        throw ErrorException();
      }
    } on Exception {
      throw ErrorException();
    }
  }

  Future<bool> isDoctor(String email) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Person");
    QuerySnapshot<Object?> result =
        await collectionReference.where("email", isEqualTo: email).get();
    return result.docs.isEmpty;
  }
}
