// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zi_xun_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZiXunListModel _$ZiXunListModelFromJson(Map<String, dynamic> json) {
  return new ZiXunListModel(
      json['Code'] as int,
      json['TotalCount'] as int,
      (json['Data1'] as List)
          ?.map((e) =>
              e == null ? null : new Data1.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['Data2'] as int);
}

abstract class _$ZiXunListModelSerializerMixin {
  int get code;
  int get totalCount;
  List<Data1> get data1;
  int get data2;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Code': code,
        'TotalCount': totalCount,
        'Data1': data1,
        'Data2': data2
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
      json['IsFile'] as int,
      json['FileUrl'] as String,
      json['Title'] as String,
      json['AuthorId'] as int,
      json['Author'] as String,
      json['Summary'] as String,
      json['Source'] as int,
      json['SourceWebsite'] as String,
      json['Url'] as String,
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
  int get isFile;
  String get fileUrl;
  String get title;
  int get authorId;
  String get author;
  String get summary;
  int get source;
  String get sourceWebsite;
  String get url;
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
        'IsFile': isFile,
        'FileUrl': fileUrl,
        'Title': title,
        'AuthorId': authorId,
        'Author': author,
        'Summary': summary,
        'Source': source,
        'SourceWebsite': sourceWebsite,
        'Url': url,
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
