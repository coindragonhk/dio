// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayOptions _$PayOptionsFromJson(Map<String, dynamic> json) => PayOptions(
      status: json['status'] as String?,
      surcharge: json['surcharge'] as num?,
    );

Map<String, dynamic> _$PayOptionsToJson(PayOptions instance) =>
    <String, dynamic>{
      'status': instance.status,
      'surcharge': instance.surcharge,
    };
