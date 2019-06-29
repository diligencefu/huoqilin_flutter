import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/classes/zixun/zixun_models/zixun_main_model1.dart';
import 'package:huoqilin_project/tools/FavoriteWidget.dart';

class QFZiXunInfo extends StatefulWidget {
  ZiXunMainModel1 model;
  QFZiXunInfo(this.model);
  @override
  _QFZiXunInfo createState() => _QFZiXunInfo();
}

class _QFZiXunInfo extends State<QFZiXunInfo> {
  bool isFavorited = false;
  // int favoriteCount = 40;
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;
  Column buildButtonColumn(IconData icon, String label) {

    Color color = Theme.of(context).primaryColor;
    return   Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {
            print("text");
          },
        ),

        //   Icon(icon, color: color),
          Container(
          margin: const EdgeInsets.only(top: 2.0),
          child:   Text(label,
              style:   TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color)),
        )
      ],
    );
  }

  Column buildTopButtonColumn(String label) {
    Color color = Color.fromARGB(120, 38, 110, 217);
    return   Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text(label,
              style:   TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color)),
        ]);
  }

  Widget titleScetion() {
    return   Container(
      padding: const EdgeInsets.all(32.0),
      child:   Row(
        children: <Widget>[
            Expanded(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child:   Text(
                    "Itsmaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitle",
                    style:   TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                  Text(
                  "Imaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitle",
                  style:   TextStyle(color: Colors.grey),
                  maxLines: 2,
                )
              ],
            ),
          ),

            FavoriteWidget(false, 41),

          //   IconButton(
          //   icon: (isFavorited
          //       ?   Icon(Icons.star)
          //       :   Icon(Icons.star_border)),
          //   onPressed: () {
          //     setState(() {
          //       if (isFavorited) {
          //         isFavorited = false;
          //         favoriteCount -= 1;
          //       } else {
          //         isFavorited = true;
          //         favoriteCount += 1;
          //       }

          //       // isFavorited = !isFavorited;
          //       // favoriteCount =
          //       //     isFavorited ? favoriteCount + 1 : favoriteCount - 1;
          //       print(isFavorited);
          //       print(favoriteCount);
          //     });
          //   },
          // ),
          //   Container(
          //   padding: const EdgeInsets.only(left: 0.0),
          //   child:   Text("$favoriteCount",
          //       style:   TextStyle(color: Colors.grey)),
          // ),
        ],
      ),
    );
  }

  Widget buttonSection() {
    return   Container(
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
          buildButtonColumn(Icons.share, "SHARE"),
          buildButtonColumn(Icons.share, "SHARE"),
          buildButtonColumn(Icons.share, "SHARE"),
          buildButtonColumn(Icons.access_alarm, "ALARM")
        ],
      ),
    );
  }

  Widget textSection() {
    return   Container(
      padding: const EdgeInsets.all(32.0),
      child:   Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }

  Widget topSelect() {
    return   Container(
      padding: const EdgeInsets.all(0),
      height: 45,
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Expanded(
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildTopButtonColumn("自选"),
                buildTopButtonColumn("推荐"),
                buildTopButtonColumn("关注"),
                buildTopButtonColumn("热榜"),
              ],
            ),
          ),
          //   Text(
          //   "   ",
          //   textAlign: TextAlign.left,
          //   style:TextStyle(backgroundColor:Color.fromARGB(255, 38, 110, 217),fontSize: 22,fontWeight: FontWeight.bold)
          // )
        ],
      ),
    );
  }

  back() {
    Navigator.pop(context);
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 44,
          height: 64,
          padding: EdgeInsets.fromLTRB(5, 12, 0, 0),
          child: GestureDetector(
              onTap: back,
              child: Image.asset('lib/assets/images/pub_back_white.png')),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.fromLTRB(5, 12, 0, 0),
            height: 64,
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  child: GestureDetector(
                      onTap: back,
                      child:
                          Image.asset('lib/assets/images/pub_back_gray.png')),
                ),
                Expanded(
                  child: Text(
                    "资讯",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(width: 44),
              ],
            ),
          ),
        )
      ],
    );
  }

  void initState() {
    super.initState();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  Widget getSubViews() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child:   ListView(
                padding: EdgeInsets.all(0),
                controller: scrollController,
                scrollDirection: Axis.vertical,
                children: [
                  // topSelect(),
                    Image.asset(
                    'lib/assets/images/sky.jpg',
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  //   Image.network(
                  //   "http://img5.imgtn.bdimg.com/it/u=2458696988,2288615185&fm=26&gp=0.jpg",
                  //   height: 200,
                  //   fit: BoxFit.cover,
                  // ),
                  titleScetion(),
                  buttonSection(),
                  textSection()
                ],
              ),
            ),
          ],
        ),
        buildNavigationBar(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        // title: "Flutter Demo",
        // theme:   ThemeData(primarySwatch: Colors.blue),
        // appBar: AppBar(
        //   title: Text("资讯"),
        //   bottom: topSelect(),
        //   backgroundColor: Color.fromARGB(0, 38, 110, 217),
        // ),
        body: getSubViews());
  }
}
