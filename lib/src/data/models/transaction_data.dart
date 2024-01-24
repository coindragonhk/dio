import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'timestamp_converter.dart';

part 'transaction_data.g.dart';

@JsonSerializable()
class TransactionData {
  //mandatory fields
  final String? mode; //PRODUCTION / QA
  final String? type; //coin-in / note-in / foreign-in / coupon-out / credit-in / donation-out
  @TimestampConverter()
  final DateTime? localTime;
  final String? txId; //MOBO-hash-tx#  | kiosk's txId (for topups)
  final num? value; //total value
  final num? points; //point value
  final String? currency; // HKD / SGD
  final String? yyyymm; //cd internal year and month code
  final String? queryId; //coupon-out / other cross-ref DB

  //coupon-out specific
  String? uid; //for getting all tx's belonging to user
  @TimestampConverter()
  DateTime? expiryDate; //coupon-out
  String? vendorCode; //coupon-out
  num? qty; //number of coupons in this tx
  num? voucherUnit; //50 / 100 / 250 / 500
  String? itemDescription; //deliveroo / foodpanda / hktvmall

  TransactionData({
     this.mode,
     this.type,
     this.localTime,
     this.txId,
     this.value,
     this.points,
     this.currency,
     this.yyyymm,
     this.queryId,
    this.uid,
    this.expiryDate,
    this.vendorCode,
    this.qty,
    this.voucherUnit,
    this.itemDescription,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return _$TransactionDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionDataToJson(this);
}
