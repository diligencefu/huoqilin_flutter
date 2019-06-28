// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_show_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleShowCommentModel _$ArticleShowCommentModelFromJson(
    Map<String, dynamic> json) {
  return new ArticleShowCommentModel(
      json['Code'] as int,
      json['TotalCount'] as int,
      (json['Data1'] as List)
          ?.map((e) => e == null
              ? null
              : new CommentData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['Data2'] as int);
}

abstract class _$ArticleShowCommentModelSerializerMixin {
  int get code;
  int get totalCount;
  List<CommentData> get commentData;
  int get data2;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Code': code,
        'TotalCount': totalCount,
        'Data1': commentData,
        'Data2': data2
      };
}

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return new CommentData(
      json['User'] == null
          ? null
          : new User.fromJson(json['User'] as Map<String, dynamic>),
      json['Comment'] == null
          ? null
          : new Comment.fromJson(json['Comment'] as Map<String, dynamic>),
      json['IsCommentAuthor'] as bool,
      json['IsDynamicAuthor'] as bool,
      json['IsUp'] as bool,
      json['CreateDatetime_Text'] as String,
      (json['ReCommentList'] as List)
          ?.map((e) => e == null
              ? null
              : new ReCommentList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$CommentDataSerializerMixin {
  User get user;
  Comment get comment;
  bool get isCommentAuthor;
  bool get isDynamicAuthor;
  bool get isUp;
  String get createDatetimeText;
  List<ReCommentList> get reCommentList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'User': user,
        'Comment': comment,
        'IsCommentAuthor': isCommentAuthor,
        'IsDynamicAuthor': isDynamicAuthor,
        'IsUp': isUp,
        'CreateDatetime_Text': createDatetimeText,
        'ReCommentList': reCommentList
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

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return new Comment(
      json['Id'] as int,
      json['CreateUserNo'] as String,
      json['NewsId'] as int,
      json['CommentId'] as int,
      json['ReCommentId'] as int,
      json['Content'] as String,
      json['CommentType'] as int,
      json['CreateDate'] as String);
}

abstract class _$CommentSerializerMixin {
  int get id;
  String get createUserNo;
  int get newsId;
  int get commentId;
  int get reCommentId;
  String get content;
  int get commentType;
  String get createDate;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'CreateUserNo': createUserNo,
        'NewsId': newsId,
        'CommentId': commentId,
        'ReCommentId': reCommentId,
        'Content': content,
        'CommentType': commentType,
        'CreateDate': createDate
      };
}

ReCommentList _$ReCommentListFromJson(Map<String, dynamic> json) {
  return new ReCommentList(
      json['User'] == null
          ? null
          : new User.fromJson(json['User'] as Map<String, dynamic>),
      json['User_Re'] == null
          ? null
          : new User_Re.fromJson(json['User_Re'] as Map<String, dynamic>),
      json['Comment'] == null
          ? null
          : new Comment.fromJson(json['Comment'] as Map<String, dynamic>),
      json['CreateDatetime_Text'] as String);
}

abstract class _$ReCommentListSerializerMixin {
  User get user;
  User_Re get userRe;
  Comment get comment;
  String get createDatetimeText;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'User': user,
        'User_Re': userRe,
        'Comment': comment,
        'CreateDatetime_Text': createDatetimeText
      };
}

User_Re _$User_ReFromJson(Map<String, dynamic> json) {
  return new User_Re(
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

abstract class _$User_ReSerializerMixin {
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
