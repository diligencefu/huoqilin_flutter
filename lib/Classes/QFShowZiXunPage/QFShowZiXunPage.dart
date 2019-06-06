import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/QFZiXunInfo.dart';
import 'package:huoqilin_project/Classes/tools/QFTopSelectView.dart';
import 'package:huoqilin_project/Classes/tools/QFTopSelectView2.dart';
import 'package:huoqilin_project/Classes/tools/QFTopSelectView3.dart';
import 'package:huoqilin_project/Classes/tools/QFTopSelectView4.dart';

class QFShowZiXunPage extends StatefulWidget {
  @override
  _QFShowZiXunPage createState() => _QFShowZiXunPage();
}

class _QFShowZiXunPage extends State<QFShowZiXunPage> {
  Widget getHomeView() {
    return Container(
        child: Column(
      children: <Widget>[
        TabBar(
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
          tabs: [
            Tab(
              text: '自选',
            ),
            Tab(text: '推荐'),
            Tab(text: '关注'),
            Tab(text: '热榜'),
          ],
        ),
        TabBarView(children: [
          QFZiXunInfo(),
          // QFZiXunInfo(),
          // QFZiXunInfo(),
          // QFZiXunInfo(),
        ]),
      ],
    ));
  }

  Widget getStack() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 20,
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.lightBlue,
                  Colors.red
                ],
              ),
            ),
            child: Text(
              "ForegroundForegroundForegroundForegroundForegroundForeground Text",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDrawp() {
    Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: Text('AH')),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: Text('ML')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: Text('HM')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: Text('JL')),
          label: Text('Laurens'),
        ),
      ],
    );
  }

  Widget getTopSelect() {
    return Row(
      children: <Widget>[
        Chip(
          label: Text(
            "chip组件",
            style: TextStyle(
                fontSize: 15.0,
                color: Color(0xff333333),
                fontStyle: FontStyle.italic),
          ),
          labelPadding: EdgeInsets.only(left: 3.0),
          avatar: Icon(
            Icons.home,
            color: Color(0xff00ff00),
          ),
          onDeleted: () {},
          // deleteIcon: Icon(Icons.delete),
          deleteIconColor: Color(0xffff0000),
          deleteButtonTooltipMessage: "手下留情",
          backgroundColor: Color(0xfff1f1f1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ],
    );
  }

  Widget getSubViews() {
    return Column(
      children: <Widget>[
        Expanded(
          child: getTopSelect(),
        ),
        Expanded(
          child: new ListView(
            padding: EdgeInsets.all(0),
            children: [
              // topSelect(),
              new Image.asset(
                'lib/assets/images/sky.jpg',
                height: 240.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget setBody() {
    QFTopSelectView topSelect = QFTopSelectView();
    Widget showView;
    print(topSelect.selectIndex);

    switch (topSelect.selectIndex) {
      case 0:
      case 2:
        showView = QFTopSelectView2();
        break;
      case 1:
        showView = QFTopSelectView3();
        break;
      default:
        showView = QFTopSelectView4();
    }
    return Column(
      children: <Widget>[
        QFTopSelectView(),
        showView,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            child: AppBar(
              title: Text(
                "资讯",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Image.asset(
                      'lib/assets/images/search_icon_infomation.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new QFZiXunInfo()));
                  },
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 16, 101, 230),
                  Color.fromARGB(255, 55, 128, 238)
                ],
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 45),
        ),
        // appBar: AppBar(
        //   brightness: Brightness.light,
        //   title: Text("资讯"),
        //   backgroundColor: Color.fromARGB(255, 38, 110, 217),
        //   elevation: 0,
        //   actions: <Widget>[
        //     IconButton(
        //       // icon: Image.asset("lib/assets/images/community_show_head_image1"),
        //       // icon: Icons.access_alarm,
        //       icon: Icon(Icons.ac_unit),
        //       onPressed: () {
        //         print("跳");
        //         Navigator.push(
        //             context,
        //             new MaterialPageRoute(
        //                 builder: (context) => new QFZiXunInfo()));
        //       },
        //     )
        //   ],
        // ),
        body: setBody(),
      ),
    );
  }
}
