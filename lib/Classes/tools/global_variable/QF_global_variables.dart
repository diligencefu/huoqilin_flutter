import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalVariable {
  static Image getPicPlaceHolder() {
    return Image.asset(
      "lib/assets/images/placeholder_image.imageset.png",
      fit: BoxFit.cover,
    );
  }

  static void showLongToast(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showColoredToast(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  static void showShortToast(String massage) {
    Fluttertoast.showToast(
        msg: massage, toastLength: Toast.LENGTH_SHORT, timeInSecForIos: 1);
  }

  static void showTopShortToast(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1);
  }

  static void showCenterShortToast(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }

  static void setToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color.fromARGB(189, 0, 0, 0));
  }
}
