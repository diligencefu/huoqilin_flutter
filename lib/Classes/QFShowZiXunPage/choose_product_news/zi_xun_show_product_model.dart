import 'package:json_annotation/json_annotation.dart'; 
  
part 'zi_xun_show_product_model.g.dart';


@JsonSerializable()
  class ZiXunShowProductModel extends Object with _$ZiXunShowProductModelSerializerMixin{

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'DataList')
  List<DataList> dataList;

  @JsonKey(name: 'TotalCount')
  int totalCount;

  ZiXunShowProductModel(this.code,this.dataList,this.totalCount,);

  factory ZiXunShowProductModel.fromJson(Map<String, dynamic> srcJson) => _$ZiXunShowProductModelFromJson(srcJson);

}

  
@JsonSerializable()
  class DataList extends Object with _$DataListSerializerMixin{

  @JsonKey(name: 'SpotTypes')
  SpotTypes spotTypes;

  @JsonKey(name: 'IsFollow')
  int isFollow;

  @JsonKey(name: 'SpotTypesList')
  List<SpotTypesList> spotTypesList;

  DataList(this.spotTypes,this.isFollow,this.spotTypesList,);

  factory DataList.fromJson(Map<String, dynamic> srcJson) => _$DataListFromJson(srcJson);

}

  
@JsonSerializable()
  class SpotTypes extends Object with _$SpotTypesSerializerMixin{

  @JsonKey(name: 'Id')
  int id;

  @JsonKey(name: 'TypeName')
  String typeName;

  @JsonKey(name: 'ParentID')
  int parentID;

  @JsonKey(name: 'LevelType')
  int levelType;

  @JsonKey(name: 'OrderIndex')
  int orderIndex;

  SpotTypes(this.id,this.typeName,this.parentID,this.levelType,this.orderIndex,);

  factory SpotTypes.fromJson(Map<String, dynamic> srcJson) => _$SpotTypesFromJson(srcJson);

}

  
@JsonSerializable()
  class SpotTypesList extends Object with _$SpotTypesListSerializerMixin{

  @JsonKey(name: 'SpotTypes')
  SpotTypes spotTypes;

  @JsonKey(name: 'IsFollow')
  int isFollow;

  SpotTypesList(this.spotTypes,this.isFollow,);

  factory SpotTypesList.fromJson(Map<String, dynamic> srcJson) => _$SpotTypesListFromJson(srcJson);

}


  
