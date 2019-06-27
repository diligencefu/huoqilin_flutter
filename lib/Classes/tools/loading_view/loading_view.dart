// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child:   Center(
        //保证控件居中效果
        child:   SizedBox(
          width: 80.0,
          height: 80.0,
          child:   Container( 
            decoration: ShapeDecoration(
              color: Color.fromARGB(240, 15, 18, 21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child:   CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor:   AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 236, 241, 249)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
