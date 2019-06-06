import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QFTopSelectView extends StatefulWidget {
  final int selectIndex ;

  QFTopSelectView({
    this.selectIndex,
  });

  @override
  QFTopSelectViewState createState() => QFTopSelectViewState(
        selectIndex: this.selectIndex,
      );
}

class QFTopSelectViewState extends State<QFTopSelectView> {
  // final ValueChanged<bool> onChanged;
  // QFTopSelectViewState({Key key, @required this.onChanged});

  final int selectIndex ;
  int currentIndex;

  QFTopSelectViewState({
    this.selectIndex,
  });
  
  void initState() {
    super.initState();
     currentIndex = selectIndex;
  }

  GestureDetector getText(int index, String title) {
    bool isSelected = index == currentIndex;
    // if (index == 0) {
    //   isSelected = false;
    // }
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          // onChanged(false);
        });
      },
      child: new Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            color: !isSelected
                ? Color.fromARGB(255, 124, 212, 249)
                : Colors.white),
      ),
    );
  }

  Widget setTopSelectView() {
    return Stack(
      children: <Widget>[
        Container(
          height: 45,
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromARGB(255, 16, 101, 230),
                Color.fromARGB(255, 55, 128, 238)
              ],
            ),
          ),
        ),
        Container(
          height: 45,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    getText(0, "自选"),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                          'lib/assets/images/other_zong_unselect.png'),
                    )
                  ],
                ),
              ),
              getText(1, "推荐"),
              getText(2, "关注"),
              getText(3, "热榜"),
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
