import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/sing_up_form_widgets.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/text_field.dart';

class SingUpForm extends StatelessWidget {
  SingUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            doctorOrPerson,
            fName,
            divideWid,
            lName,
            divideWid,
            idPerson,
            divideWid,
            emailPerson,
            divideWid,
            passPerson,
            divideWid,
            confirmPass,
            divideWid,
            birthDate,
            divideWid,
            phoneNumberWidget,
            divideWid,
            countryWidget,
            divideWid,
            cityWidget,
            divideWid,
            regoinWidget,
            divideWid,
            genderWidget,
            divideWid,
            ...doctorContainer,
          ],
        ),
      )),
    );
  }

  List<Widget> doctorContainer = [
    syndicalismNumberWidget,
    divideWid,
    countryCWidget,
    divideWid,
    cityCWidget,
    divideWid,
    regoinCWidget,
    divideWid,
    startTimeWidget,
    divideWid,
    endTimeWidget,
    divideWid,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showLoadCertificationFile,
        loadCertification,
      ],
    ),
    divideWid,
    singUpBtn
  ];
}
