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

enum HomeListType {
  excellent,
  male,
  female,
  cartoon,
}

class QFShowZiXunPage extends StatefulWidget {
  @override
  _QFShowZiXunPage createState() => _QFShowZiXunPage();
}

class _QFShowZiXunPage extends State<QFShowZiXunPage> {
  // 源数据存放数组
  List<ZiXunMainModel1> modules = [];
  // 顶部自选栏当前选中的下标
  int selectIndex;
  // 模块id
  String _bloack_id = "9";
  // 产品id
  String _product_id = "0";
  // 是否是关注的类型
  String _is_follow = "0";
  // 是否是新闻类型
  bool _is_news = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    // getTypeList();
  }

  void _getCallBack(int value) {
    // print(value);

    setState(() {
      _is_news = false;
      _is_follow = "0";
      switch (value) {
        case 0:
        case 2:
          _is_news = true;
          _bloack_id = "9";
          if (value == 2) {
            _is_follow = "1";
          }
          break;
        case 1:
          _bloack_id = "1";
          break;
        case 3:
          _bloack_id = "0";
          break;
        default:
          break;
      }
      fetchData();
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
    for (var i = 0; i < 5; i++) {
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

    setState(() {
      // modules;
    });
    print("bloack_id:" + _bloack_id);
    print("is_follow:" + _is_follow);
    print("is_news:" + "$_is_news");
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
    // print(selectIndex);
    Widget showView;
    switch (selectIndex) {
      case 0:
      case 2:
        showView = QFTopSelectView2(
          onChanged: (int value) {
            switch (value) {
              case 0:
                _bloack_id = "9";
                break;
              case 1:
                // _bloack_id = "2";
                break;
              case 2:
                // _bloack_id = "9";
                break;
              case 3:
                _bloack_id = "11";
                break;
              default:
                break;
            }
            fetchData();
          },
        );
        break;
      case 1:
        showView = QFTopSelectView3(
          onChanged: (int value) {
            switch (value) {
              case 0:
                _bloack_id = "1";
                break;
              case 1:
                _bloack_id = "2";
                break;
              case 2:
                _bloack_id = "9";
                break;
              case 3:
                _bloack_id = "12";
                break;
              default:
                break;
            }
            fetchData();
          },
        );
        break;
      default:
        showView = QFTopSelectView4(
          onChanged: (int value) {
            switch (value) {
              case 0:
                _bloack_id = "0";
                break;
              case 1:
                _bloack_id = "13";
                break;
              case 2:
                _bloack_id = "14";
                break;
              case 3:
                _bloack_id = "15";
                break;
              case 4:
                _bloack_id = "16";
                break;
              case 5:
                _bloack_id = "17";
                break;
              default:
                break;
            }
            fetchData();
          },
        );
    }
    return Column(
      children: <Widget>[
        topSelect,
        showView,
      ],
    );
  }

  Widget createListCellWithOneImage(ZiXunMainModel1 model) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        height: 115,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        height: 82,
                        child: Text(
                          model.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 39, 48, 62)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "2019-06-05",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 52, 120, 245)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                "农业农村部",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 178, 185, 210)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 90,
                  width: 115,
                  child: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560408914897&di=758d66268b36edeeea7d9ce4e6f5dacb&imgtype=0&src=http%3A%2F%2Fnews.sfacg.com%2FImages%2FInner%2F2016%2F4%2F21%2Fbeb069a3-9a75-49d8-8385-c16caed662fd.jpg",
                    fit: BoxFit.cover,
                    height: 90,
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 230, 238, 245),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget createListCellNoImages(ZiXunMainModel1 model) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
            child: Text(
              model.url,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 130, 142, 166)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Row(
              children: <Widget>[
                Text(
                  "2019-06-05",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 52, 120, 245)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "农业农村部",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 178, 185, 210)),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Color.fromARGB(255, 230, 238, 245),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

// Color.fromARGB(255, 197, 215, 242)
  Widget createNewsListCell(ZiXunMainModel1 model) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      padding: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color.fromARGB(255, 197, 215, 242),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 12, 16, 0),
                  child: Text(
                    "14:38",
                    style: TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 52, 102, 215)),
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
                  padding: const EdgeInsets.fromLTRB(0, 12, 16, 12),
                  child: Text(
                    model.url,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 130, 142, 166)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createNewListCellHead() {
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
                  fontWeight: FontWeight.w600,
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
        if (_is_news) {
          if (model.id == 2) {
            return createNewsListCell(model);
          } else {
            // return createListCell2();
            return Column(
              children: <Widget>[
                createNewListCellHead(),
                createNewsListCell(model),
              ],
            );
          }
        } else {
          if (selectIndex == 1) {
            return createListCellNoImages(model);
          } else {
            return createListCellWithOneImage(model);
          }

          // if (selectIndex == 1) {
          //   return createListCellNoImages(model);
          // }else if (selectIndex == 1) {

          // }else{

          // }
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
