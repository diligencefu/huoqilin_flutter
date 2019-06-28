import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/choose_product_news/article_show_comment_model.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/choose_product_news/zi_xun_article_detail_model.dart';
import 'package:huoqilin_project/Classes/QFShowZiXunPage/zixun_main_model/zixun_main_model1.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:huoqilin_project/Classes/tools/NetWork/QFZiXunApis.dart';
import 'package:huoqilin_project/Classes/tools/NetWork/net_util.dart';
import 'package:huoqilin_project/Classes/tools/loading_view/loading_view.dart';
import 'package:huoqilin_project/Classes/tools/real_rich_text.dart';
import 'package:huoqilin_project/Classes/tools/screen.dart';
import 'package:huoqilin_project/Classes/tools/user_info_cache/user_info.dart';
import 'package:html/dom.dart' as dom;
import 'package:huoqilin_project/Classes/tools/global_variable/QF_global_variables.dart';

// import 'webview_scaffold.dart';
class QFZiXunArticleDetailPage extends StatefulWidget {
  ZiXunMainModel1 model;
  Data1 data;
  QFZiXunArticleDetailPage(this.model);
  // 命名构造函数
  QFZiXunArticleDetailPage.otherModel(this.model);

  @override
  QFZiXunArticleDetailPageState createState() =>
      QFZiXunArticleDetailPageState();
}

class QFZiXunArticleDetailPageState extends State<QFZiXunArticleDetailPage> {
  bool isFavorited = false;
  // int favoriteCount = 40;

  bool isShow_comment = true;

  ZiXunArticleDetailModel mainModel;

  ArticleShowCommentModel commentModel;

  void initState() {
    super.initState();
    fetchData();
    requestCommentsData();
  }

  Future<void> fetchData() async {
    Map<String, String> map = Map();
    map["userNo"] = UserInfo.userNo;
    map["id"] = widget.model.qfId.toString();

    NetUtil.get(QFZiXunApis.ZIXUNGetInformationById, (data) {
      print(data);
      mainModel = ZiXunArticleDetailModel.fromJson(data);
      setState(() {});
    }, params: map);
  }

  Future<void> requestCommentsData() async {
    Map<String, String> map = Map();
    map["userNo"] = UserInfo.userNo;
    map["newsId"] = widget.model.qfId.toString();
    // map["newsId"] = "273429";

    NetUtil.get(QFZiXunApis.ZIXUNGetCommentListById, (data) {
      print(data);
      commentModel = ArticleShowCommentModel.fromJson(data);
      print(commentModel.commentData);
      setState(() {});
    }, params: map);
  }

  Future<void> likeSwitch() async {
    int value = mainModel.data3;
    Map<String, String> map = Map();
    map["userNo"] = UserInfo.userNo;
    map["refId"] = mainModel.data1.id.toString();
    map["upType"] = "0";

    NetUtil.get(QFZiXunApis.ZIXUNdoUp, (data) {}, params: map);
  }

  Future<void> collectionSwitch() async {
    int value = mainModel.data2;

    Map<String, String> map = Map();
    map["userNo"] = UserInfo.userNo;
    map["id"] = mainModel.data1.id.toString();

    NetUtil.get(QFZiXunApis.ZIXUNdoFavorite, (data) {}, params: map);
  }

  Widget buildBottomView() {
    if (isShow_comment) {
      return buildCommentsView();
    } else {
      return buildLikersView();
    }
  }

  List<Widget> getlikers() {
    var comments = <Widget>[];

    if (commentModel == null || commentModel.commentData == null) {
      var text = Container(
        child: Center(
          child: Text("暂无评论"),
        ),
      );
      comments.add(text);

      return comments;
    } else {
      for (var model in commentModel.commentData) {
        comments.add(createLikeView(model));
      }
      return comments;
    }
  }

