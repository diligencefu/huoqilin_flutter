import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huoqilin_project/configs/global.dart';
import 'package:huoqilin_project/tools/real_rich_text.dart';
import 'package:huoqilin_project/tools/screen.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isRemembered = false;

  bool _isReadProtocol = true;

  String _userName = "";
  String _password = "";

  static const view_height = 45.0;
  static Color viewColor = MyColor.setRGBColor(226, 234, 239);

  loginAction() {

    if (!_isReadProtocol){
      MyToast.setToast("请先阅读并同意协议！");
      return;
    }
    if (_userName.length == 0){
       MyToast.setToast("请输入用户名");
       return;
    }
    if (_password.length == 0){
      MyToast.setToast("请输入密码");
      return;
    }

    GlobalConfig.toZiXunPage(context: context);
  }

//协议
  Widget buildProtocol() {
    var fontSize = 15.0;

    var style = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: MyColor.mainColor,
      textBaseline: TextBaseline.ideographic,
    );
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        alignment: Alignment.bottomCenter,
        height: 66,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(right: 4),
                child: Image.asset(MyImage.getImageAsset(_isReadProtocol
                    ? "login_page_remember.png"
                    : "login_page_unremember.png")),
              ),
              onTap: () {
                _isReadProtocol = !_isReadProtocol;
                setState(() {});
              },
            ),
            RealRichText([
              TextSpan(
                text: "同意",
                style: TextStyle(
                    color: MyColor.textBlackColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: "《用户使用协议》",
                style: style,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    MyToast.setToast("邮箱：znsm@qfsctech.com");
                  },
              ),
              TextSpan(
                text: "《用户须知》",
                style: style,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    MyToast.setToast("邮箱：znsm@qfsctech.com");
                  },
              ),
            ]),
          ],
        ),
      );
  }

//忘记密码
  Widget buildForgetPswButton() {
    var style = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: MyColor.textBlackColor,
        textBaseline: TextBaseline.ideographic,
        decoration: TextDecoration.underline,
        decorationColor: MyColor.getGrayColor(0),
        decorationStyle: TextDecorationStyle.solid);

    return Container(
      padding: EdgeInsets.only(top: 16, right: 0, left: 0),
      child: Center(
          child: Text(
        "忘记密码?",
        style: style,
      )),
    );
  }

//输入框
  Widget buildActionButton(bool isLogin) {
    var key = isLogin ? "login_key" : "Register_key";

    var style = TextStyle(
      color: MyColor.textBlackColor,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: EdgeInsets.only(top: 25, right: 52, left: 52),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
            padding: EdgeInsets.only(left: 0),
            height: view_height,
            width: Screen.width - 104,
            color: viewColor,
            child: MaterialButton(
              color: isLogin ? MyColor.mainColor : viewColor,
              child: Center(
                  child: Text(
                isLogin ? "登录" : "注册",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: isLogin ? Colors.white : MyColor.textBlackColor,
                ),
              )),
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
              ),
              onPressed: () {
                loginAction();
              },
            )),
      ),
    );
  }

// 记住密码
  Widget rememberPsw() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 52, left: 52),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(left: 80),
          height: 30,
          width: Screen.width - 104,
          child: FlatButton.icon(
            // color: Colors.white,
            // padding: EdgeInsets.only(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            icon: Image.asset(MyImage.getImageAsset(_isRemembered
                ? "login_page_remember.png"
                : "login_page_unremember.png")),
            label: Text(
              "记住密码",
              style: TextStyle(
                color: MyColor.setRGBColor(104, 127, 161),
                fontSize: 14,
              ),
            ),
            onPressed: () {
              _isRemembered = !_isRemembered;
              setState(() {});
            },
          ),
          // child: ,
        ),
      ),
    );
  }

// 输入框
  Widget buildInputView(bool isPsw) {
    final phone = TextEditingController();
    phone.text = _userName;
    final password = TextEditingController();
    password.text = _password;

    var key = isPsw ? "Phone_key" : "Password_key";

    var style = TextStyle(
      color: MyColor.textBlackColor,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: EdgeInsets.only(top: 25, right: 52, left: 52),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
            padding: EdgeInsets.only(left: 12),
            height: view_height,
            width: Screen.width - 104,
            color: viewColor,
            child: Container(
              padding: EdgeInsets.only(top: 0),
              // color: Colors.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    MyImage.getImageAsset(isPsw
                        ? "login_textfield_psw.png"
                        : "login_textfield_phone.png"),
                    height: view_height,
                    width: 40,
                  )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 0, right: 46, top: 0),
                      child: TextField(
                        key: Key(key),
                        cursorColor: Colors.grey,
                        controller: isPsw ? password : phone,
                        // maxLength: 30, //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                        decoration: InputDecoration(
                            hintText: isPsw ? "请输入密码" : "请输入账号",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey)
                            // labelText: "sss",
                            ),

                        maxLines: 1, //最大行数
                        obscureText: isPsw, //是否是密码
                        textAlign: TextAlign.center, //文本对齐��式
                        style: style, //输入文本的样式
                        onChanged: (text) {
                          isPsw ? _password = text : _userName = text;
                        },
                        onSubmitted: (text) {
                          loginAction();
                        },
                        // enabled: 上上上, //是否禁用
                      ),
                    ),
                  )
                ],
              ),
            )
            // child: ,
            ),
      ),
    );
  }

  Widget topImageView() {
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    double imageHieght = _statusBarHeight + 235;
    return Container(
      // height: 235 + _statusBarHeight,
      color: Colors.red,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: Image.asset(
              MyImage.getImageAsset("login_head_bg_image.png"),
              fit: BoxFit.fill,
              height: imageHieght,
              width: Screen.width,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: imageHieght - 130 - 20),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              MyImage.getImageAsset("app_logo.png"),
              height: 130,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }

  Widget setBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          topImageView(),
          buildInputView(false),
          buildInputView(true),
          rememberPsw(),
          buildActionButton(true),
          buildActionButton(false),
          buildForgetPswButton(),
          // buildProtocol(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          setBody(),
          buildProtocol(),
        ],
      ),
    );
  }
}
