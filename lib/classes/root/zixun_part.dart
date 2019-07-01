import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huoqilin_project/classes/mine/main_mine.dart';
import 'package:huoqilin_project/classes/mune/QFShowMunePage.dart';

import 'package:huoqilin_project/classes/zixun/zi_xun_main_page.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;
    List<Image> _normalImages = [
      Image.asset("lib/assets/images/main_tabbar_unselect_icon_1.png"),
      Image.asset("lib/assets/images/main_tabbar_unselect_icon_2.png"),
      Image.asset("lib/assets/images/main_tabbar_unselect_icon_3.png"),
      Image.asset("lib/assets/images/main_tabbar_unselect_icon_4.png"),
    ];   
    
     List<Image> _selectImages = [
      Image.asset("lib/assets/images/main_tabbar_select_icon_1.png"),
      Image.asset("lib/assets/images/main_tabbar_select_icon_2.png"),
      Image.asset("lib/assets/images/main_tabbar_select_icon_3.png"),
      Image.asset("lib/assets/images/main_tabbar_select_icon_4.png"),
    ];
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          QFShowZiXunPage(),
          QFShowMunePage(),
          QFShowMunePage(),
          QFShowMinePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Color.fromARGB(255, 38, 110, 217),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('首页')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('状态')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('功能')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('我的')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );

  }

  Image getTabIcon(int index) {
    if (_tabIndex != index) {
      return _normalImages[index];
    }else{
      return _selectImages[index];
    }
  }
}
