// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPResponse _$PPResponseFromJson(Map<String, dynamic> json) => PPResponse(
      name: json['name'] as String?,
      entryEN: json['entryEN'] as String?,
      entryZH: json['entryZH'] as String?,
      entryTH: json['entryTH'] as String?,
      headerZH: json['headerZH'] as String?,
      headerEN: json['headerEN'] as String?,
      headerTH: json['headerTH'] as String?,
    )..order = json['order'] as num?;

Map<String, dynamic> _$PPResponseToJson(PPResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'entryZH': instance.entryZH,
      'entryEN': instance.entryEN,
      'entryTH': instance.entryTH,
      'headerZH': instance.headerZH,
      'headerEN': instance.headerEN,
      'headerTH': instance.headerTH,
    };
