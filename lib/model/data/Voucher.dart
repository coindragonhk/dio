import 'package:flutter/cupertino.dart';

class VoucherTx {
  final String txId; //MOBO-UID-100x   | kiosk's txId (for topups)
  final String uid; //for getting all tx's belonging to user
  final String yyyymm; //cd internal year and month code
  final DateTime localTime;
  final DateTime expiryDate;
  final String vendorCode;
  final String currency; // HKD / SGD
  final num value; //total value
  final num ptValue;
  final num qty;
  final num voucherUnit; //50 / 100 / 250 / 500
  final String itemDescription; //deliveroo / foodpanda / hktvmall
  final String queryId;

  VoucherTx({
    required this.txId,
    required this.yyyymm,
    required this.uid,
    required this.localTime,
    required this.vendorCode,
    required this.currency,
    required this.value,
    required this.ptValue,
    required this.qty,
    required this.voucherUnit,
    required this.itemDescription,
    required this.queryId,
    required this.expiryDate,
    //required this.voucherCodes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoucherTx &&
          txId == other.txId &&
          uid == other.uid &&
          yyyymm == other.yyyymm &&
          localTime == other.localTime &&
          expiryDate == other.expiryDate &&
          currency == other.currency &&
          value == other.value &&
          ptValue == other.ptValue &&
          qty == other.qty &&
          itemDescription == other.itemDescription &&
          voucherUnit == other.voucherUnit &&
          queryId == other.queryId &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => txId.hashCode ^ itemDescription.hashCode ^ uid.hashCode;

  VoucherTx.fromJson(Map<String, Object?> json)
      : this(
          txId: json['txId']! as String,
          uid: json['uid']! as String,
          yyyymm: json['yyyymm']! as String,
          localTime: json['localTime']! as DateTime,
          expiryDate: json['expiryDate']! as DateTime,
          vendorCode: json['vendorCode']! as String,
          currency: json['currency']! as String,
          value: json['value']! as num,
          ptValue: json['ptValue']! as num,
          qty: json['qty']! as num,
          itemDescription: json['itemDescription']! as String,
          voucherUnit: json['voucherUnit']! as num,
          queryId: json['queryId']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'txId': txId,
      'yyyymm': yyyymm,
      'uid': uid,
      'localTime': localTime,
      'expiryDate': expiryDate,
      'vendorCode': vendorCode,
      'currency': currency,
      'value': value,
      'ptValue': ptValue,
      'qty': qty,
      'itemDescription': itemDescription,
      'voucherUnit': voucherUnit,
      'queryId': queryId,
      //'voucherCodes': voucherCodes,
      //runtimeType: runtimeType,
    };
  }
}

/*
class VoucherTxList {
  final List<VoucherTx> vouchers;
  VoucherTxList({
    required this.vouchers,
  });
  factory VoucherTxList.fromJson(List<dynamic> jsonList) {
    return VoucherTxList(
      vouchers: jsonList.map((voucher) => VoucherTx.fromJson(voucher)).toList(),
    );
  }
}*/

//From BHN-format Voucher Catalog
class Voucher {
  final bool enabled;
  final num order;
  final String title;
  final String bgAsset;
  final String logoAsset;
  final String imageAsset;
  final String queryId;
  final String productDetailsEN;
  final String productDetailsCH;
  final String productTitleEN;
  final String productTitleCH;
  final String vendorCode;
  final num voucherUnit;
  final dynamic response;
  final dynamic lastUpdated;

  Voucher({
    required this.enabled,
    required this.order,
    required this.title,
    required this.bgAsset,
    required this.logoAsset,
    required this.imageAsset,
    required this.voucherUnit,
    required this.productTitleCH,
    required this.productTitleEN,
    required this.productDetailsCH,
    required this.productDetailsEN,
    required this.queryId,
    required this.lastUpdated,
    required this.vendorCode,
    required this.response,
  });

  Voucher.fromJson(Map<String, Object?> json)
      : this(
          enabled: json['enabled'] as bool,
          order: json['order'] as num,
          title: json['title'] as String,
          productTitleCH: json['productTitleCH'] as String,
          productTitleEN: json['productTitleEN'] as String,
          productDetailsCH: json['productDetailsCH'] as String,
          productDetailsEN: json['productDetailsEN'] as String,
          voucherUnit: json['voucherUnit'] as num,
          bgAsset: json['bgAsset'] as String,
          logoAsset: json['logoAsset'] as String,
          imageAsset: json['imageAsset'] as String,
          queryId: json['queryId']! as String,
          lastUpdated: json['lastUpdated']! as dynamic,
          vendorCode: json['vendorCode']! as String,
          response: json['response']! as dynamic,
        );

  Map<String, Object?> toJson() {
    return {
      'order': order,
      'enabled': enabled,
      'title': title,
      'bgAsset': bgAsset,
      'logoAsset': logoAsset,
      'imageAsset': imageAsset,
      'productTitleCH': productTitleCH,
      'productTitleEN': productTitleEN,
      'productDetailsCH': productDetailsCH,
      'productDetailsEN': productDetailsEN,
      'voucherUnit': voucherUnit,
      'vendorCode': vendorCode,
      'queryId': queryId,
      'response': response,
      'lastUpdated': lastUpdated,
    };
  }
}
