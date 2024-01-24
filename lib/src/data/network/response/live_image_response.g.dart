// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveImageResponse _$LiveImageResponseFromJson(Map<String, dynamic> json) =>
    LiveImageResponse(
      assetPath: json['assetPath'] as String?,
      assetPathEN: json['assetPathEN'] as String?,
      assetPathCH: json['assetPathCH'] as String?,
      assetPathTH: json['assetPathTH'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LiveImageResponseToJson(LiveImageResponse instance) =>
    <String, dynamic>{
      'assetPathCH': instance.assetPathCH,
      'assetPathEN': instance.assetPathEN,
      'assetPathTH': instance.assetPathTH,
      'assetPath': instance.assetPath,
      'name': instance.name,
    };
