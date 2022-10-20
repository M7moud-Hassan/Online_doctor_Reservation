import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/doctor.dart';
import 'package:online_doctor_reservation/features/sing_in_up/domain/entities/person.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_up/sing_up_bloc.dart';

TextFormField textField(String hint, messError, Person person) => TextFormField(
      keyboardType:
          hint == PHONE_NUMBER ? TextInputType.phone : TextInputType.text,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return messError;
        } else {
          if (hint == FNAME) {
            person.fName = value;
          } else if (hint == LNAME) {
            person.lName = value;
          } else if (hint == ID_PERSON) {
            person.pId = value;
          } else if (hint == PHONE_NUMBER) {
            person.phoneNumber = value;
          } else if (hint == COUNTRY) {
            person.country = value;
          } else if (hint == CITY) {
            person.city = value;
          } else if (hint == REGOIN) {
            person.region = value;
          } else if (hint == SYNDICALISMNUMBER) {
            (person as Doctor).syndicalismNumber = value;
          } else if (hint == COUNTRYC) {
            (person as Doctor).countryC = value;
          } else if (hint == CITYC) {
            (person as Doctor).cityC = value;
          } else if (hint == REGOINC) {
            (person as Doctor).regionC = value;
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
      ),
    );

SizedBox divideWid = const SizedBox(
  height: 10,
);
TextFormField passwordField(
        hint, showPass, showPassCon, context, Person person) =>
    TextFormField(
      obscureText: hint == ENTER_PASSWORD ? showPass : showPassCon,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (hint == ENTER_PASSWORD) {
                SingUpBloc.get(context)
                    .add(showPass ? HidePassUpEvent() : ShowPassUpEvent());
              } else {
                SingUpBloc.get(context).add(showPassCon
                    ? HideConfirmPassEvent()
                    : ShowConfirmPassEvent());
              }
            },
            icon: Icon(hint == ENTER_PASSWORD
                ? showPass
                    ? Icons.visibility
                    : Icons.visibility_off
                : showPassCon
                    ? Icons.visibility
                    : Icons.visibility_off),
          ),
          alignLabelWithHint: true,
          hintText: hint,
          labelText: hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return MESS_ERROR_EMPTY_FIELD;
        } else if (value.length < 8) {
          return LENGHT_PASS_LESS;
        } else {
          if (hint == ENTER_PASSWORD) {
            person.pass = value;
          } else {
            if (person.pass != value) {
              return NOT_EQUAL;
            }
          }
        }
        return null;
      },
    );

Widget dateAndTimeField(label, Person person) => DateTimeFormField(
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black45),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.event_note),
        labelText: label,
      ),
      mode: label == BIRTH_DATE
          ? DateTimeFieldPickerMode.date
          : DateTimeFieldPickerMode.time,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value == null) {
          return MESS_ERROR_EMPTY_FIELD;
        } else {
          if (label == BIRTH_DATE) {
            person.birthDate = value;
          } else if (label == START_TIME) {
            (person as Doctor).startTime = value;
          } else {
            (person as Doctor).endTime = value;
          }
        }
        return null;
      },
      onDateSelected: (DateTime value) {},
    );
