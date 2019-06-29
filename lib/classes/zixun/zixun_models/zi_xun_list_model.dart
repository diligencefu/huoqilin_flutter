import 'package:json_annotation/json_annotation.dart'; 
  
part 'zi_xun_list_model.g.dart';


@JsonSerializable()
  class ZiXunListModel extends Object with _$ZiXunListModelSerializerMixin{

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'TotalCount')
  int totalCount;

  @JsonKey(name: 'Data1')
  List<Data1> data1;

  @JsonKey(name: 'Data2')
  int data2;

  ZiXunListModel(this.code,this.totalCount,this.data1,this.data2,);

  factory ZiXunListModel.fromJson(Map<String, dynamic> srcJson) => _$ZiXunListModelFromJson(srcJson);

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

  Data1(this.id,this.zXType,this.blockType,this.typeId,this.businessId,this.productId,this.isCoverImg,this.coverImgType,this.coverImgUrl,this.isFile,this.fileUrl,this.title,this.authorId,this.author,this.summary,this.source,this.sourceWebsite,this.url,this.referenceId,this.visitorsNum,this.moNiViewCount,this.delete,this.state,this.createTime,this.modifyTime,this.commentCount,this.upCount,this.viewCount,);

  factory Data1.fromJson(Map<String, dynamic> srcJson) => _$Data1FromJson(srcJson);

}

  
