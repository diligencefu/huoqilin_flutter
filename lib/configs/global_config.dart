import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huoqilin_project/classes/login/login_page.dart';
import 'package:huoqilin_project/classes/root/zixun_part.dart';

class GlobalConfig {
  /// 登录
  static Future toZiXunPage({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) {
    return Navigator.of(context).pushAndRemoveUntil(
        getMaterPageRoute(context, RouterOptions('home', params: params)),
        (Route<dynamic> route) => false);
  }

  /// 获取当前页面
  static MaterialPageRoute getMaterPageRoute(
    BuildContext context,
    RouterOptions routerOptions,
  ) =>
      MaterialPageRoute(builder: (BuildContext context) => MyHomePage());


        /// 退出登录
  static Future logout({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) {
    return Navigator.of(context).pushAndRemoveUntil(
        getLoginPageRoute(context, RouterOptions('home', params: params)),
        (Route<dynamic> route) => false);
  }

  /// 获取当前页面
  static MaterialPageRoute getLoginPageRoute(
    BuildContext context,
    RouterOptions routerOptions,
  ) =>
      MaterialPageRoute(builder: (BuildContext context) => LoginPage());

}


class RouterOptions {
  String url;
  Map<String, dynamic> params;
  RouterOptions(this.url, {this.params});
}
