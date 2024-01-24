import 'package:flutter/cupertino.dart';

class MessageT {
  final String msgId;
  final String msgType;
  final String msgIcon;
  final String msgTitleCH;
  final String msgTitleEN;
  final String msgBodyCH;
  final String msgBodyEN;
  final String imgAssetPath;

  MessageT({
    required this.msgId,
    required this.msgType,
    required this.msgIcon,
    required this.msgTitleCH,
    required this.msgTitleEN,
    required this.msgBodyCH,
    required this.msgBodyEN,
    required this.imgAssetPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageT &&
          msgId == other.msgId &&
          msgType == other.msgType &&
          msgIcon == other.msgIcon &&
          msgTitleCH == other.msgTitleCH &&
          msgTitleEN == other.msgTitleEN &&
          msgBodyCH == other.msgBodyCH &&
          msgBodyEN == other.msgBodyEN &&
          imgAssetPath == other.imgAssetPath &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => msgTitleEN.hashCode ^ msgId.hashCode;

  MessageT.fromJson(Map<String, Object?> json)
      : this(
          msgId: json['msgId']! as String,
          msgType: json['msgType']! as String,
          msgIcon: json['msgIcon']! as String,
          msgTitleCH: json['msgTitleCH']! as String,
          msgTitleEN: json['msgTitleEN']! as String,
          msgBodyCH: json['msgBodyCH']! as String,
          msgBodyEN: json['msgBodyEN']! as String,
          imgAssetPath: json['imgAssetPath']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'msgId': msgId,
      'msgType': msgType,
      'msgIcon': msgIcon,
      'msgTitleCH': msgTitleCH,
      'msgTitleEN': msgTitleEN,
      'msgBodyCH': msgBodyCH,
      'msgBodyEN': msgBodyEN,
      'imgAssetPath': imgAssetPath,
    };
  }
}
