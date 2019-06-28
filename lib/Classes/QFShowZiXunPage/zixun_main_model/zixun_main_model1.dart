
import 'dart:convert';

class ZiXunMainModel1 {

     int qfId;
     int qfZXType;
     int qfProductId;
     int qfIsCoverImg;
     int qfCoverImgType;
    
     String qfCoverImgUrl;
     String qfCoverImgUrl2;
     String qfCoverImgUrl3;
    
     String qfTitle;
     String qfAuthor;
     String qfAuthorId;
     String qfSummary;
     String qfContentText;
     String qfContent;
     String qfUrl;
     String qfVisitorsNum;
     String qfUpCount;
     int qfViewCount;
     String qfState;
     String qfSource;
     String qfCommentCount;
     String qfDelete;
     String qfCreateTime;
     String qfCreateTime1;
     String qfCreateTime2;

     double rowHeight;
     bool isLoaded = false;

     bool isGetShare = false;
    
     String isCollected = "0";
     String isLiked = "0";


   ZiXunMainModel1(){
  }

  ZiXunMainModel1.fromJson(Map<String, dynamic> json)
      : qfId = json['Id'],
        qfZXType = json['ZXType'],
        qfProductId = json['ProductId'],
        qfIsCoverImg = json['IsCoverImg'],
        qfTitle = json['Title'],
        qfAuthor = json['Author'],
        qfSummary = json['Summary'],
        qfCreateTime = json['CreateTime'],
        qfCreateTime1 = json['CreateTime'].toString().substring(0,10),
        qfCreateTime2 = json['CreateTime'].toString().substring(11).toString().substring(0,5),
        
        qfViewCount = json['ViewCount'],
        qfCoverImgType = json['CoverImgType'],
        qfCoverImgUrl = json['CoverImgUrl'],
        qfCoverImgUrl2 = json['CoverImgUrl2'],
        qfCoverImgUrl3 = json['CoverImgUrl3'];

  Map<String, dynamic> toJson() => {
        'Id': qfId,
        'ZXType': qfZXType,
        'ProductId': qfProductId,
        'IsCoverImg': qfIsCoverImg,
        'Title': qfTitle,
        'Author': qfAuthor,
        'Summary': qfSummary,
        'CreateTime': qfCreateTime,
        'CreateTime1': qfCreateTime1,
        'CreateTime2': qfCreateTime2,
        'CoverImgType': qfCoverImgType,
        'CoverImgUrl': qfCoverImgUrl,
        'CoverImgUrl2': qfCoverImgUrl2,
        'CoverImgUrl3': qfCoverImgUrl3,
        'ViewCount': qfViewCount,
        // 'CreateTime': qfCreateTime,
      };

  @override
  String toString() {
    StringBuffer sb =   StringBuffer('{');
    sb.write("\"Id\":\"$qfId\"");
    sb.write(",\"ZXType\":$qfZXType");
    sb.write(",\"ProductId\":\"$qfProductId\"");
    sb.write(",\"IsCoverImg\":\"$qfIsCoverImg\"");
    sb.write(",\"Title\":\"$qfTitle\"");
    sb.write(",\"Author\":\"$qfAuthor\"");
    sb.write(",\"Summary\":\"$qfSummary\"");
    sb.write(",\"CreateTime\":\"$qfCreateTime\"");
    sb.write(",\"CoverImgType\":\"$qfCoverImgType\"");
    sb.write(",\"CoverImgUrl\":\"$qfCoverImgUrl\"");
    sb.write(",\"CoverImgUrl2\":\"$qfCoverImgUrl2\"");
    sb.write(",\"CoverImgUrl3\":\"$qfCoverImgUrl3\"");
    sb.write('}');
    return sb.toString();
  }
}
