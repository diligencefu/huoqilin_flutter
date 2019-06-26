import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/tools/FavoriteWidget.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/zixun_main_model/zixun_main_model1.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

// import 'webview_scaffold.dart';
class QFWebView extends StatefulWidget {
  String url;
  String showTile;
  QFWebView(this.url, this.showTile);
  @override
  QFWebViewState createState() => QFWebViewState();
}

class QFWebViewState extends State<QFWebView> {
  WebController webController;

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl(this.widget.url);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print("Finished loading $url"));
  }

  void initState() {
    super.initState();
    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
    );
  }

  Widget getss() {
    return FlutterNativeWeb(onWebCreated: onWebCreated);
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: AppBar(
            title: Text(
              this.widget.showTile,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              // RaisedButton(
              //   onPressed: () {},
              //   child: const Text('Cookies'),
              // ),
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
        preferredSize: Size(MediaQuery.of(context).size.width, 44),
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 0),
        child: FlutterNativeWeb(onWebCreated: onWebCreated),
      ),
    );
  }
}
