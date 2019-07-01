import 'package:flutter/material.dart';

class MyColor {
  // 主色调
  static const mainColor = Color.fromARGB(255, 16, 101, 230);

  //文字黑体
  static const textBlackColor = Color.fromARGB(255, 39, 46, 69);

  static const textGreyColor = Color.fromARGB(255, 152, 163, 182);

  static const backColor = Color.fromARGB(255, 235, 239, 243);

  static const redColor = Color.fromARGB(255, 255, 46, 23);

  static Color getGrayColor(int value) {

    return Color.fromARGB(255, value, value, value);
  }

  static Color setRGBColor(int r, int g, int b) {

    return Color.fromARGB(255, r, g, b);
  }
}
