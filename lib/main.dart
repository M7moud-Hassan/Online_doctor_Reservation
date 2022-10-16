import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_doctor_reservation/core/errors/Failure.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/person_doctor_remote_data.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/repositories/Person_Doctor_RepoImp.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/repositories/person_doctor_repo.dart';

import 'features/sing_in_up/domain/usecases/sing_up_person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              SingUpP singUpP = SingUpP(
                  personDoctorRepo: PersonDoctorRepoImp(
                      pdRemoteDataSourceImp: PDRemoteDataSourceImp()));
              Either<Failure, SingIn> singIn = await singUpP(Person(
                  fName: "mahmoud",
                  lName: "hassan",
                  pId: "13232637374749",
                  email: "abosamour990@gmail.com",
                  pass: "12345678",
                  birthDate: DateTime(1996, 12, 21),
                  phoneNumber: "011142788054",
                  country: "sohag",
                  region: "egypt",
                  city: "saqlth",
                  gender: Gender.female));
              late SingIn singIn2;
              singIn.fold((failure) => null, (si) => singIn2 = si);
              print(singIn2.email);
              print(singIn2.pass);
              print(singIn2.asDoctor);
              print(singIn2.token);
            } on FirebaseAuthException catch (e) {
              switch (e.code) {
                case "operation-not-allowed":
                  print("Anonymous auth hasn't been enabled for this project.");
                  break;
                default:
                  print("Unknown error.");
              }
            }
          },
          child: const Text("Sing in"),
        ),
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
