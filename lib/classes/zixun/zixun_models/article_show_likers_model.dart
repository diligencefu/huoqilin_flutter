import 'package:json_annotation/json_annotation.dart'; 
  
part 'article_show_likers_model.g.dart';


@JsonSerializable()
  class ArticleShowLikersModel extends Object with _$ArticleShowLikersModelSerializerMixin{

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'TotalCount')
  int totalCount;

  @JsonKey(name: 'Data1')
  List<Data1> data1;

  @JsonKey(name: 'Data2')
  int data2;
ArticleShowLikersModel.instence();

  ArticleShowLikersModel(this.code,this.totalCount,this.data1,this.data2,);

  factory ArticleShowLikersModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleShowLikersModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Data1 extends Object with _$Data1SerializerMixin{

  @JsonKey(name: 'User')
  User user;

  @JsonKey(name: 'Up')
  Up up;

  @JsonKey(name: 'CreateDatetime_Text')
  String createDatetimeText;

  @JsonKey(name: 'Dynamic')
  Dynamic dynamic1;

  Data1(this.user,this.up,this.createDatetimeText,this.dynamic1,);

  factory Data1.fromJson(Map<String, dynamic> srcJson) => _$Data1FromJson(srcJson);

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
  class Up extends Object with _$UpSerializerMixin{

  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: 'CreateUserNo')
  String createUserNo;

  @JsonKey(name: 'RefId')
  int refId;

  @JsonKey(name: 'UpType')
  int upType;

  @JsonKey(name: 'CreateDate')
  String createDate;

  Up(this.id,this.createUserNo,this.refId,this.upType,this.createDate,);

  factory Up.fromJson(Map<String, dynamic> srcJson) => _$UpFromJson(srcJson);

}

  
@JsonSerializable()
  class Dynamic extends Object with _$DynamicSerializerMixin{

  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: 'ZXType')
  int zXType;

  @JsonKey(name: 'BlockType')
  int blockType;

  @JsonKey(name: 'TypeId')
  int typeId;

  @JsonKey(name: 'BusinessId')
  int businessId;

  @JsonKey(name: 'ProductId')
  int productId;

  @JsonKey(name: 'IsCoverImg')
  int isCoverImg;

  @JsonKey(name: 'CoverImgType')
  int coverImgType;

  @JsonKey(name: 'CoverImgUrl')
  String coverImgUrl;

  @JsonKey(name: 'IsFile')
  int isFile;

  @JsonKey(name: 'FileUrl')
  String fileUrl;

  @JsonKey(name: 'Title')
  String title;

  @JsonKey(name: 'AuthorId')
  int authorId;

  @JsonKey(name: 'Author')
  String author;

  @JsonKey(name: 'Summary')
  String summary;

  @JsonKey(name: 'Source')
  int source;

  @JsonKey(name: 'SourceWebsite')
  String sourceWebsite;

  @JsonKey(name: 'Url')
  String url;

  @JsonKey(name: 'ReferenceId')
  String referenceId;

  @JsonKey(name: 'VisitorsNum')
  int visitorsNum;

  @JsonKey(name: 'MoNiViewCount')
  int moNiViewCount;

  @JsonKey(name: 'Delete')
  int delete;

  @JsonKey(name: 'State')
  int state;

  @JsonKey(name: 'CreateTime')
  String createTime;

  @JsonKey(name: 'ModifyTime')
  String modifyTime;

  @JsonKey(name: 'CommentCount')
  int commentCount;

  @JsonKey(name: 'UpCount')
  int upCount;

  @JsonKey(name: 'ViewCount')
  int viewCount;

  Dynamic(this.id,this.zXType,this.blockType,this.typeId,this.businessId,this.productId,this.isCoverImg,this.coverImgType,this.coverImgUrl,this.isFile,this.fileUrl,this.title,this.authorId,this.author,this.summary,this.source,this.sourceWebsite,this.url,this.referenceId,this.visitorsNum,this.moNiViewCount,this.delete,this.state,this.createTime,this.modifyTime,this.commentCount,this.upCount,this.viewCount,);

  factory Dynamic.fromJson(Map<String, dynamic> srcJson) => _$DynamicFromJson(srcJson);

}

  
