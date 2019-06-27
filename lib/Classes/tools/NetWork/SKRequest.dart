import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:huoqilin_project/Classes/tools/global_variable/QF_global_variables.dart';

class Request {

  static void get(String url,Map<String, String> params, Function callBack,
      { Function errorBack}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb =   StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    
    try {
      print(url);
      http.Response res = await http.get(url);
      if (callBack != null) {
        callBack(res.body);
      }
    } catch (exception) {
      print(exception.toString());
      GlobalVariable.showCenterShortToast(exception.toString());
      if (errorBack != null) {
        errorBack(exception);
      }
    }
  }

  static void post(String url, Function callBack, Map<String, String> paramas,
      Function callError) async {
    try {
      http.Response res = await http.post(url, body: paramas);
      if (callBack != null) {
        callBack(res.body);
      }
    } catch (exception) {
      GlobalVariable.showCenterShortToast(exception.toString());
      if (callError != null) {
        callError(exception);
      }
    }
  }
}
