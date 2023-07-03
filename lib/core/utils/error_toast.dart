import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void errorToast(String text) {
  log(text);
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: Colors.red[300],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void successToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.green[300],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
