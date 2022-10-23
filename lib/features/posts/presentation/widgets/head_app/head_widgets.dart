import 'package:flutter/material.dart';
import 'package:online_doctor_reservation/core/strings/home_strings.dart';
import 'package:online_doctor_reservation/core/widgets/logo_widget.dart';

Widget btnAppBar(onPressed, icon) =>
    IconButton(onPressed: onPressed, icon: Icon(icon));

Tab tabWidget(icon) => Tab(
      icon: Icon(icon),
    );

Widget titleHome = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    logoWidget,
    const Text(NAME_APP),
  ],
);
