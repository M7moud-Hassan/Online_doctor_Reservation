import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/p_d_sing.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key, required this.singInData});
  final SingInData singInData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("welcomPage"),
      ),
      body: Column(
        children: [
          Text("your email is ${singInData.userCredential.user!.email}"),
          Text("yor are ${singInData.isDoctor ? "Doctor" : "Person"}"),
          Text(singInData.userCredential.user!.emailVerified.toString())
        ],
      ),
    );
  }
}
