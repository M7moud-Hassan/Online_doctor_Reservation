import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/posts/presentation/pages/home_page.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/bloc/sing_in/sing_in_bloc.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_in/text_form_widgets.dart';
import '../../../../../core/widgets/snackbar_widget.dart';

// ignore: must_be_immutable
class SingInForm extends StatelessWidget {
  SingInForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  final EmailAndPassword emailAndPassword = EmailAndPassword("", "");
  bool startSingIn = false;
  bool reSend = false;
  bool startSend = false;
  bool openVerification = false;
  UserCredential? userCredential;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (openVerification) {
          SingInBloc.get(context).add(BackToSingPageEvent());
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: BlocBuilder<SingInBloc, SingInState>(
          builder: (context, state) {
            if (state is CheckNetworkState && !state.isConnected) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                snackBarError(context, CHECK_INTERNET);
              });
            } else if (state is ShowPasswordState) {
              showPassword = true;
            } else if (state is HidePasswordState) {
              showPassword = false;
            } else if (state is StartSingInState) {
              startSingIn = true;
            } else if (state is SingInByEmailAndPassState) {
              startSingIn = false;
              if (state.singInData.userCredential.user!.emailVerified) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              singInData: state.singInData,
                            )),
                  );
                });
              } else {
                userCredential = state.singInData.userCredential;
                openVerification = true;
              }
            } else if (state is MessageFailureState) {
              startSingIn = false;
              startSend = false;
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                snackBarError(context, state.message);
              });
            } else if (state is StartVerificationEmailState) {
              startSend = true;
            } else if (state is EndVerificationEmailState) {
              startSend = false;
              reSend = true;
            } else if (state is BackToSingPageState) {
              openVerification = false;
            }
            if (openVerification) {
              return verificationEmail(
                  userCredential!, context, startSend, reSend);
            } else {
              return Form(
                  key: _formKey,
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          logSingIn,
                          const SizedBox(
                            height: 20,
                          ),
                          emailTextForm(emailAndPassword),
                          const SizedBox(
                            height: 20,
                          ),
                          passTextField(
                              context, showPassword, emailAndPassword),
                          const SizedBox(
                            height: 20,
                          ),
                          startSingIn
                              ? indicator(context)
                              : btnSingIn(_formKey, context, emailAndPassword),
                          const SizedBox(
                            height: 20,
                          ),
                          singUpLink(context),
                        ],
                      ),
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}

class EmailAndPassword {
  String email;
  String password;
  EmailAndPassword(this.email, this.password);
}
