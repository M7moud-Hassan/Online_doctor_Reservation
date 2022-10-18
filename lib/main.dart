import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/themes/theme_app.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/pages/sing_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: const SingInPage(),
  ));
}
