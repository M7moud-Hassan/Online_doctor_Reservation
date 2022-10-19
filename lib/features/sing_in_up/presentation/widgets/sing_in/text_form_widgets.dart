import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_in/sing_in_bloc.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/pages/sing_up_page.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_in/sing_in_form.dart';
import 'package:flutter_html/flutter_html.dart';

TextFormField emailTextForm(EmailAndPassword emailAndPassword) => TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ENTER_EMAIL;
        } else if (!EmailValidator.validate(value)) {
          return ERROR_EMAIL;
        } else {
          emailAndPassword.email = value;
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: HINT_EMAIL,
        labelText: HINT_EMAIL,
      ),
    );

TextFormField passTextField(
        context, bool showPassword, EmailAndPassword emailAndPassword) =>
    TextFormField(
      obscureText: !showPassword,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<SingInBloc>(context).add(
                  showPassword ? HidePasswordEvent() : ShowPasswordEvent());
            },
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
          ),
          alignLabelWithHint: true,
          hintText: HINT_PASS,
          labelText: HINT_PASS),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ENTER_PASSWORD;
        } else if (value.length < 8) {
          return LENGHT_PASS_LESS;
        } else {
          emailAndPassword.password = value;
        }
        return null;
      },
    );

Widget btnSingIn(GlobalKey<FormState> formKey, context,
        EmailAndPassword emailAndPassword) =>
    ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            SingInBloc.get(context).add(StartSingInEvent(
                email: emailAndPassword.email,
                password: emailAndPassword.password));
          }
        },
        child: const Text(TITLE_SING_IN));

Widget singUpLink(context) => Container(
      padding: const EdgeInsets.only(left: 5),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SingUpPage()),
          );
        },
        child: Text(
          SING_UP_LINK,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );

Widget logSingIn = SizedBox(
    width: 200, height: 200, child: Image.asset("assets/logo_sing/logo.png"));

Widget indicator(context) => const CircularProgressIndicator();

Widget verificationEmail(
    UserCredential userCredential, context, startSend, reSend) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Html(
          data: reSend
              ? reVerifyEmailStr(userCredential.user!.email)
              : verifyEmailStr(userCredential.user!.email),
          style: {
            "p": Style(fontSize: FontSize(18), alignment: Alignment.center),
            "mark": Style(color: Colors.red),
            "span": Style(color: Colors.red)
          },
        ),
        const SizedBox(
          height: 20,
        ),
        startSend
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  SingInBloc.get(context).add(
                      VerificationEmailEvent(userCredential: userCredential));
                },
                child: Text(reSend ? RE_VERIFY_EMAIL : VERIFY_EMAIL))
      ],
    ),
  );
}
