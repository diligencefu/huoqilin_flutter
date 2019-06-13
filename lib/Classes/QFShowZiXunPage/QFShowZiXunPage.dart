import 'dart:convert';
import 'dart:ui' as prefix0;

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
import 'package:huoqilin_project/Classes/tools/Screen.dart';

import 'package:huoqilin_project/Classes/QFShowZiXunPage/zixun_main_model/zixun_main_model1.dart';

import 'package:huoqilin_project/Classes/tools/NetWork/SKRequest.dart';
import 'package:huoqilin_project/Classes/tools/user_info_cache/user_info.dart';

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
  int selectIndex = 0;
  // 模块id
  String _bloack_id = "9";
  // 产品id
  String _product_id = "0";
  // 是否是关注的类型
  String _is_follow = "0";
  // 是否是新闻类型
  bool _is_news = true;
  var currentPage = 1;
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

    int pageSize = 20;
    Map<String, String> map = new Map();
    map["userNo"] = UserInfo.userNo;
    map["pageIndex"] = "1";
    map["pageSize"] = "$pageSize";
    map["pageIndex"] = "1";
    map["productId"] = _product_id;
    map["blockId"] = _bloack_id;
    map["isFollow"] = _is_follow;
    Request.get(QFZiXunApis.ZIXUNGetInformationList, map, (datas) {
      if (datas!= null) {
        // datas.toString();
        var jsonData = json.decode(datas);
        List moduleData = jsonData["DataList"];
        final pages = jsonData["TotalCount"]/pageSize;
        if (currentPage == 1) {
          modules.clear();
        }
        moduleData.forEach((data) {
          modules.add(ZiXunMainModel1.fromJson(data));
        });
        setState(() {
          // modules;
        });
      }
      print(datas);
    });

    // for (var i = 0; i < 5; i++) {
    //   var model = ZiXunMainModel1();
    //   model.title = "sdasdas";
    //   if (i % 3 == 0) {
    //     model.id = 1;
    //   } else {
    //     model.id = 2;
    //   }

    //   if (i % 2 == 0) {
    //     model.title = "理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
    //     model.url =
    //         "理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
    //   } else {
    //     model.title = "理费价着大豆价格上涨";
    //     model.url = "着大豆价格上涨理费价格随着大豆价格上涨理费价格随着大豆价格上涨";
    //   }

    //   model.imagePath = "ss";

    //   modules.add(model);
    // }

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

  Widget createListCellWithOThreeImages(ZiXunMainModel1 model) {
    var width = Screen.width - 20 * 2 - 12 * 2;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              model.qfTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 39, 48, 62)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560411093143&di=e11597d5a4bec379d2ebd1692e750688&imgtype=0&src=http%3A%2F%2Fwx2.sinaimg.cn%2Flarge%2F61e7f4aaly1g0qsmz73juj20iv0iv4h0.jpg",
                      fit: BoxFit.cover,
                      height: 100,
                      width: width / 3,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560411294325&di=081759e026dae8bfa171656e1989e560&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ffront%2F720%2Fw1920h1200%2F20181010%2F7Zqs-hkrzyan5756737.jpg",
                      fit: BoxFit.cover,
                      height: 100,
                      width: width / 3,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561006011&di=c63ec2158add3810b16822ffa993aa79&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.yulefm.com%2Fd%2Ffile%2Fent%2F2019-06-12%2F1962eecb14e01a8b40c8ed9f5aa86893.png",
                      fit: BoxFit.cover,
                      height: 100,
                      width: width / 3,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
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
                          model.qfTitle,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Image.network(
                      model.qfCoverImgUrl,
                      fit: BoxFit.cover,
                      height: 90,
                      
                    ),
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
              model.qfTitle,
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
              model.qfSummary,
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
                    model.qfTitle,
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
                    model.qfSummary,
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
          return createNewsListCell(model);
        } else {
          if (model.qfIsCoverImg == 1) {
            var type = model.qfCoverImgType;
            if (type == 2) {
              return createListCellWithOneImage(model);
            } else {
              return createListCellWithOThreeImages(model);
            }
          } else {
            return createListCellNoImages(model);
          }
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
                            builder: (context) => new QFZiXunInfo(null)));
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
