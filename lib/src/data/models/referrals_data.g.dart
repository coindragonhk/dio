// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralsData _$ReferralsDataFromJson(Map<String, dynamic> json) =>
    ReferralsData(
      dateRedeemed: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['dateRedeemed'], const TimestampConverter().fromJson),
      date_created: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['date_created'], const TimestampConverter().fromJson),
      txPts: json['txPts'] as int,
      txVal: json['txVal'] as int,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$ReferralsDataToJson(ReferralsData instance) =>
    <String, dynamic>{
      'dateRedeemed': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateRedeemed, const TimestampConverter().toJson),
      'date_created': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.date_created, const TimestampConverter().toJson),
      'txPts': instance.txPts,
      'txVal': instance.txVal,
      'uid': instance.uid,
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
