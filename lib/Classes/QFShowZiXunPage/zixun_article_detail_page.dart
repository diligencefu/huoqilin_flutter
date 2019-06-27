import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/tools/FavoriteWidget.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/zixun_main_model/zixun_main_model1.dart';

// import 'webview_scaffold.dart';
class QFZiXunArticleDetailPage extends StatefulWidget {
  ZiXunMainModel1 model;
  QFZiXunArticleDetailPage(this.model);
  @override
  QFZiXunArticleDetailPageState createState() =>
      QFZiXunArticleDetailPageState();
}

class QFZiXunArticleDetailPageState extends State<QFZiXunArticleDetailPage> {
  bool isFavorited = false;
  // int favoriteCount = 40;
  void initState() {
    super.initState();
  }

  Widget createBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          //标题
          Container(
            child: Text(
              this.widget.model.qfTitle,
              maxLines: 3,
              style: TextStyle(
                color: Color.fromARGB(255, 36, 46, 69),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //作者及浏览量
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 42,
                  child: Text(
                    this.widget.model.qfAuthor,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color.fromARGB(255, 169, 175, 182),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 16),
                  height: 42,
                  child: Text(
                    "浏览量: " + "22",
                    maxLines: 1,
                    style: TextStyle(
                      color: Color.fromARGB(255, 169, 175, 182),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                // Container(
                //   child: SingleChildScrollView(
                //     child: Html(
                //       data: "this.widget.url",
                //       //Optional parameters:
                //       padding: EdgeInsets.all(8.0),
                //       linkStyle: const TextStyle(
                //         color: Colors.redAccent,
                //         decorationColor: Colors.redAccent,
                //         decoration: TextDecoration.underline,
                //       ),
                //       onLinkTap: (url) {
                //         print("Opening $url...");
                //       },
                //       onImageTap: (src) {
                //         print(src);
                //       },
                //       //Must have useRichText set to false for this to work
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return   Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: AppBar(
            title: Text(
              "资讯详情",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            // actions: <Widget>[
            // IconButton(
            //   icon: Image.asset(
            //       'lib/assets/images/search_icon_infomation.png'),
            //   onPressed: () {
            //     // Navigator.push(
            //     //     context,
            //     //       MaterialPageRoute(
            //     //         builder: (context) =>   WebviewScaffold(url: "www.baidu.com",)));
            //   },
            //   )
            // ],
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
        preferredSize:
            Size(MediaQuery.of(context).size.width, 44),
      ),
      body: createBody(),
    );
  }
}
