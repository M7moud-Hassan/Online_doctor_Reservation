import 'package:date_field/date_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/text_field.dart';

Widget doctorOrPerson = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Switch(value: true, onChanged: (value) {}),
    const Text(SING_UP_DOCTOR),
  ],
);

Widget fName = textField(FNAME, MESS_ERROR_EMPTY_FIELD);
Widget lName = textField(LNAME, MESS_ERROR_EMPTY_FIELD);
Widget idPerson = textField(ID_PERSON, MESS_ERROR_EMPTY_FIELD);
Widget emailPerson = TextFormField(
  keyboardType: TextInputType.emailAddress,
  autofocus: true,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return ENTER_EMAIL;
    } else if (!EmailValidator.validate(value)) {
      return ERROR_EMAIL;
    } else {
      //  emailAndPassword.email = value;
    }
    return null;
  },
  decoration: const InputDecoration(
    hintText: HINT_EMAIL,
    labelText: HINT_EMAIL,
  ),
);

Widget passPerson = passwordField(ENTER_PASSWORD);
Widget confirmPass = passwordField(CONF_PASSWORD);

Widget birthDate = dateAndTimeField(BIRTH_DATE);

Widget phoneNumberWidget = textField(PHONE_NUMBER, MESS_ERROR_EMPTY_FIELD);

Widget countryWidget = textField(COUNTRY, MESS_ERROR_EMPTY_FIELD);
Widget cityWidget = textField(CITY, MESS_ERROR_EMPTY_FIELD);
Widget regoinWidget = textField(REGOIN, MESS_ERROR_EMPTY_FIELD);

Widget genderWidget = RadioGroup<String>.builder(
  groupValue: "male",
  onChanged: (value) {},
  items: ["female", "male"],
  itemBuilder: (item) => RadioButtonBuilder(
    item,
  ),
);

Widget syndicalismNumberWidget =
    textField(SYNDICALISMNUMBER, MESS_ERROR_EMPTY_FIELD);

Widget countryCWidget = textField(COUNTRYC, MESS_ERROR_EMPTY_FIELD);
Widget cityCWidget = textField(CITYC, MESS_ERROR_EMPTY_FIELD);
Widget regoinCWidget = textField(REGOINC, MESS_ERROR_EMPTY_FIELD);

Widget startTimeWidget = dateAndTimeField(START_TIME);
Widget endTimeWidget = dateAndTimeField(END_TIME);

Widget loadCertification =
    const ElevatedButton(onPressed: null, child: Text(LOAD_CER));

Widget showLoadCertificationFile = const Text("");

Widget singUpBtn =
    const ElevatedButton(onPressed: null, child: Text(TITLE_SING_UP));
