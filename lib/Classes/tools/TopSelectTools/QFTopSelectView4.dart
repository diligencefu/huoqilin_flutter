import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QFTopSelectView4 extends StatefulWidget {
  final int _selectIndex;

  final ValueChanged<int> onChanged;
  QFTopSelectView4({Key key, int selectIndex, @required this.onChanged})
      : this._selectIndex = selectIndex,
        super(key: key) ;

  @override
  QFTopSelectView4State createState() => QFTopSelectView4State();
}

class QFTopSelectView4State extends State<QFTopSelectView4> {
 int selectIndex = 0;

  GestureDetector getText(int index, String title) {
    bool isSelected = index == selectIndex;

    return GestureDetector(
      onTap: () {
          setState(() {
            selectIndex = index;
            widget.onChanged(index);
          });

      },
      child:   Text(
        "  "+title+"  ",
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
              getText(0, "全部"),
              getText(1, "经济"),
              getText(2, "政治"),
              getText(3, "社会"),
              getText(4, "军事"),
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
