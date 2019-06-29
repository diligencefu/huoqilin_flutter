// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_show_likers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleShowLikersModel _$ArticleShowLikersModelFromJson(
    Map<String, dynamic> json) {
  return new ArticleShowLikersModel(
      json['Code'] as int,
      json['TotalCount'] as int,
      (json['Data1'] as List)
          ?.map((e) =>
              e == null ? null : new Data1.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['Data2'] as int);
}

abstract class _$ArticleShowLikersModelSerializerMixin {
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
      json['User'] == null
          ? null
          : new User.fromJson(json['User'] as Map<String, dynamic>),
      json['Up'] == null
          ? null
          : new Up.fromJson(json['Up'] as Map<String, dynamic>),
      json['CreateDatetime_Text'] as String,
      json['Dynamic'] == null
          ? null
          : new Dynamic.fromJson(json['Dynamic'] as Map<String, dynamic>));
}

abstract class _$Data1SerializerMixin {
  User get user;
  Up get up;
  String get createDatetimeText;
  Dynamic get dynamic1;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'User': user,
        'Up': up,
        'CreateDatetime_Text': createDatetimeText,
        'Dynamic': dynamic1
      };
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      json['UserNo'] as String,
      json['HeadPortrait'] as String,
      json['NickName'] as String,
      json['Gender'] as String,
      json['Mobile'] as String,
      json['Email'] as String,
      json['Personalized'] as String,
      json['Introduction'] as String,
      json['Experience'] as int,
      json['Gold'] as int);
}

abstract class _$UserSerializerMixin {
  String get userNo;
  String get headPortrait;
  String get nickName;
  String get gender;
  String get mobile;
  String get email;
  String get personalized;
  String get introduction;
  int get experience;
  int get gold;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'UserNo': userNo,
        'HeadPortrait': headPortrait,
        'NickName': nickName,
        'Gender': gender,
        'Mobile': mobile,
        'Email': email,
        'Personalized': personalized,
        'Introduction': introduction,
        'Experience': experience,
        'Gold': gold
      };
}

Up _$UpFromJson(Map<String, dynamic> json) {
  return new Up(
      json['Id'] as int,
      json['CreateUserNo'] as String,
      json['RefId'] as int,
      json['UpType'] as int,
      json['CreateDate'] as String);
}

abstract class _$UpSerializerMixin {
  int get id;
  String get createUserNo;
  int get refId;
  int get upType;
  String get createDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'CreateUserNo': createUserNo,
        'RefId': refId,
        'UpType': upType,
        'CreateDate': createDate
      };
}

Dynamic _$DynamicFromJson(Map<String, dynamic> json) {
  return new Dynamic(
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

abstract class _$DynamicSerializerMixin {
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
