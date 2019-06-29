import 'package:flutter/material.dart';

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
              print("跳");
            },
          )

        ],
      ),      
      // body: Center(child: Text('QFShowMinePage'),),
    );
  }

}