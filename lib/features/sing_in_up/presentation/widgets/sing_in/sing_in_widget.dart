import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_in/text_form_widgets.dart';

class SingInForm extends StatelessWidget {
  SingInForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logSingIn,
              const SizedBox(
                height: 20,
              ),
              emailTextForm,
              const SizedBox(
                height: 20,
              ),
              passTextField,
              const SizedBox(
                height: 20,
              ),
              btnSingIn(_formKey, context),
              const SizedBox(
                height: 20,
              ),
              singUpLink(context),
            ],
          ),
        ));
  }
}