  Widget buildLikersView() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        children: getlikers(),
      ),
    );
  }

  Widget createLikeView(CommentData model) {
    return Container(
      height: 66,
      padding: EdgeInsets.only(top: 6),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      GlobalVariable.setToast("查看" + model.user.nickName);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: CachedNetworkImage(
                        imageUrl: model.user.headPortrait,
                        // placeholder: (context, url) => Container(
                        //       width: 40,
                        //       height: 40,
                        //       child: Image.asset(
                        //           "lib/assets/images/user_placeholder_image.jpg"),
                        //     ),
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    // color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 24,
                          padding: EdgeInsets.only(left: 0),
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              GlobalVariable.setToast(
                                  "查看" + model.user.nickName);
                            },
                            child: Text(
                              model.user.nickName,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 39, 48, 62),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0, right: 0),
                          alignment: Alignment.centerLeft,
                          height: 16,
                          width: Screen.width - 40 - 40 - 12,
                          child: Text(
                            model.user.personalized,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            strutStyle: StrutStyle.disabled,
                            style: TextStyle(
                                color: Color.fromARGB(255, 152, 163, 182),
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 0, top: 12),
            child: Container(
              height: 0.7,
              color: Color.fromARGB(255, 226, 239, 246),
            ),
          )
        ],
      ),
    );
  }

  Widget buildReplys(ReCommentList model) {
    if (model.userRe != null) {
      return Container(
        padding: EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
        alignment: Alignment.centerLeft,
        child: RealRichText([
          TextSpan(
            text: model.user.nickName,
            style: TextStyle(
                color: Color.fromARGB(255, 66, 133, 217), fontSize: 15),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GlobalVariable.setToast("查看" + model.user.nickName);
              },
          ),
          TextSpan(text: " 回复 "),
          TextSpan(
            text: "@" + model.user.nickName,
            style: TextStyle(
                color: Color.fromARGB(255, 66, 133, 217), fontSize: 15),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GlobalVariable.setToast("查看" + model.user.nickName);
              },
          ),
          TextSpan(text: " : " + model.comment.content),
        ]),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
        alignment: Alignment.centerLeft,
        child: RealRichText([
          TextSpan(
            text: model.user.nickName,
            style: TextStyle(
                color: Color.fromARGB(255, 66, 133, 217), fontSize: 15),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GlobalVariable.setToast("回复：" + model.user.nickName);
              },
          ),
          TextSpan(text: " : " + model.comment.content),
        ]),
      );
    }
  }

  List<Widget> setReplys(CommentData list) {
    var replys = <Widget>[];
    for (var model in list.reCommentList) {
      replys.add(buildReplys(model));
    }
    return replys;
  }

  Widget buildReplyCommentView(CommentData model) {
    return Container(
      color: Color.fromARGB(255, 239, 242, 249),
      child: Column(
        children: setReplys(model),
      ),
    );
  }

  Widget buildComment(CommentData model) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 2),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    GlobalVariable.setToast("查看" + model.user.nickName);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: model.user.headPortrait,
                      placeholder: (context, url) => Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                                "lib/assets/images/user_placeholder_image.jpg"),
                          ),
                      width: 40,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 24,
                        padding: EdgeInsets.only(left: 0),
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            GlobalVariable.setToast("查看" + model.user.nickName);
                          },
                          child: Text(
                            model.user.nickName,
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 48, 62),
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 0),
                        alignment: Alignment.centerLeft,
                        height: 16,
                        child: Text(
                          model.createDatetimeText,
                          style: TextStyle(
                              color: Color.fromARGB(255, 152, 163, 182),
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 6),
            alignment: Alignment.centerLeft,
            child: Text(
              model.comment.content,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromARGB(255, 39, 48, 62),
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          buildReplyCommentView(model),
          Container(
            padding: EdgeInsets.only(left: 0, top: 6),
            child: Container(
              height: 0.7,
              color: Color.fromARGB(255, 226, 239, 246),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getComments() {
    var comments = <Widget>[];

    if (commentModel == null || commentModel.commentData == null) {
      var text = Container(
        child: Center(
          child: Text("暂无评论"),
        ),
      );
      comments.add(text);

      return comments;
    } else {
      for (var model in commentModel.commentData) {
        comments.add(buildComment(model));
      }
      return comments;
    }
  }

  Widget buildCommentsView() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Column(
        children: getComments(),
      ),
    );
  }

//线
  Widget buildLineView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 23, bottom: 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 12,
            padding: EdgeInsets.all(0),
            child: Container(
              color: Color.fromARGB(255, 235, 239, 245),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0)),
                      child: Container(
                        height: 40,
                        width: (Screen.width - 40) / 2,
                        color: Color.fromARGB(255, 38, 110, 217),
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            isShow_comment = true;
                            setState(() {});
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                bottomLeft: Radius.circular(4.0)),
                            child: Container(
                              color: isShow_comment
                                  ? Color.fromARGB(255, 38, 110, 217)
                                  : Colors.white,
                              child: Center(
                                child: Text(
                                  "评论（156）",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: !isShow_comment
                                        ? Color.fromARGB(255, 38, 110, 217)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0)),
                      child: Container(
                        height: 40,
                        width: (Screen.width - 40) / 2,
                        color: Color.fromARGB(255, 38, 110, 217),
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            isShow_comment = false;
                            setState(() {});
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.0),
                                bottomRight: Radius.circular(4.0)),
                            child: Container(
                              color: !isShow_comment
                                  ? Color.fromARGB(255, 38, 110, 217)
                                  : Colors.white,
                              child: Center(
                                child: Text(
                                  "点赞（1312）",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isShow_comment
                                        ? Color.fromARGB(255, 38, 110, 217)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }

  String getHtmlStr(String html) {
    var headStr =
        "<!DOCTYPE html><html lang=\"zh\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"><title>Document</title><style>img{max-width:100%;height:auto !important;}body {font-size: 18px !important;line-height: 30px !important;}</style></head><body>";
    var footStr = "</body></html>";
    return headStr + html + footStr;
  }

  Widget buildButton(String title, String imageName) {
    Color showColor = Color.fromARGB(255, 124, 192, 231);

    var showName = title;
    if (title == "收藏" && mainModel.data2 == 1) {
      showColor = Color.fromARGB(255, 255, 46, 23);
      imageName = imageName + "ed";
      showName = "已" + title;
    }

    if (title == "点赞" && mainModel.data3 == 1) {
      showColor = Color.fromARGB(255, 255, 46, 23);
      imageName = imageName + "ed";
      showName = "已" + title;
    }

    var width = (Screen.width - 40) / 3 - 10;

    return Container(
      height: 30,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FlatButton.icon(
            // color: Colors.white,
            // padding: EdgeInsets.only(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            icon: Image.asset("lib/assets/images/$imageName.png"),
            label: Text(
              showName,
              style: TextStyle(
                color: showColor,
                fontSize: 14,
              ),
            ),
            onPressed: () {},
          ),
          OutlineButton(
            borderSide: BorderSide(color: showColor),
            onPressed: () {
              if (title == "收藏") {
                collectionSwitch();
                mainModel.data2 = mainModel.data2 == 1 ? 0 : 1;
                setState(() {});
              }
              if (title == "点赞") {
                likeSwitch();
                mainModel.data3 = mainModel.data3 == 1 ? 0 : 1;
                setState(() {});
              }
              setState(() {});
            },
          )
        ],
      ),
    );
  }

//评论，收���，点赞
  Widget buildOprationView() {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 20),
      height: 50,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton("评论", "zixun_article_detail_comment"),
          buildButton("收藏", "zixun_article_detail_collect"),
          buildButton("点赞", "zixun_article_detail_zan"),
        ],
      ),
    );
  }

