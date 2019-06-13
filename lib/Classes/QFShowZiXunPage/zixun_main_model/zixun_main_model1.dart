
import 'dart:convert';

class ZiXunMainModel1 {

     int qfId;
     int qfZXType;
     int qfProductId;
     String qfIsCoverImg;
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
     String qfViewCount;
     String qfState;
     String qfSource;
     String qfCommentCount;
     String qfDelete;
     String qfCreateTime ;
     String qfCreateTime1 ;
     String qfCreateTime2 ;

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
        qfCreateTime = json['CreateTime'];

  Map<String, dynamic> toJson() => {
        'Id': qfId,
        'ZXType': qfZXType,
        'ProductId': qfProductId,
        'IsCoverImg': qfIsCoverImg,
        'Title': qfTitle,
        'Author': qfAuthor,
        'Summary': qfSummary,
        'CreateTime': qfCreateTime,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"Id\":\"$qfId\"");
    sb.write(",\"ZXType\":$qfZXType");
    sb.write(",\"ProductId\":\"$qfProductId\"");
    sb.write(",\"IsCoverImg\":\"$qfIsCoverImg\"");
    sb.write(",\"Title\":\"$qfTitle\"");
    sb.write(",\"Author\":\"$qfAuthor\"");
    sb.write(",\"Summary\":\"$qfSummary\"");
    sb.write(",\"CreateTime\":\"$qfCreateTime\"");
    sb.write('}');
    return sb.toString();
  }
}
