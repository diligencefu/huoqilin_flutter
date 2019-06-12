import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/QFZiXunInfo.dart';
import 'package:huoqilin_project/Classes/tools/NetWork/common.dart';
import 'package:huoqilin_project/Classes/tools/TopSelectTools/QFTopSelectView.dart';
import 'package:huoqilin_project/Classes/tools/TopSelectTools/QFTopSelectView2.dart';
import 'package:huoqilin_project/Classes/tools/TopSelectTools/QFTopSelectView3.dart';
import 'package:huoqilin_project/Classes/tools/TopSelectTools/QFTopSelectView4.dart';
import 'package:huoqilin_project/Classes/tools/NetWork/SKRequest.dart';
import 'package:huoqilin_project/Classes/tools/NetWork/QFZiXunApis.dart';

import 'package:huoqilin_project/Classes/QFShowZiXunPage/zixun_main_model/zixun_main_model1.dart';

// import 'package:flustars/flustars.dart';
// import 'package:common_utils/common_utils.dart';

// import 'package:base_library/base_library.dart';

class QFShowZiXunPage extends StatefulWidget {
  @override
  _QFShowZiXunPage createState() => _QFShowZiXunPage();
}

class _QFShowZiXunPage extends State<QFShowZiXunPage> {
  List<ZiXunMainModel1> modules = [];

  int selectIndex;

  @override
  void initState() {
    super.initState();
    fetchData();
    // getTypeList();
  }

  void _getCallBack(int value) {
    print(value);

    setState(() {
      selectIndex = value;
    });
  }

  // Future<List<ZiXunMainModel1>> getTypeList() async {
  //   BaseResp<List> baseResp = await DioUtil().request<List>(
  //       Method.get, QFZiXunApis.getPath(path: QFZiXunApis.ZIXUNGetTypeList));
  //   List<ZiXunMainModel1> bannerList;
  //   if (baseResp.code != Constant.status_success) {
  //     return new Future.error(baseResp.msg);
  //   }
  //   if (baseResp.data != null) {
  //     bannerList = baseResp.data.map((value) {
  //       return ZiXunMainModel1.fromJson(value);
  //     }).toList();
  //   }
  //   return bannerList;
  // }

  Future<void> fetchData() async {
    for (var i = 0; i < 200; i++) {
      var model = ZiXunMainModel1();
      model.title = "sdasdas";
      if (i % 3 == 0) {
        model.id = 1;
      } else {
        model.id = 2;
      }

      if (i % 2 == 0) {
        model.title = "理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
        model.url =
            "理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
      } else {
        model.title = "理费价着大豆价格上涨";
        model.url = "着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
      }

      model.imagePath = "ss";

      modules.add(model);
    }
    // try {
    //   var responseJson = await Request.get(action: "/News/GetTypeList");
    //   List moduleData = responseJson['DataList'];
    //   List<String> modules = [];
    //   moduleData.forEach((data) {
    //     modules.add("sasdadas");
    //   });

    //   setState(() {
    //     this.modules = modules;
    //   });
    // } catch (e) {
    //   // Toast.show(e.toString());
    // }
  }

  Widget setBody() {
    QFTopSelectView topSelect = QFTopSelectView(
      onChanged: _getCallBack,
      selectIndex: 0,
    );
    print(selectIndex);
    Widget showView;
    switch (selectIndex) {
      case 0:
      case 2:
        showView = QFTopSelectView2();
        break;
      case 1:
        showView = QFTopSelectView3();
        break;
      default:
        showView = QFTopSelectView4();
    }
    return Column(
      children: <Widget>[
        topSelect,
        showView,
      ],
    );
  }

// Color.fromARGB(255, 197, 215, 242)
  Widget createListCell1(ZiXunMainModel1 model) {
    return Container(
      // height: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 30,
            color: Colors.red,

            height: double.infinity,
            // child: Container(
            //   // height: double.infinity,
            //   width: 1,
            //   color: Colors.red,
            //   // height: 33,
            // )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 12, 16, 0),
                  child: Text(
                    "14:38",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 52, 125, 235)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
                  child: Text(
                    model.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 39, 48, 62)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 8, 16, 12),
                  child: Text(
                    model.url,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 115, 130, 144)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createListCell2() {
    return Container(
      padding: const EdgeInsets.only(left: 11),
      child: Row(
        children: <Widget>[
          Image.asset('lib/assets/images/show_zixun_news_date_mark.png'),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text("2018-05-06",
                style: TextStyle(
                  color: Color.fromARGB(255, 16, 101, 230),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: modules.length,
      itemBuilder: (context, index) {
        var model = modules[index];
        // return Container(
        //   child: Column(
        //     children: <Widget>[

        //     ],
        //   ),
        // );
        if (model.id == 2) {
          return createListCell1(model);
        } else {
          return createListCell2();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            child: AppBar(
              title: Text(
                "资讯",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Image.asset(
                      'lib/assets/images/search_icon_infomation.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new QFZiXunInfo()));
                  },
                )
              ],
              bottom: PreferredSize(
                child: setBody(),
                preferredSize: null,
              ),
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
          preferredSize: Size(MediaQuery.of(context).size.width, 120),
        ),
        body: RefreshIndicator(onRefresh: fetchData, child: createListView()),
      ),
    );
  }
}
