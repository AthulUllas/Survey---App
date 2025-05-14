import 'package:flutter/material.dart';

void snackBar(String message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(),
    duration: Duration(seconds: 1),
  );
  final errorBar = ScaffoldMessenger.of(context);
  errorBar.showSnackBar(snackBar);
}

void hideSnackBar(BuildContext context) {
  final errorBar = ScaffoldMessenger.of(context);
  errorBar.hideCurrentSnackBar();
}
