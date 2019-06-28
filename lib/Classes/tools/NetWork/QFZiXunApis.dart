class QFZiXunApis {

  /// 最新项目tab (首页的第二个tab) http://wanandroid.com/article/listproject/0/json

  static const String kBaseUrl = 'https://qfsctech.com/8090';
    //#MARK: - //获取第一级分类
  static const String ZIXUNGetTypeList = kBaseUrl+"/News/GetTypeList";
  // 资讯列表
  static const String ZIXUNGetInformationList = kBaseUrl+"/News/GetInformationList";
  // //#MARK: - //获取产品数据
  static const String ZIXUNGetProductListByTypeId = kBaseUrl+"/News/GetProductListByTypeId";
  //#MARK: -关注/取消关注产品
  static const String ZIXUNProductFollowProduct = kBaseUrl+"/News/FollowProduct";
//#MARK: -搜索资讯
  static const String ZIXUNSearchInformation = kBaseUrl+"/News/SearchInformation";
//#MARK: - 资讯详情
  static const String ZIXUNGetInformationById = kBaseUrl+"/News/GetInformationById";
//#MARK: -咨询/取消点赞
  static const String ZIXUNdoUp = kBaseUrl+"/News/doUp";
//#MARK: -收藏/取消资讯
  static const String ZIXUNdoFavorite = kBaseUrl+"/News/doFavorite";
//#MARK: -资讯评论列表
  static const String ZIXUNGetCommentListById = kBaseUrl+"/News/GetCommentListById";



  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb =   StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}