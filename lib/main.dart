import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huoqilin_project/classes/login/login_page.dart';
import 'package:huoqilin_project/classes/root/zixun_part.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var login = LoginPage();
    var zixunHome = MyHomePage();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: login,
    );
  }
}

