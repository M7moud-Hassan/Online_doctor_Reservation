import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_up/sing_up_form.dart';

import '../../../../core/strings/sing_strings.dart';
import '../../../../core/themes/sing_theme.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: singTheme,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: const Text(TITLE_SING_UP),
                )
              ],
          body: SingUpForm()),
    );
  }
}
