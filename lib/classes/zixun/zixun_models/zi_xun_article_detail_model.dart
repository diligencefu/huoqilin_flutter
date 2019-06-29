import 'package:json_annotation/json_annotation.dart'; 
  
part 'zi_xun_article_detail_model.g.dart';


@JsonSerializable()
  class ZiXunArticleDetailModel extends Object with _$ZiXunArticleDetailModelSerializerMixin{

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'TotalCount')
  int totalCount;

  @JsonKey(name: 'Data1')
  Data1 data1;

  @JsonKey(name: 'Data2')
  int data2;

  @JsonKey(name: 'Data3')
  int data3;

  ZiXunArticleDetailModel(this.code,this.totalCount,this.data1,this.data2,this.data3,);

  ZiXunArticleDetailModel.instence();

  factory ZiXunArticleDetailModel.fromJson(Map<String, dynamic> srcJson) => _$ZiXunArticleDetailModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Data1 extends Object with _$Data1SerializerMixin{

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

  @JsonKey(name: 'CoverImgUrl2')
  String coverImgUrl2;

  @JsonKey(name: 'CoverImgUrl3')
  String coverImgUrl3;

  @JsonKey(name: 'IsFile')
  int isFile;

  @JsonKey(name: 'FileUrl')
  String fileUrl;

  @JsonKey(name: 'AuthorId')
  int authorId;

  @JsonKey(name: 'Author')
  String author;

  @JsonKey(name: 'ProductIds')
  String productIds;

  @JsonKey(name: 'ProductNames')
  String productNames;

  @JsonKey(name: 'Summary')
  String summary;

  @JsonKey(name: 'Content')
  String content;

  @JsonKey(name: 'ContentText')
  String contentText;

  @JsonKey(name: 'Source')
  int source;

  @JsonKey(name: 'SourceWebsite')
  String sourceWebsite;

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

  Data1(this.id,this.zXType,this.blockType,this.typeId,this.businessId,this.productId,this.isCoverImg,this.coverImgType,this.coverImgUrl,this.coverImgUrl2,this.coverImgUrl3,this.isFile,this.fileUrl,this.authorId,this.author,this.productIds,this.productNames,this.summary,this.content,this.contentText,this.source,this.sourceWebsite,this.referenceId,this.visitorsNum,this.moNiViewCount,this.delete,this.state,this.createTime,this.modifyTime,this.commentCount,this.upCount,this.viewCount,);

  factory Data1.fromJson(Map<String, dynamic> srcJson) => _$Data1FromJson(srcJson);

}

  
