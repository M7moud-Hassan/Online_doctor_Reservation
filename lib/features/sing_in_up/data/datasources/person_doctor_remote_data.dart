import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/models/model_doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/models/model_person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';

abstract class PDRemoteDataSource {
  Future<SingIn> singUpP(Person person);
  Future<SingIn> singUpD(Doctor doctor);
  Future<SingIn> singIn(SingIn singIn);
}

class PDRemoteDataSourceImp implements PDRemoteDataSource {
  late CollectionReference users;

  PDRemoteDataSourceImp();

  @override
  Future<SingIn> singUpP(Person person) async {
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

    return SingIn(
        email: person.email, pass: person.pass, id: users.id, asDoctor: false);
  }

  @override
  Future<SingIn> singIn(SingIn singIn) {
    // TODO: implement singIn
    throw UnimplementedError();
  }

  @override
  Future<SingIn> singUpD(Doctor doctor) async {
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
    return SingIn(
        email: doctor.email, pass: doctor.pass, id: users.id, asDoctor: true);
  }
}
