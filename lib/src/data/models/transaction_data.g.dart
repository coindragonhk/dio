// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) =>
    TransactionData(
      mode: json['mode'] as String?,
      type: json['type'] as String?,
      localTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['localTime'], const TimestampConverter().fromJson),
      txId: json['txId'] as String?,
      value: json['value'] as num?,
      points: json['points'] as num?,
      currency: json['currency'] as String?,
      yyyymm: json['yyyymm'] as String?,
      queryId: json['queryId'] as String?,
      uid: json['uid'] as String?,
      expiryDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiryDate'], const TimestampConverter().fromJson),
      vendorCode: json['vendorCode'] as String?,
      qty: json['qty'] as num?,
      voucherUnit: json['voucherUnit'] as num?,
      itemDescription: json['itemDescription'] as String?,
    );

Map<String, dynamic> _$TransactionDataToJson(TransactionData instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'type': instance.type,
      'localTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.localTime, const TimestampConverter().toJson),
      'txId': instance.txId,
      'value': instance.value,
      'points': instance.points,
      'currency': instance.currency,
      'yyyymm': instance.yyyymm,
      'queryId': instance.queryId,
      'uid': instance.uid,
      'expiryDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiryDate, const TimestampConverter().toJson),
      'vendorCode': instance.vendorCode,
      'qty': instance.qty,
      'voucherUnit': instance.voucherUnit,
      'itemDescription': instance.itemDescription,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
