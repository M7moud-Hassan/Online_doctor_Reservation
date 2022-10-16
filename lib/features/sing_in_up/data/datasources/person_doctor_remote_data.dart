import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_doctor_reservation/core/errors/exceptions.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/models/model_doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/models/model_person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

abstract class PDRemoteDataSource {
  Future<UserCredential> singUpP(Person person);
  Future<UserCredential> singUpD(Doctor doctor);
  Future<UserCredential> singIn(SingIn singIn);
}

class PDRemoteDataSourceImp implements PDRemoteDataSource {
  late CollectionReference users;
  final FirebaseAuth firebaseAuth;

  PDRemoteDataSourceImp({required this.firebaseAuth});

  @override
  Future<UserCredential> singUpP(Person person) async {
    UserCredential userCredential = await createUser(person.email, person.pass);
    users =
        FirebaseFirestore.instance.collection(person.runtimeType.toString());
    await users.add(ModelPerson(
            fName: person.fName,
            lName: person.lName,
            pId: person.pId,
            email: person.email,
            pass: person.pass,
            birthDate: person.birthDate,
            phoneNumber: person.phoneNumber,
            country: person.country,
            region: person.region,
            city: person.city,
            gender: person.gender)
        .toJson());

    return userCredential;
  }

  @override
  Future<UserCredential> singIn(SingIn singIn) {
    // TODO: implement singIn
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> singUpD(Doctor doctor) async {
    UserCredential userCredential = await createUser(doctor.email, doctor.pass);
    users =
        FirebaseFirestore.instance.collection(doctor.runtimeType.toString());
    await users.add(ModelDoctor(
        syndicalismNumber: doctor.syndicalismNumber,
        countryC: doctor.countryC,
        regionC: doctor.regionC,
        cityC: doctor.cityC,
        flatNumber: doctor.flatNumber,
        startTime: doctor.startTime,
        endTime: doctor.endTime,
        bachelorCertification: doctor.bachelorCertification,
        fName: doctor.fName,
        lName: doctor.lName,
        pId: doctor.pId,
        email: doctor.email,
        pass: doctor.pass,
        birthDate: doctor.birthDate,
        phoneNumber: doctor.phoneNumber,
        country: doctor.country,
        region: doctor.region,
        city: doctor.city,
        gender: doctor.gender));
    return userCredential;
  }

  Future<UserCredential> createUser(email, password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw EmailInvalidException();
      } else if (e.code == "weak-password") {
        throw PasswordWeakException();
      } else if (e.code == "email-already-in-use") {
        throw EmailIsUseException();
      } else {
        throw ErrorException();
      }
    }
  }
}
