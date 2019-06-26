class QFZiXunApis {

  /// 最新项目tab (首页的第二个tab) http://wanandroid.com/article/listproject/0/json

  static const String kBaseUrl = 'https://qfsctech.com/8090';

  static const String ZIXUNGetTypeList = kBaseUrl+"/News/GetTypeList";
  static const String ZIXUNGetInformationList = kBaseUrl+"/News/GetInformationList";

  static const String ZIXUNGetProductListByTypeId = kBaseUrl+"/News/GetProductListByTypeId";

  static const String ZIXUNProductFollowProduct = kBaseUrl+"/News/FollowProduct";


  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}