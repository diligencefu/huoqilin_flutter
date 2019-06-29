// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zi_xun_article_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZiXunArticleDetailModel _$ZiXunArticleDetailModelFromJson(
    Map<String, dynamic> json) {
  return new ZiXunArticleDetailModel(
      json['Code'] as int,
      json['TotalCount'] as int,
      json['Data1'] == null
          ? null
          : new Data1.fromJson(json['Data1'] as Map<String, dynamic>),
      json['Data2'] as int,
      json['Data3'] as int);
}

abstract class _$ZiXunArticleDetailModelSerializerMixin {
  int get code;
  int get totalCount;
  Data1 get data1;
  int get data2;
  int get data3;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Code': code,
        'TotalCount': totalCount,
        'Data1': data1,
        'Data2': data2,
        'Data3': data3
      };
}

Data1 _$Data1FromJson(Map<String, dynamic> json) {
  return new Data1(
      json['Id'] as int,
      json['ZXType'] as int,
      json['BlockType'] as int,
      json['TypeId'] as int,
      json['BusinessId'] as int,
      json['ProductId'] as int,
      json['IsCoverImg'] as int,
      json['CoverImgType'] as int,
      json['CoverImgUrl'] as String,
      json['CoverImgUrl2'] as String,
      json['CoverImgUrl3'] as String,
      json['IsFile'] as int,
      json['FileUrl'] as String,
      json['AuthorId'] as int,
      json['Author'] as String,
      json['ProductIds'] as String,
      json['ProductNames'] as String,
      json['Summary'] as String,
      json['Content'] as String,
      json['ContentText'] as String,
      json['Source'] as int,
      json['SourceWebsite'] as String,
      json['ReferenceId'] as String,
      json['VisitorsNum'] as int,
      json['MoNiViewCount'] as int,
      json['Delete'] as int,
      json['State'] as int,
      json['CreateTime'] as String,
      json['ModifyTime'] as String,
      json['CommentCount'] as int,
      json['UpCount'] as int,
      json['ViewCount'] as int);
}

abstract class _$Data1SerializerMixin {
  int get id;
  int get zXType;
  int get blockType;
  int get typeId;
  int get businessId;
  int get productId;
  int get isCoverImg;
  int get coverImgType;
  String get coverImgUrl;
  String get coverImgUrl2;
  String get coverImgUrl3;
  int get isFile;
  String get fileUrl;
  int get authorId;
  String get author;
  String get productIds;
  String get productNames;
  String get summary;
  String get content;
  String get contentText;
  int get source;
  String get sourceWebsite;
  String get referenceId;
  int get visitorsNum;
  int get moNiViewCount;
  int get delete;
  int get state;
  String get createTime;
  String get modifyTime;
  int get commentCount;
  int get upCount;
  int get viewCount;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'ZXType': zXType,
        'BlockType': blockType,
        'TypeId': typeId,
        'BusinessId': businessId,
        'ProductId': productId,
        'IsCoverImg': isCoverImg,
        'CoverImgType': coverImgType,
        'CoverImgUrl': coverImgUrl,
        'CoverImgUrl2': coverImgUrl2,
        'CoverImgUrl3': coverImgUrl3,
        'IsFile': isFile,
        'FileUrl': fileUrl,
        'AuthorId': authorId,
        'Author': author,
        'ProductIds': productIds,
        'ProductNames': productNames,
        'Summary': summary,
        'Content': content,
        'ContentText': contentText,
        'Source': source,
        'SourceWebsite': sourceWebsite,
        'ReferenceId': referenceId,
        'VisitorsNum': visitorsNum,
        'MoNiViewCount': moNiViewCount,
        'Delete': delete,
        'State': state,
        'CreateTime': createTime,
        'ModifyTime': modifyTime,
        'CommentCount': commentCount,
        'UpCount': upCount,
        'ViewCount': viewCount
      };
}
