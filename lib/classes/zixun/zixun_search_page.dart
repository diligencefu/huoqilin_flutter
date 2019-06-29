import 'package:easy_listview/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/classes/zixun/zixun_article_detail_page.dart';
import 'package:huoqilin_project/classes/zixun/zixun_models/zi_xun_list_model.dart';
import 'package:huoqilin_project/classes/zixun/zixun_models/zixun_main_model1.dart';
import 'package:huoqilin_project/configs/my_toast.dart';
import 'package:huoqilin_project/net_works/net_util.dart';
import 'package:huoqilin_project/net_works/zixun_api.dart';
import 'package:huoqilin_project/tools/loading_view/loading_view.dart';
import 'package:huoqilin_project/tools/user_info_cache/user_info.dart';


class QFSearchZiXunPage extends StatefulWidget {
  ZiXunMainModel1 model;
  QFSearchZiXunPage(this.model);
  @override
  QFSearchZiXunPageState createState() => QFSearchZiXunPageState();
}

class QFSearchZiXunPageState extends State<QFSearchZiXunPage> {
  var currentPage = 1;
  bool isnomore = true;
  bool isLoading = false;
  List<Data1> modules = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    // fetchSearchInfoData();
  }

  Future<void> fetchSearchInfoData() async {
    int pageSize = 10;
    if (isLoading) {
      return;
    }
    isLoading = true;
    setState(() {});

    Map<String, String> map = Map();
    map["userNo"] = UserInfo.userNo;
    map["pageIndex"] = "$currentPage";
    map["pageSize"] = "$pageSize";
    map["keywords"] = searchText;

    NetUtil.get(ZiXunApis.ZIXUNSearchInformation, (data) {
      ZiXunListModel mainModel = ZiXunListModel.fromJson(data);
      isnomore = !(mainModel.data2 > currentPage * pageSize);
      isLoading = false;

      if (currentPage == 1) {
        if (mainModel.data1.length == 0) {
          MyToast.setToast("暂无相关内容");
        }
        modules.clear();
      }
      for (var data in mainModel.data1) {
        modules.add(data);
      }

      setState(() {});
    }, params: map);
  }

  Future<void> refrenshData() async {
    currentPage = 1;
    fetchSearchInfoData();
  }

  Future<void> footLoadMoreData() async {
    currentPage++;
    fetchSearchInfoData();
  }

  Widget createInputView() {
    final controller = TextEditingController();
    controller.text = searchText;
    return Container(
        padding: EdgeInsets.only(bottom: 5),
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
                      padding: EdgeInsets.only(left: 8, top: 20),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        key: Key("inputKey"),
                        cursorColor: Colors.grey,
                        controller: controller,
                        // maxLength: 30, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                        decoration: InputDecoration(
                            hintText: "输入产品名称",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey)
                            // labelText: "sss",
                            ),

                        maxLines: 1, //最大行数
                        // autocorrect: true, //是否自动更正
                        autofocus: true, //是否自动对焦
                        obscureText: false, //是否是密码
                        textAlign: TextAlign.left, //文本对齐方式
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 36, 49, 69)), //输入文本的样式
                        // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                        onChanged: (text) {
                          //内容改变的回调
                          searchText = text;
                          // print('change $text');
                        },
                        onSubmitted: (text) {
                          //内容提交(按回车)的回调
                          refrenshData();
                        },
                        // enabled: 上上上, //是否禁用
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  back(context) {
    Navigator.of(context).pop();
  }

  Widget createListCellNoImages(Data1 model) {
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
              model.summary,
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
                  model.createTime.substring(0, 10),
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 52, 120, 245)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    model.author,
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

  Widget addTapAction(Data1 data, Widget cell) {
    return GestureDetector(
      onTap: () {
        ZiXunMainModel1 model = ZiXunMainModel1();
        model.qfAuthor = data.author;
        model.qfSummary = data.summary;
        model.qfViewCount = data.viewCount;
        model.qfId = data.id;
        model.qfTitle = data.title;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QFZiXunArticleDetailPage(model)));
      },
      child: cell,
    );
  }

  Widget setBody() {
    if (isLoading) {
      return Stack(
        children: <Widget>[
          createListView(),
          LoadingDialog(
            text: "",
          ),
        ],
      );
    } else {
      return createListView();
    }
  }

  Widget createListView() {
    return EasyListView(
      isSliverMode: false,
      // footerBuilder: footBiulder(),
      itemBuilder: (context, index) {
        var model = modules[index];
        return addTapAction(model, createListCellNoImages(model));
      },
      itemCount: modules.length,
      loadMore: !isnomore,
      loadMoreWhenNoData: false,
      onLoadMore: () {
        footLoadMoreData();
      },
      // headerBuilder: ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: AppBar(
            title: createInputView(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 16),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    if (searchText.length == 0) {
                      MyToast.setToast("请输入关键字");
                    } else {
                      refrenshData();
                    }
                  },
                  child: Text(
                    "搜索",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              )
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
      body: setBody(),
    );
  }
}
