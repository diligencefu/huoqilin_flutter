import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/tools/global_variable/QF_global_variables.dart';

import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:path/path.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Developed by  flutter team : widget  WebView

// import 'package:flutter_native_web/flutterwebview.dart';

// Developed by  flutter team : widget  WebView
// import 'webview_scaffold.dart';
class QFWebView extends StatelessWidget {
  var url = "";
  String showTile;
  final key = UniqueKey();

  QFWebView(this.url, this.showTile);
  WebController webController;


  back() {
    // Navigator.pop();
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
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
          padding: EdgeInsets.fromLTRB(5, 35, 0, 0),
          height: 88,
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                child: GestureDetector(
                    onTap: back,
                    child:
                        Image.asset('lib/assets/images/nav_return_white.png')),
              ),
              Expanded(
                child: Text(
                  showTile,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(width: 44),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSubViews() {
    return Stack(
      children: <Widget>[
        // FlutterNativeWeb(
        //   onWebCreated: onWebCreated,
        // ),
        WebView(
            debuggingEnabled: true,
            key: UniqueKey(),
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "https://www.baidu.com",
            onPageFinished: (url){
              GlobalVariable.setToast(url);
            },),
        buildNavigationBar(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: getSubViews()
    );
  }
}
