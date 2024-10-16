import 'package:drill_app/constant/constant.dart';
import 'package:flutter/material.dart';

void snackBarApiError(String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
      },
    ),
  );

  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
