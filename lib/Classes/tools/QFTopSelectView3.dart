import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QFTopSelectView3 extends StatefulWidget {
 int selectIndex = 0;

  QFTopSelectView3({
    this.selectIndex,
  });

  @override
  QFTopSelectView3State createState() => QFTopSelectView3State(
        selectIndex: this.selectIndex,
      );
}

class QFTopSelectView3State extends State<QFTopSelectView3> {
 int selectIndex = 0;

  QFTopSelectView3State({
    this.selectIndex,
  });

  GestureDetector getText(int index, String title) {
    bool isSelected = index == selectIndex;

    if (index == 1 || index == 2) {
      isSelected = false;
    }
    return GestureDetector(
      onTap: () {
        if (index != 1 && index != 2) {
          setState(() {
            selectIndex = index;
          });
        }
      },
      child: new Text(
        title,
        style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            color:
                isSelected ? Color.fromARGB(255, 255, 46, 23) : Colors.white),
      ),
    );
  }

  Widget setTopSelectView() {
    return Stack(
      children: <Widget>[
        Container(
          height: 33,
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromARGB(255, 162, 211, 253),
                Color.fromARGB(255, 162, 211, 253),
              ],
            ),
          ),
        ),
        Container(
          height: 33,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getText(0, "宏观动态"),
              getText(1, "行业信息"),
              getText(2, "即时快讯"),
              getText(3, "国际新闻"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return setTopSelectView();
  }
}
