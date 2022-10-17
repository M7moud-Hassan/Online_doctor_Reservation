import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/remote_data_sing_in.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/datasources/remote_data_sing_up.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/repositories/sing_in_repo_imp.dart';
import 'package:online_doctor_reservation/features/sing_in_up/data/repositories/sing_up_repo_imp.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/usecases/sing_in_person_doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/usecases/verification_email.dart';

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
            /* SingUpP singUpP = SingUpP(
                personDoctorRepo: PersonDoctorRepoImp(
                    pdRemoteDataSourceImp: PDRemoteDataSourceImp(
                        firebaseAuth: FirebaseAuth.instance)));
            Either result = await singUpP(Person(
                fName: "mahmoud",
                lName: "hassan",
                pId: "2435355354664",
                email: "abosamour990@gmail.com",
                pass: "jak01142",
                birthDate: DateTime(1996, 12, 8),
                phoneNumber: "01142788054",
                country: "egypt",
                region: "sohag",
                city: "saqlth",
                gender: Gender.male));
            result.fold((l) => {print(l.toString())}, (r) async {
              UserCredential userCredential = r as UserCredential;
              VerificationEmail verificationEmail = VerificationEmail(
                  personDoctorRepo: PersonDoctorRepoImp(
                      pdRemoteDataSourceImp: PDRemoteDataSourceImp(
                          firebaseAuth: FirebaseAuth.instance)));
              Either result1 = await verificationEmail(userCredential);
              result1.fold((l) {
                print("error verification");
              }, (r) => print("verification true"));
            });*/

            /*  SingInPD singInPD = SingInPD(
                personDoctorRepo: PersonDoctorRepoImp(
                    pdRemoteDataSourceImp: PDRemoteDataSourceImp(
                        firebaseAuth: FirebaseAuth.instance)));

            Either result = await singInPD("abosamou990@gmail.com", "jak01142");

            result.fold((l) {
              print(l);
            }, (r) {
              SingInData singInData = r;
              print(singInData.userCredential.user!.email);
            });*/

            SingInPD singInPD = SingInPD(
                singInRepo: SingInpRepoImp(
                    singInRemoteDataSourceImp: SingInRemoteDataSourceImp(
                        firebaseAuth: FirebaseAuth.instance)));
            Either result =
                await singInPD("abosamour990@gmail.com", "jak01142");
            result.fold(
                (l) => print(l), (r) => print((r as SingInData).isDoctor));
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
      child: const Text(
        "Add User",
      ),
    );
  }
}
