// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinReceipt _$CoinReceiptFromJson(Map<String, dynamic> json) => CoinReceipt(
      type: json['type'] as String?,
      value: json['value'] as num?,
      count: json['count'] as num?,
    );

Map<String, dynamic> _$CoinReceiptToJson(CoinReceipt instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
      'count': instance.count,
    };
