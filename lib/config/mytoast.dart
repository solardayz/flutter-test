import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void MyToast(msg) {
  Fluttertoast.showToast(
      msg: 'Toast $msg',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      fontSize: 20.0,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT);
}
