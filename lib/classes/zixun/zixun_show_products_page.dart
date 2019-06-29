import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:huoqilin_project/classes/zixun/zixun_models/zi_xun_show_product_model.dart';
import 'package:huoqilin_project/net_works/net_util.dart';
import 'package:huoqilin_project/net_works/zixun_api.dart';
import 'package:huoqilin_project/tools/screen.dart';
import 'package:huoqilin_project/tools/user_info_cache/user_info.dart';

class QFShowProductNewsPage extends StatefulWidget {
  final SpotTypes _selectModel;

  final ValueChanged<SpotTypes> onChanged;
  QFShowProductNewsPage(
      {Key key, SpotTypes selectModel, @required this.onChanged})
      : this._selectModel = selectModel,
        super(key: key) {}

  @override
  QFShowProductNewsPageState createState() => QFShowProductNewsPageState();
}

class QFShowProductNewsPageState extends State<QFShowProductNewsPage> {
  String _typeId = "0";

  // 源数据存放数组
  ZiXunShowProductModel mainModel;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> changerFollowState(SpotTypesList model) async {
    Map<String, String> map =   Map();
    map["userNo"] = UserInfo.userNo;
    map["productId"] = model.spotTypes.id.toString();

    NetUtil.get(ZiXunApis.ZIXUNProductFollowProduct, (data) {
      model.isFollow = model.isFollow == 0 ? 1 : 0;
      setState(() {});
    }, params: map);
  }

  Future<void> fetchData() async {
    Map<String, String> map =   Map();
    map["userNo"] = UserInfo.userNo;
    map["typeId"] = _typeId;

    NetUtil.get(ZiXunApis.ZIXUNGetProductListByTypeId, (data) {
      mainModel = ZiXunShowProductModel.fromJson(data);
      setState(() {});
    }, params: map);
  }

  Widget createLines() {
    return Container(
      // padding: EdgeInsets.only(left: ),
      width: 1,
      height: 15,
      color: Colors.grey,
    );
  }

  Widget createText(String text, int index) {
    var width = Screen.width - 40;

    return Container(
        // padding: EdgeInsets.only(left: ),
        width: width / 4 - 2,
        child: GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                _typeId = "0";
                break;
              case 1:
                _typeId = "10";
                break;
              case 2:
                _typeId = "11";
                break;
              default:
                _typeId = "12";
                break;
            }
            fetchData();
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 129, 154, 195)),
          ),
        ));
  }

  Widget createSelectStrs() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 25,
      // color: Colors.red,
      child: Row(
        children: <Widget>[
          createText("全部", 0),
          createLines(),
          createText("金属矿产", 1),
          createLines(),
          createText("能源化工", 2),
          createLines(),
          createText("农副产品", 3),
        ],
      ),
    );
  }

  Widget createInputView() {
    final controller = TextEditingController();
    return Container(
        padding: EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Container(
              color: Color.fromARGB(255, 230, 236, 240),
              height: 40,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      // height: 36,
                      // color: Colors.red,
                      child: TextField(
                        cursorColor: Colors.grey,
                        controller: controller,
                        // maxLength: 30, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                        decoration: InputDecoration(hintText: "输入产品名称",border: InputBorder.none,),
                        maxLines: 1, //最大行数
                        // autocorrect: true, //是否自动更正
                        // autofocus: true, //是否自动对焦
                        obscureText: false, //是否是密码
                        textAlign: TextAlign.left, //文本对齐方式
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.blue), //输入文本的样式
                        // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                        onChanged: (text) {
                          //内容改变的回调
                          print('change $text');
                        },
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
                          print('submit $text');
                        },
                        // enabled: 上上上, //是否禁用
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  Widget getSection(DataList model) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.bottomLeft,
          height: 35,
          child: Text(model.spotTypes.typeName, textAlign: TextAlign.left),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 10.0,
            children: model.spotTypesList
                .map((language) => Chip(
                      shape:   RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      backgroundColor: Color.fromARGB(255, 230, 236, 240),
                      label: GestureDetector(
                        onTap: () {
                          widget.onChanged(language.spotTypes);
                          Navigator.pop(context);
                        },
                        child: Text(language.spotTypes.typeName,
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 46, 69))),
                      ),
                      deleteIcon: GestureDetector(
                        onTap: () {
                          // GlobalVariable.setToast(
                              // language.isFollow == 0 ? "关注" : "取消");
                          changerFollowState(language);
                        },
                        child: Image.asset(language.isFollow == 0
                            ? 'lib/assets/images/news_product_show_unstar.png'
                            : 'lib/assets/images/news_product_show_stared.png'),
                      ),
                      onDeleted: () {},
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  List<Widget> getChilren() {
    var list = <Widget>[];
    for (var model in mainModel.dataList) {
      var widget = getSection(model);
      list.add(widget);
    }
    return list;
  }

  Widget createGirdView() {
    var height = Screen.height - 200 ;
    if (Screen.height >= 812) {
      height -= 22;
    }
    return Container(
      padding: EdgeInsets.all(10),
      height: height,
      child: ListView(
        children: getChilren(),
      ),
    );
  }

  List<Widget> getBody() {
    var list = <Widget>[];
    list.add(createInputView());
    list.add(createSelectStrs());
    if (mainModel == null) {
      return list;
    }
    list.add(createGirdView());

    return list;
  }

  Widget getSubViews() {
    return Stack(
      children: <Widget>[
        Column(
          children: getBody(),
        ),
      ],
    );
  }

  Widget resetBackIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "自选品种",
          style: TextStyle(
              color: Color.fromARGB(255, 39, 46, 69),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('lib/assets/images/pub_back_gray.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Map<String, dynamic> map =   Map();
                map["Id"] = 0;
                map["TypeName"] = "自选";

                SpotTypes model = SpotTypes.fromJson(map);
                // model.id = 0;
                // model.typeName = "自选";
                widget.onChanged(model);

                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(right: 16),
                alignment: Alignment.centerRight,
                height: 80,
                child: Text(
                  "重置",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 101, 210),
                  ),
                ),
              ))
        ],
        brightness: Brightness.light,
      ),

      body: getSubViews(),
    );
  }
}
