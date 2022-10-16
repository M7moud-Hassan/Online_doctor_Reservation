import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_doctor_reservation/core/errors/failure.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/person_doctor_remote_data.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/repositories/person_doctor_repoImp.dart';
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
            SingUpP singUpP = SingUpP(
                personDoctorRepo: PersonDoctorRepoImp(
                    pdRemoteDataSourceImp: PDRemoteDataSourceImp(
                        firebaseAuth: FirebaseAuth.instance)));
            Either result = await singUpP(Person(
                fName: "mahmoud",
                lName: "hassan",
                pId: "2435355354664",
                email: "soonfu0@gmail.com",
                pass: "jak01142",
                birthDate: DateTime(1996, 12, 8),
                phoneNumber: "01142788054",
                country: "egypt",
                region: "sohag",
                city: "saqlth",
                gender: Gender.male));
            result.fold((l) => {print(l.toString())}, (r) {
              UserCredential userCredential = r as UserCredential;

              print(userCredential.user!.email);
            });
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
