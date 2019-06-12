import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QFTopSelectView2 extends StatefulWidget {
  @override
  QFTopSelectView2State createState() => QFTopSelectView2State();
}

class QFTopSelectView2State extends State<QFTopSelectView2> {
  int selectIndex = 0;

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
        "  " + title + "",
        style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            color:
                isSelected ? Color.fromARGB(255, 255, 46, 23) : Colors.white,
                ),
        overflow: TextOverflow.clip,
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
              getText(0, "新闻资讯"),
              new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    getText(1, "数据调研"),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child:
                          Image.asset('lib/assets/images/sub_select_731.png'),
                    )
                  ],
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    getText(2, "市场解读"),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child:
                          Image.asset('lib/assets/images/sub_select_731.png'),
                    )
                  ],
                ),
              ),
              getText(3, "政策法规"),
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
