// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zi_xun_show_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZiXunShowProductModel _$ZiXunShowProductModelFromJson(
    Map<String, dynamic> json) {
  return   ZiXunShowProductModel(
      json['Code'] as int,
      (json['DataList'] as List)
          ?.map((e) => e == null
              ? null
              :   DataList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['TotalCount'] as int);
}

abstract class _$ZiXunShowProductModelSerializerMixin {
  int get code;
  List<DataList> get dataList;
  int get totalCount;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Code': code,
        'DataList': dataList,
        'TotalCount': totalCount
      };
}

DataList _$DataListFromJson(Map<String, dynamic> json) {
  return   DataList(
      json['SpotTypes'] == null
          ? null
          :   SpotTypes.fromJson(json['SpotTypes'] as Map<String, dynamic>),
      json['IsFollow'] as int,
      (json['SpotTypesList'] as List)
          ?.map((e) => e == null
              ? null
              :   SpotTypesList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$DataListSerializerMixin {
  SpotTypes get spotTypes;
  int get isFollow;
  List<SpotTypesList> get spotTypesList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'SpotTypes': spotTypes,
        'IsFollow': isFollow,
        'SpotTypesList': spotTypesList
      };
}

SpotTypes _$SpotTypesFromJson(Map<String, dynamic> json) {
  return   SpotTypes(
      json['Id'] as int,
      json['TypeName'] as String,
      json['ParentID'] as int,
      json['LevelType'] as int,
      json['OrderIndex'] as int);
}

abstract class _$SpotTypesSerializerMixin {
  int get id;
  String get typeName;
  int get parentID;
  int get levelType;
  int get orderIndex;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'TypeName': typeName,
        'ParentID': parentID,
        'LevelType': levelType,
        'OrderIndex': orderIndex
      };
}

SpotTypesList _$SpotTypesListFromJson(Map<String, dynamic> json) {
  return   SpotTypesList(
      json['SpotTypes'] == null
          ? null
          :   SpotTypes.fromJson(json['SpotTypes'] as Map<String, dynamic>),
      json['IsFollow'] as int);
}

abstract class _$SpotTypesListSerializerMixin {
  SpotTypes get spotTypes;
  int get isFollow;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'SpotTypes': spotTypes, 'IsFollow': isFollow};
}
