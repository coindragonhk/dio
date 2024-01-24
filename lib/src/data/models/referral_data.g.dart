// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralData _$ReferralDataFromJson(Map<String, dynamic> json) => ReferralData(
      date_created: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      email: json['email'] as String?,
      hash_id: json['hash_id'] as String?,
      referrer_id: json['referrer_id'] as String?,
      reward_points: json['reward_points'] as String?,
      total_referrals: json['total_referrals'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$ReferralDataToJson(ReferralData instance) =>
    <String, dynamic>{
      'date_created': instance.date_created?.toIso8601String(),
      'email': instance.email,
      'hash_id': instance.hash_id,
      'referrer_id': instance.referrer_id,
      'reward_points': instance.reward_points,
      'total_referrals': instance.total_referrals,
      'uid': instance.uid,
    };
