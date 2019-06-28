// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cached_network_image/cached_network_image.dart';
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



class NinePicture<T> extends PopupRoute<T> {
  final String barrierLabel;
  final List picList; //图片集合
  final int index; //显示的图片下标
  int startX;
  int endX;

  NinePicture(this.picList, this.index, {this.barrierLabel});

  @override
  Duration get transitionDuration => Duration(milliseconds: 2000);

  @override
  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: GestureDetector(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) => GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: _PictureWidget(picList, index),
              ),
        ),
      ),
    );
  }
}

class _PictureWidget extends StatefulWidget {
  final List picList;
  final int index;

  _PictureWidget(this.picList, this.index);

  @override
  State createState() {
    return _PictureWidgetState();
  }
}

class _PictureWidgetState extends State<_PictureWidget> {
  int startX = 0;
  int endX = 0;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    print("全屏显示：${widget.picList}${widget.index}");
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black,
      child: new Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget.picList[index],
                  fit: BoxFit.cover,
                ),
              ),
              onHorizontalDragDown: (detail) {
                startX = detail.globalPosition.dx.toInt();
              },
              onHorizontalDragUpdate: (detail) {
                endX = detail.globalPosition.dx.toInt();
              },
              onHorizontalDragEnd: (detail) {
                _getIndex(endX - startX);
                setState(() {});
              },
              onHorizontalDragCancel: () {},
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    widget.picList.length,
                    (i) => GestureDetector(
                          child: CircleAvatar(
                            foregroundColor: Theme.of(context).primaryColor,
                            radius: 4.0,
                            backgroundColor:  Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              startX = endX = 0;
                              index = i;
                            });
                          },
                        ),
                  ).toList(),
                ),
              ),
            )
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }

  void _getIndex(int delta) {
    if (delta > 50) {
      setState(() {
        index--;
        index = index.clamp(0, widget.picList.length - 1);
      });
    } else if (delta < 50) {
      setState(() {
        index++;
        index = index.clamp(0, widget.picList.length - 1);
      });
    }
  }
}
