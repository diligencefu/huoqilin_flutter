import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huoqilin_project/configs/global.dart';

class QFShowMinePage extends StatefulWidget {
  @override
  _QFShowMinePage createState() => _QFShowMinePage();
}

class _QFShowMinePage extends State<QFShowMinePage> {

  @override
  Widget build(BuildContext context) {

    ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 110, 217),
      appBar: AppBar(
        title: Text("QFShowMinePage"),
        backgroundColor: Color.fromARGB(255, 38, 110, 217),
        actions: <Widget>[
          IconButton(
            // icon: Image.asset("lib/assets/images/community_show_head_image1"),
            // icon: Icons.access_alarm,
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              // print("跳");
              _showAlert();
            },
          )

        ],
      ),      
      // body: Center(child: Text('QFShowMinePage'),),
    );
  }

    Future<void> _showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          // title: Text('提示'),
          content: Text('确定退出登录？'),
          actions: <Widget>[
            new CupertinoButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('取消',style: TextStyle(color: MyColor.textBlackColor),)),
            new CupertinoButton(onPressed: () {
              GlobalConfig.logout(context: context);
            }, child: Text('确认')),
          ],
        );
      }
    );
  }

}