import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/core/widgets/snackbar_widget.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_up/sing_up_bloc.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/sing_up_form_widgets.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/text_field.dart';

// ignore: must_be_immutable
class SingUpForm extends StatelessWidget {
  SingUpForm({super.key});
  bool singUpAsDoctor = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPass = true;
  bool startSingUp = false;
  bool showPassCon = true;
  String gender = MALE;
  String fileName = "";
  Doctor doctor = Doctor(
      syndicalismNumber: "",
      countryC: "",
      regionC: "",
      cityC: "",
      flatNumber: "",
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      bachelorCertification: "",
      fName: "",
      lName: "",
      pId: "",
      email: "",
      pass: "",
      birthDate: DateTime.now(),
      phoneNumber: "",
      country: "",
      region: "",
      city: "",
      gender: Gender.male);
  Person person = Person(
      fName: "",
      lName: "",
      pId: "",
      email: "",
      pass: "",
      birthDate: DateTime.now(),
      phoneNumber: "",
      country: "",
      region: "",
      city: "",
      gender: Gender.male);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SingUpBloc, SingUpState>(
        listener: (context, state) {
          if (state is SingUpAsPersonState) {
            singUpAsDoctor = false;
          } else if (state is SingUpAsDoctorState) {
            singUpAsDoctor = true;
          } else if (state is ShowPassUpState) {
            showPass = true;
          } else if (state is HidePassUpState) {
            showPass = false;
          } else if (state is ShowPassConfirmState) {
            showPassCon = true;
          } else if (state is HidePassConfirmState) {
            showPassCon = false;
          } else if (state is ChangeGenderMaleState) {
            gender = MALE;
          } else if (state is ChangeGenderFemaleState) {
            gender = FEMALE;
          } else if (state is StartSingUpState) {
            startSingUp = true;
          } else if (state is ShowMessageError) {
            startSingUp = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              snackBarError(context, state.message);
            });
          } else if (state is FinishSingUpState) {
            startSingUp = false;
            snackBarTrue(context, "successful sing up");
            Navigator.maybePop(context);
          } else if (state is LoadCertificationState) {
            fileName = state.nameFile;
          }
        },
        builder: (context, state) {
          return Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    doctorOrPerson(singUpAsDoctor, context),
                    fName(singUpAsDoctor ? doctor : person),
                    divideWid,
                    lName(singUpAsDoctor ? doctor : person),
                    divideWid,
                    idPerson(singUpAsDoctor ? doctor : person),
                    divideWid,
                    emailPerson(singUpAsDoctor ? doctor : person),
                    divideWid,
                    passPerson(showPass, showPassCon, context,
                        singUpAsDoctor ? doctor : person), //
                    divideWid,
                    confirmPass(showPass, showPassCon, context,
                        singUpAsDoctor ? doctor : person), //
                    divideWid,
                    birthDate(singUpAsDoctor ? doctor : person),
                    divideWid,
                    phoneNumberWidget(singUpAsDoctor ? doctor : person),
                    divideWid,
                    countryWidget(singUpAsDoctor ? doctor : person),
                    divideWid,
                    cityWidget(singUpAsDoctor ? doctor : person),
                    divideWid,
                    regoinWidget(singUpAsDoctor ? doctor : person),
                    divideWid,
                    genderWidget(
                        gender, context, singUpAsDoctor ? doctor : person),
                    divideWid,
                    if (singUpAsDoctor) ..._doctorContainer(context),
                    divideWid,
                    singUpBtn(_formKey, singUpAsDoctor ? doctor : person,
                        startSingUp, context)
                  ],
                ),
              ));
        },
      ),
    );
  }

  List<Widget> _doctorContainer(context) => [
        syndicalismNumberWidget(doctor),
        divideWid,
        countryCWidget(doctor),
        divideWid,
        cityCWidget(doctor),
        divideWid,
        regoinCWidget(doctor),
        divideWid,
        startTimeWidget(doctor),
        divideWid,
        endTimeWidget(doctor),
        divideWid,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showLoadCertificationFile(fileName),
            loadCertification(doctor, context),
          ],
        ),
      ];
}
