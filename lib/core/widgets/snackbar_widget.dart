import 'package:flutter/material.dart';

void snackBarError(context, message) {
  SnackBar snackBar = SnackBar(
    content: Text(message),
    backgroundColor: const Color.fromARGB(255, 229, 80, 70),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
