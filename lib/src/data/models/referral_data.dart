import 'package:json_annotation/json_annotation.dart';

part 'referral_data.g.dart';

@JsonSerializable()
class ReferralData {
  DateTime? date_created;
  String? email;
  String? hash_id;
  String? referrer_id;
  String? reward_points;
  String? total_referrals;
  String? uid;

  ReferralData({required this.date_created, required this.email, this.hash_id, this.referrer_id, this.reward_points, this.total_referrals, this.uid});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ReferralData.fromJson(Map<String, dynamic> json) =>
      _$ReferralDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralDataToJson(this);
}