//免责声明
  Widget buildDisclaimerView() {
    double fontSize = 16;
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: OutlineButton(
        borderSide: new BorderSide(color: Color.fromARGB(255, 178, 188, 205)),
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: RealRichText([
            TextSpan(
              text:
                  "本站所提供的内容源自于用户投稿、整理编辑、转载，并不代表本网站观点和立场，不为其版权负责。本网站所提供的信息�����在准确性、有效性、及时性和完整性仅供参考。如有侵犯版权，请作者持权属证明与我们联系，拨打",
              style: TextStyle(
                  color: Color.fromARGB(255, 178, 188, 205),
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
            TextSpan(
              text: " 0755-82569529 ",
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 110, 217),
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GlobalVariable.setToast("电话：0755-82569529 ");
                },
            ),
            TextSpan(
              text: "或发邮件至",
              style: TextStyle(
                  color: Color.fromARGB(255, 178, 188, 205),
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
            TextSpan(
              text: " znsm@qfsctech.com ",
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 110, 217),
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GlobalVariable.setToast("邮箱：znsm@qfsctech.com");
                },
            ),
            TextSpan(
              text: "，我们将及时处理，谢谢！",
              style: TextStyle(
                  color: Color.fromARGB(255, 178, 188, 205),
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            )
          ]),
        ),
      ),
    );
  }

  Widget buildHtml() {
    return Html(
      data: getHtmlStr(mainModel.data1.content ?? "loading"),
      //Optional parameters:
      padding: EdgeInsets.only(top: 20),
      linkStyle: const TextStyle(
        color: Color.fromARGB(255, 06, 101, 230),
        decorationColor: Color.fromARGB(255, 06, 101, 230),
        decoration: TextDecoration.underline,
      ),
      onLinkTap: (url) {
        print("Opening $url...");
      },
      onImageTap: (src) {
        print(src);

        Navigator.of(context).push(
          NinePicture([src], 0), // 图片集合，要显示的下标
        );
      },
      defaultTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        letterSpacing: 0.5,
      ),
      customRender: (node, children) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "custom_tag":
              return Column(children: children);
          }
        }
        return null;
      },
      customTextAlign: (dom.Node node) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
              return TextAlign.justify;
          }
        }
        return null;
      },
      customTextStyle: (dom.Node node, TextStyle baseStyle) {
        if (node is dom.Element) {
          switch (node.localName) {
            case "p":
              return baseStyle.merge(TextStyle(height: 1.19, fontSize: 18));
          }
        }
        return baseStyle;
      },
      //Must have useRichText set to false for this to work
    );
  }

  // 中间的html内容
  Widget buildBoyView() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                createTitleView(),
                createAuthorView(),
                buildHtml(),
                buildDisclaimerView(),
                buildOprationView(),
                buildLineView(),
                buildBottomView(),
              ],
            )),
      ),
    );
  }

  Widget createView() {
    if (mainModel == null) {
      return Container();
    } else {
      return buildBoyView();
    }
  }

  //标题
  Widget createTitleView() {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Text(
        this.widget.model.qfTitle,
        maxLines: 3,
        style: TextStyle(
          color: Color.fromARGB(255, 36, 46, 69),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

//作者及��览量
  Widget createAuthorView() {
    // assert(buildHtml() == buildHtml());
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            height: 42,
            child: Text(
              mainModel.data1.author,
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
              "浏览量: " + mainModel.data1.viewCount.toString(),
              maxLines: 1,
              style: TextStyle(
                color: Color.fromARGB(255, 169, 175, 182),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
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
        preferredSize: Size(MediaQuery.of(context).size.width, 44),
      ),
      body: createView(),
    );
  }
}
