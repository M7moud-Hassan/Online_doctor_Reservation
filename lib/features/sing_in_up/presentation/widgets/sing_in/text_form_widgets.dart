import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';

TextFormField emailTextForm = TextFormField(
  keyboardType: TextInputType.emailAddress,
  autofocus: true,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return ENTER_EMAIL;
    } else if (!EmailValidator.validate(value)) {
      return ERROR_EMAIL;
    }
    return null;
  },
  decoration: const InputDecoration(
    hintText: HINT_EMAIL,
    labelText: HINT_EMAIL,
  ),
);

TextFormField passTextField = TextFormField(
  obscureText: true,
  enableSuggestions: false,
  autocorrect: false,
  keyboardType: TextInputType.visiblePassword,
  decoration: const InputDecoration(
      suffixIcon: IconButton(
        onPressed: null,
        icon: Icon(Icons.visibility),
      ),
      alignLabelWithHint: true,
      hintText: HINT_PASS,
      labelText: HINT_PASS),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return ENTER_PASSWORD;
    } else if (value.length < 8) {
      return LENGHT_PASS_LESS;
    }
    return null;
  },
);

Widget btnSingIn(GlobalKey<FormState> formKey, context) => ElevatedButton(
    onPressed: () {
      if (formKey.currentState!.validate()) {}
    },
    child: const Text(TITLE));

Widget singUpLink(context) => Container(
      padding: const EdgeInsets.only(left: 5),
      width: double.infinity,
      child: Text(
        SING_UP_LINK,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

Widget logSingIn = SizedBox(
    width: 200, height: 200, child: Image.asset("assets/logo_sing/logo.png"));
