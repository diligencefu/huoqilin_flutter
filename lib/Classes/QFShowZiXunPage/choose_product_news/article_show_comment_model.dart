import 'package:json_annotation/json_annotation.dart'; 
  
part 'article_show_comment_model.g.dart';


@JsonSerializable()
  class ArticleShowCommentModel extends Object with _$ArticleShowCommentModelSerializerMixin{

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'TotalCount')
  int totalCount;

  @JsonKey(name: 'Data1')
  List<CommentData> commentData;

  @JsonKey(name: 'Data2')
  int data2;

  ArticleShowCommentModel(this.code,this.totalCount,this.commentData,this.data2,);

  factory ArticleShowCommentModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleShowCommentModelFromJson(srcJson);

}

  
@JsonSerializable()
  class CommentData extends Object with _$CommentDataSerializerMixin{

  @JsonKey(name: 'User')
  User user;

  @JsonKey(name: 'Comment')
  Comment comment;

  @JsonKey(name: 'IsCommentAuthor')
  bool isCommentAuthor;

  @JsonKey(name: 'IsDynamicAuthor')
  bool isDynamicAuthor;

  @JsonKey(name: 'IsUp')
  bool isUp;

  @JsonKey(name: 'CreateDatetime_Text')
  String createDatetimeText;

  @JsonKey(name: 'ReCommentList')
  List<ReCommentList> reCommentList;

  CommentData(this.user,this.comment,this.isCommentAuthor,this.isDynamicAuthor,this.isUp,this.createDatetimeText,this.reCommentList,);

  factory CommentData.fromJson(Map<String, dynamic> srcJson) => _$CommentDataFromJson(srcJson);

}

  
@JsonSerializable()
  class User extends Object with _$UserSerializerMixin{

  @JsonKey(name: 'UserNo')
  String userNo;

  @JsonKey(name: 'HeadPortrait')
  String headPortrait;

  @JsonKey(name: 'NickName')
  String nickName;

  @JsonKey(name: 'Gender')
  String gender;

  @JsonKey(name: 'Mobile')
  String mobile;

  @JsonKey(name: 'Email')
  String email;

  @JsonKey(name: 'Personalized')
  String personalized;

  @JsonKey(name: 'Introduction')
  String introduction;

  @JsonKey(name: 'Experience')
  int experience;

  @JsonKey(name: 'Gold')
  int gold;

  User(this.userNo,this.headPortrait,this.nickName,this.gender,this.mobile,this.email,this.personalized,this.introduction,this.experience,this.gold,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}

  
@JsonSerializable()
  class Comment extends Object with _$CommentSerializerMixin{

  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: 'CreateUserNo')
  String createUserNo;

  @JsonKey(name: 'NewsId')
  int newsId;

  @JsonKey(name: 'CommentId')
  int commentId;

  @JsonKey(name: 'ReCommentId')
  int reCommentId;

  @JsonKey(name: 'Content')
  String content;

  @JsonKey(name: 'CommentType')
  int commentType;

  @JsonKey(name: 'CreateDate')
  String createDate;

  Comment(this.id,this.createUserNo,this.newsId,this.commentId,this.reCommentId,this.content,this.commentType,this.createDate,);

  factory Comment.fromJson(Map<String, dynamic> srcJson) => _$CommentFromJson(srcJson);

}

  
@JsonSerializable()
  class ReCommentList extends Object with _$ReCommentListSerializerMixin{

  @JsonKey(name: 'User')
  User user;

  @JsonKey(name: 'User_Re')
  User_Re userRe;

  @JsonKey(name: 'Comment')
  Comment comment;

  @JsonKey(name: 'CreateDatetime_Text')
  String createDatetimeText;

  ReCommentList(this.user,this.userRe,this.comment,this.createDatetimeText,);

  factory ReCommentList.fromJson(Map<String, dynamic> srcJson) => _$ReCommentListFromJson(srcJson);

}
  
@JsonSerializable()
  class User_Re extends Object with _$User_ReSerializerMixin{

  @JsonKey(name: 'UserNo')
  String userNo;

  @JsonKey(name: 'HeadPortrait')
  String headPortrait;

  @JsonKey(name: 'NickName')
  String nickName;

  @JsonKey(name: 'Gender')
  String gender;

  @JsonKey(name: 'Mobile')
  String mobile;

  @JsonKey(name: 'Email')
  String email;

  @JsonKey(name: 'Personalized')
  String personalized;

  @JsonKey(name: 'Introduction')
  String introduction;

  @JsonKey(name: 'Experience')
  int experience;

  @JsonKey(name: 'Gold')
  int gold;

  User_Re(this.userNo,this.headPortrait,this.nickName,this.gender,this.mobile,this.email,this.personalized,this.introduction,this.experience,this.gold,);

  factory User_Re.fromJson(Map<String, dynamic> srcJson) => _$User_ReFromJson(srcJson);

}


