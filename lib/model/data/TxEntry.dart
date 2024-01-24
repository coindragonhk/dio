import 'package:cloud_firestore/cloud_firestore.dart';

class TxEntry {
  //mandatory fields
  final String mode; //PRODUCTION / QA
  final String
      type; //coin-in / note-in / foreign-in / coupon-out / credit-in / donation-out
  final Timestamp localTime;
  final String txId; //MOBO-hash-tx#  | kiosk's txId (for topups)
  final num value; //total value
  final num points; //point value
  final String currency; // HKD / SGD
  final String yyyymm; //cd internal year and month code
  final String queryId; //coupon-out / other cross-ref DB

  //coupon-out specific
  String? uid; //for getting all tx's belonging to user
  Timestamp? expiryDate; //coupon-out
  String? vendorCode; //coupon-out
  num? qty; //number of coupons in this tx
  num? voucherUnit; //50 / 100 / 250 / 500
  String? itemDescription; //deliveroo / foodpanda / hktvmall

  TxEntry({
    required this.mode,
    required this.type,
    required this.localTime,
    required this.txId,
    required this.value,
    required this.points,
    required this.currency,
    required this.yyyymm,
    required this.queryId,
    this.uid,
    this.expiryDate,
    this.vendorCode,
    this.qty,
    this.voucherUnit,
    this.itemDescription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TxEntry &&
          mode == other.mode &&
          type == other.type &&
          localTime == other.localTime &&
          txId == other.txId &&
          value == other.value &&
          points == other.points &&
          currency == other.currency &&
          yyyymm == other.yyyymm &&
          queryId == other.queryId &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => txId.hashCode ^ type.hashCode;

  TxEntry.fromJson(Map<String, Object?> json)
      : this(
          mode: json['mode']! as String,
          type: json['type']! as String,
          localTime: json['localTime']! as Timestamp,
          txId: json['txId']! as String,
          value: json['value']! as num,
          points: json['points']! as num,
          currency: json['currency']! as String,
          yyyymm: json['yyyymm']! as String,
          queryId: json['queryId']! as String,
          uid: json.containsKey('uid') ? json['uid'] as String : null,
          expiryDate: json.containsKey('expiryDate')
              ? json['expiryDate'] as Timestamp
              : null,
          vendorCode: json.containsKey('vendorCode')
              ? json['vendorCode'] as String
              : null,
          qty: json.containsKey('qty') ? json['qty'] as num : null,
          voucherUnit: json.containsKey('voucherUnit')
              ? json['voucherUnit'] as num
              : null,
          itemDescription: json.containsKey('itemDescription')
              ? json['itemDescription'] as String
              : null,
        );

  Map<String, Object?> toJson() {
    return type == 'coupon-out'
        ? {
            'mode': mode,
            'type': type,
            'localTime': localTime,
            'txId': txId,
            'value': value,
            'points': points,
            'currency': currency,
            'yyyymm': yyyymm,
            'queryId': queryId,
            'uid': uid,
            'expiryDate': expiryDate,
            'vendorCode': vendorCode,
            'qty': qty,
            'voucherUnit': voucherUnit,
            'itemDescription': itemDescription,
            //runtimeType: runtimeType,
          }
        : {
            'mode': mode,
            'type': type,
            'localTime': localTime,
            'txId': txId,
            'value': value,
            'points': points,
            'currency': currency,
            'yyyymm': yyyymm,
            'queryId': queryId,
          };
  }
}
