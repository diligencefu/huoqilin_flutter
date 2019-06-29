import 'package:flutter/material.dart';

class QFShowMunePage extends StatefulWidget {
  @override
  _QFShowMunePage createState() => _QFShowMunePage();
}

class _QFShowMunePage extends State<QFShowMunePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QFShowMunePage"),
        backgroundColor: Color.fromARGB(255, 38, 110, 217),

      ),
      body: Center(child: Text('QFShowMunePage'),),
    );
  }
}