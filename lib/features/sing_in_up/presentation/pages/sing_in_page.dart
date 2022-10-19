import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/strings/sing_strings.dart';
import 'package:online_doctor_reservation/features/sing_in_up/presentation/widgets/sing_in/sing_in_widget.dart';

import '../../../../core/themes/sing_theme.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: singTheme,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: const Text(TITLE),
                )
              ],
          body: SingInForm()),
    );
  }
}
