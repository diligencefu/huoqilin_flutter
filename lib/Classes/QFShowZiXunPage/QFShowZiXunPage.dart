import 'dart:convert';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:huoqilin_project/Classes/tools/screen.dart' as prefix2;
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
// 展示新闻列表是顶部的日期
  var _last_new_date = "";
// 需要显示的垂直采单类型
  int _muneType = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
    // getTypeList();
  }

  void _getCallBack(int value) {
    // print(value);
    _is_news = false;
    _is_follow = "0";
    _last_new_date = "";
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
    refrenshData();

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

  Future<void> refrenshData() async {
    currentPage = 1;
    fetchData();
  }

  Future<void> fetchData() async {
    if (currentPage == 1) {
      _last_new_date = "";
    }
    int pageSize = 10;
    Map<String, String> map = new Map();
    map["userNo"] = UserInfo.userNo;
    map["pageIndex"] = "$currentPage";
    map["pageSize"] = "$pageSize";
    map["pageIndex"] = "1";
    map["productId"] = _product_id;
    map["blockId"] = _bloack_id;
    map["isFollow"] = _is_follow;
    Request.get(QFZiXunApis.ZIXUNGetInformationList, map, (datas) {
      if (datas != null) {
        // datas.toString();
        var jsonData = json.decode(datas);
        List moduleData = jsonData["DataList"];
        final pages = jsonData["TotalCount"] / pageSize;
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

    // print("bloack_id:" + _bloack_id);
    // print("is_follow:" + _is_follow);
    // print("is_news:" + "$_is_news");
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
            _muneType = 1;
            switch (value) {
              case 0:
                _is_news = true;
                _bloack_id = "9";
                refrenshData();
                break;
              case 1:
                setState(() {
                  _last_new_date = "";
                  _muneType = 2;
                });
                break;
              case 2:
                setState(() {
                  _last_new_date = "";
                  _muneType = 3;
                });
                break;
              case 3:
                _bloack_id = "11";
                _is_news = false;
                refrenshData();
                break;
              default:
                break;
            }
          },
        );
        break;
      case 1:
        showView = QFTopSelectView3(
          onChanged: (int value) {
            _is_news = false;
            _muneType = 1;
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
            refrenshData();
          },
        );
        break;
      default:
        showView = QFTopSelectView4(
          onChanged: (int value) {
            _is_news = false;
            _muneType = 1;
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
            refrenshData();
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
                      model.qfCoverImgUrl,
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
                      model.qfCoverImgUrl2,
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
                      model.qfCoverImgUrl3,
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
                  model.qfCreateTime1,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 52, 120, 245)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    model.qfAuthor,
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
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              model.qfCreateTime1,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 52, 120, 245)),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                              width: Screen.width - 115 - 20 * 2 - 110,
                              child: Text(
                                model.qfAuthor,
                                overflow: TextOverflow.ellipsis,
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
                  model.qfCreateTime1,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 52, 120, 245)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    model.qfAuthor,
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
                    model.qfCreateTime2,
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

  Widget createNewListCellHead(ZiXunMainModel1 model) {
    return Container(
      padding: const EdgeInsets.only(left: 11),
      child: Row(
        children: <Widget>[
          Image.asset('lib/assets/images/show_zixun_news_date_mark.png'),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Text(model.qfCreateTime1,
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
          if (_last_new_date == "" || _last_new_date != model.qfCreateTime1 || index == 0) {
            _last_new_date = model.qfCreateTime1;
            return Column(
              children: <Widget>[
                createNewListCellHead(model),
                createNewsListCell(model)
              ],
            );
          } else {
            return createNewsListCell(model);
          }
        } else {
          if (model.qfIsCoverImg == 1) {
            var type = model.qfCoverImgType;
            if (model.qfCoverImgUrl3.toString() == "null" ||
                model.qfCoverImgUrl3.toString() == "") {
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

  Widget createVerticalSub(String title) {
    var width = Screen.width / 4;

    return Container(
      height: 45,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 1,
            width: width - 10,
          ),
          Container(
              height: 44,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }

  tapHangView(int index) {
    _is_news = false;
    switch (index) {
      case 4:
        print("宏观数据——国内");
        break;
      case 5:
        print("产业数据+产品id");
        break;
      case 0:
        _bloack_id = "5";
        refrenshData();
        break;
      case 1:
        _bloack_id = "6";
        refrenshData();
        break;
      case 2:
        _bloack_id = "7";
        refrenshData();
        break;
      case 3:
        _bloack_id = "8";
        refrenshData();
        break;
      default:
    }
    setState(() {
      _muneType = 1;
    });
  }

  List<Widget> createVerticalmuneList() {
    if (_muneType == 2) {
      return <Widget>[
        GestureDetector(
          onTap: () {
            tapHangView(4);
          },
          child: createVerticalSub("宏观数据"),
        ),
        GestureDetector(
          onTap: () {
            tapHangView(5);
          },
          child: createVerticalSub("产业数据"),
        ),
      ];
    } else {
      return <Widget>[
        GestureDetector(
          onTap: () {
            tapHangView(0);
          },
          child: createVerticalSub("行情分析"),
        ),
        GestureDetector(
          onTap: () {
            tapHangView(1);
          },
          child: createVerticalSub("商品研报"),
        ),
        GestureDetector(
          onTap: () {
            tapHangView(2);
          },
          child: createVerticalSub("套利策略"),
        ),
        GestureDetector(
          onTap: () {
            tapHangView(3);
          },
          child: createVerticalSub("风险预警"),
        ),
      ];
    }
  }

  Widget createVerticalmune1() {
    var width = Screen.width / 4;
    var height = _muneType == 2 ? 45.0 * 2 : 45.0 * 4;
    return Container(
      color: Color.fromARGB(180, 0, 0, 0),
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: createVerticalmuneList(),
      ),
    );
  }

  Widget showView() {
    double width = Screen.width / 2;
    if (_muneType == 1) {
      return RefreshIndicator(onRefresh: refrenshData, child: createListView());
    } else {
      if (_muneType == 2) {
        width = Screen.width / 4;
      }
      return Stack(
        children: <Widget>[
          RefreshIndicator(onRefresh: refrenshData, child: createListView()),
          Container(
            padding: EdgeInsets.fromLTRB(width, 0.0, 0, 0),
            child: createVerticalmune1(),
          )
        ],
      );
    }
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
        body: showView(),
      ),
    );
  }
}
