// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      expiry: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiry'], const TimestampConverter().fromJson),
      localTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['localTime'], const TimestampConverter().fromJson),
      logoAsset: json['logoAsset'] as String?,
      logoAssetPath: json['logoAssetPath'] as String?,
      region: json['region'] as String?,
      titleEN: json['titleEN'] as String?,
      titleCH: json['titleCH'] as String?,
      voucherNumber: json['voucherNumber'] as String?,
      voucherStatus: json['voucherStatus'] as String?,
      voucherUrl: json['voucherURL'] as String?,
      voucherValue: json['voucherValue'] as num?,
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'expiry': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiry, const TimestampConverter().toJson),
      'localTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.localTime, const TimestampConverter().toJson),
      'logoAsset': instance.logoAsset,
      'logoAssetPath': instance.logoAssetPath,
      'region': instance.region,
      'titleEN': instance.titleEN,
      'titleCH': instance.titleCH,
      'voucherNumber': instance.voucherNumber,
      'voucherStatus': instance.voucherStatus,
      'voucherURL': instance.voucherUrl,
      'voucherValue': instance.voucherValue,
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
