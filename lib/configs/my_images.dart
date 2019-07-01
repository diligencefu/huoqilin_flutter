import 'package:flutter/material.dart';

class MyImage {
  static Image getPicPlaceHolder() {
    return Image.asset(
      "lib/assets/images/placeholder_image.png",
      fit: BoxFit.cover,
    );
  }

  // 获得图片路径
  static String getImageAsset(String name) => "lib/assets/images/" + name;
}
