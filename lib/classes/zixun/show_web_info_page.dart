import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/configs/my_toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QFWebView extends StatelessWidget {
  final String url;
  final String showTile;
  final Key key;

  QFWebView(this.url, this.showTile, this.key);

  back(context) {
    Navigator.of(context).pop();
  }

  Widget buildNavigationBar(context) {
   double _statusBarHeight = MediaQuery.of(context).padding.top;
   double other = _statusBarHeight>25?24:0;
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
          padding: EdgeInsets.fromLTRB(5, _statusBarHeight>25?35:20, 0, 0),
          height: 44 + _statusBarHeight,
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                child: GestureDetector(
                    onTap: () => back(context),
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

  Widget getSubViews(context) {
    return Stack(
      children: <Widget>[
        WebView(
          debuggingEnabled: true,
          key: key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
          onPageFinished: (url) {
            MyToast.setToast(url);
          },
        ),
        buildNavigationBar(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getSubViews(context));
  }
}
