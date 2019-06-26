import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/choose_product_news/zi_xun_show_product_model.dart';
class QFTopSelectView extends StatefulWidget {
  final int _selectIndex;
  final SpotTypes _selectModel;

  final ValueChanged<int> onChanged;
  QFTopSelectView({Key key, int selectIndex,SpotTypes selectModel, @required this.onChanged})
      : this._selectIndex = selectIndex,
      this._selectModel = selectModel,
        super(key: key) {}

  @override
  QFTopSelectViewState createState() => QFTopSelectViewState();
}

class QFTopSelectViewState extends State<QFTopSelectView> {
  int currentIndex = 0;
  void initState() {
    super.initState();
    //  currentIndex = selectIndex;
  }

  GestureDetector getText(int index, String title) {
    bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          widget.onChanged(index);
        });
      },
      child: new Container(
          alignment: Alignment.bottomCenter,
          height: 31,
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isSelected ? FontWeight.w500 : FontWeight.normal,
                    color: !isSelected
                        ? Color.fromARGB(255, 124, 212, 249)
                        : Colors.white),
              ),
              Container(
                padding: const EdgeInsets.only(top: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 26,
                    height: 3,
                    color: isSelected ? Colors.white : Colors.transparent,
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget setTopSelectView() {
    return Stack(
      children: <Widget>[
        Container(
          height: 45,
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.bottomCenter,
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
          alignment: Alignment.bottomCenter,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    getText(0, this.widget._selectModel.typeName),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
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
