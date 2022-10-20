import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/core/widgets/snackbar_widget.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_up/sing_up_bloc.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/text_field.dart';

Widget doctorOrPerson(value, context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Switch(
            value: value,
            onChanged: (valu) {
              if (value) {
                SingUpBloc.get(context).add(SignUpAsPersonEvent());
              } else {
                SingUpBloc.get(context).add(SingUpAsDoctorEvent());
              }
            }),
        Text(value ? SING_UP_DOCTOR : SING_UP_PERSON),
      ],
    );
Widget fName(Person person) => textField(FNAME, MESS_ERROR_EMPTY_FIELD, person);
Widget lName(Person person) => textField(LNAME, MESS_ERROR_EMPTY_FIELD, person);
Widget idPerson(Person person) =>
    textField(ID_PERSON, MESS_ERROR_EMPTY_FIELD, person);
Widget emailPerson(Person person) => TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ENTER_EMAIL;
        } else if (!EmailValidator.validate(value)) {
          return ERROR_EMAIL;
        } else {
          person.email = value;
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: HINT_EMAIL,
        labelText: HINT_EMAIL,
      ),
    );

Widget passPerson(showPass, showPassCon, context, person) =>
    passwordField(ENTER_PASSWORD, showPass, showPassCon, context, person);
Widget confirmPass(showPass, showPassCon, context, person) =>
    passwordField(CONF_PASSWORD, showPass, showPassCon, context, person);

Widget birthDate(person) => dateAndTimeField(BIRTH_DATE, person);

Widget phoneNumberWidget(person) =>
    textField(PHONE_NUMBER, MESS_ERROR_EMPTY_FIELD, person);

Widget countryWidget(person) =>
    textField(COUNTRY, MESS_ERROR_EMPTY_FIELD, person);
Widget cityWidget(person) => textField(CITY, MESS_ERROR_EMPTY_FIELD, person);
Widget regoinWidget(person) =>
    textField(REGOIN, MESS_ERROR_EMPTY_FIELD, person);

Widget genderWidget(gender, context, Person person) =>
    RadioGroup<String>.builder(
      groupValue: gender,
      onChanged: (value) {
        if (gender == FEMALE) {
          person.gender = Gender.male;
          SingUpBloc.get(context).add(ChangeGenderMaleEvent());
        } else {
          person.gender = Gender.female;
          SingUpBloc.get(context).add(ChangeGenderFemaleEvent());
        }
      },
      items: const [FEMALE, MALE],
      itemBuilder: (item) => RadioButtonBuilder(
        item,
      ),
    );

Widget syndicalismNumberWidget(doctor) =>
    textField(SYNDICALISMNUMBER, MESS_ERROR_EMPTY_FIELD, doctor);

Widget countryCWidget(doctor) =>
    textField(COUNTRYC, MESS_ERROR_EMPTY_FIELD, doctor);
Widget cityCWidget(doctor) => textField(CITYC, MESS_ERROR_EMPTY_FIELD, doctor);
Widget regoinCWidget(doctor) =>
    textField(REGOINC, MESS_ERROR_EMPTY_FIELD, doctor);

Widget startTimeWidget(person) => dateAndTimeField(START_TIME, person);
Widget endTimeWidget(person) => dateAndTimeField(END_TIME, person);

Widget loadCertification(person, context) => ElevatedButton(
    onPressed: () async {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (result != null) {
        (person as Doctor).bachelorCertification = result.files.first.path!;
        SingUpBloc.get(context)
            .add(LoadCertificationEvent(result.files.first.name));
      } else {
        SingUpBloc.get(context)
            .add(const LoadCertificationEvent(NO_FILE_LOADED));
      }
    },
    child: const Text(LOAD_CER));

Widget showLoadCertificationFile(fileName) {
  return Expanded(
    child: Text(
      fileName,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget singUpBtn(
        GlobalKey<FormState> formKey, Person person, startSingUp, context) =>
    startSingUp
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (person.runtimeType.toString() == "Person") {
                  SingUpBloc.get(context).add(SingUpPersonEvent(person));
                } else {
                  Doctor doctor = person as Doctor;
                  if (doctor.bachelorCertification.isEmpty) {
                    snackBarError(context, NO_FILE_LOADED);
                  } else {
                    SingUpBloc.get(context).add(SingUpPersonEvent(doctor));
                  }
                }
              }
            },
            child: const Text(TITLE_SING_UP));
