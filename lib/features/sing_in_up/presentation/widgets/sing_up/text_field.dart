import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';

TextFormField textField(String hint, messError) => TextFormField(
      keyboardType:
          hint == PHONE_NUMBER ? TextInputType.phone : TextInputType.text,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return messError;
        } else {}
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
TextFormField passwordField(hint) => TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_off),
          ),
          alignLabelWithHint: true,
          hintText: hint,
          labelText: hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return MESS_ERROR_EMPTY_FIELD;
        } else {}
        return null;
      },
    );

Widget dateAndTimeField(label) => DateTimeFormField(
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
      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      onDateSelected: (DateTime value) {},
    );
