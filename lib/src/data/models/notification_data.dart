import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'timestamp_converter.dart';

part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData {
  String? id;
  final String? bodyCh;
  final String? bodyEn;
  final String? titleCh;
  final String? titleEn;
  @TimestampConverter()
  final DateTime? updatedAt;
  @TimestampConverter()
  final DateTime? createdAt;
  bool? isRead;
  bool? isExpand;

  NotificationData({
    this.id,
    this.bodyCh,
    this.bodyEn,
    this.titleCh,
    this.titleEn,
    this.updatedAt,
    this.createdAt,
    this.isRead,
    this.isExpand,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return _$NotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}
