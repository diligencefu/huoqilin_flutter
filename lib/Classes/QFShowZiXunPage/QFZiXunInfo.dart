import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/tools/FavoriteWidget.dart';

class QFZiXunInfo extends StatefulWidget {
  @override
  _QFZiXunInfo createState() => _QFZiXunInfo();
}

class _QFZiXunInfo extends State<QFZiXunInfo> {
  bool isFavorited = false;
  int favoriteCount = 40;
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;

  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new IconButton(
          icon: Icon(icon, color: color),
          onPressed: () {
            print("text");
          },
        ),

        // new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 2.0),
          child: new Text(label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color)),
        )
      ],
    );
  }

  Column buildTopButtonColumn(String label) {
    Color color = Color.fromARGB(120, 38, 110, 217);
    return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color)),
        ]);
  }

  Widget titleScetion() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "Itsmaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitle",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                new Text(
                  "Imaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitlemaintitle",
                  style: new TextStyle(color: Colors.grey),
                  maxLines: 2,
                )
              ],
            ),
          ),

          new FavoriteWidget(false, 41),

          // new IconButton(
          //   icon: (isFavorited
          //       ? new Icon(Icons.star)
          //       : new Icon(Icons.star_border)),
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
          new Container(
            padding: const EdgeInsets.only(left: 0.0),
            child: new Text("$favoriteCount",
                style: new TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget buttonSection() {
    return new Container(
      child: new Row(
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
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }

  Widget topSelect() {
    return new Container(
      padding: const EdgeInsets.all(0),
      height: 45,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildTopButtonColumn("自选"),
                buildTopButtonColumn("推荐"),
                buildTopButtonColumn("关注"),
                buildTopButtonColumn("热榜"),
              ],
            ),
          ),
          // new Text(
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
              onTap: back, child: Image.asset('lib/assets/images/pub_back_white.png')),
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
                      onTap: back, child: Image.asset('lib/assets/images/pub_back_gray.png')),
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
              child: new ListView(
                padding: EdgeInsets.all(0),
                controller: scrollController,
                children: [
                  // topSelect(),
                  new Image.asset(
                    'lib/assets/images/sky.jpg',
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
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
    return new Scaffold(
        // title: "Flutter Demo",
        // theme: new ThemeData(primarySwatch: Colors.blue),
        // appBar: AppBar(
        //   title: Text("资讯"),
        //   bottom: topSelect(),
        //   backgroundColor: Color.fromARGB(0, 38, 110, 217),
        // ),
        body: getSubViews());
  }
}
