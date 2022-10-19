import 'package:flutter/material.dart';

double fontSizeTitle = 25;
final singTheme = ThemeData(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeTitle)),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2, color: Colors.blue),
        )),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 20,
            color: Colors.blue,
            decoration: TextDecoration.underline)),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.blue));
