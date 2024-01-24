import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'timestamp_converter.dart';

part 'referrals_data.g.dart';

@JsonSerializable()
class ReferralsData {
  @TimestampConverter()
  final DateTime? dateRedeemed;
  @TimestampConverter()
  final DateTime? date_created;
  int txPts;
  int txVal;
  String uid;

  ReferralsData({
    this.dateRedeemed,
    this.date_created,
    required this.txPts,
    required this.txVal,
    required this.uid,
  });

  factory ReferralsData.fromJson(Map<String, dynamic> json) {
    return _$ReferralsDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReferralsDataToJson(this);
}
