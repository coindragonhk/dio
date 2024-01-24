import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  final String id;
  final String encryptedToken;
  final num points; // x10
  final num balance; // real value
  final num voucherTxCount;
  final num unreadMsgCount;
  final bool? enabled;
  Timestamp? dateCreated;
  Timestamp? lastUpdated;

  Wallet({
    required this.id,
    required this.encryptedToken,
    required this.voucherTxCount,
    required this.unreadMsgCount,
    required this.balance,
    required this.points,
    this.enabled,
    this.dateCreated,
    this.lastUpdated,
  });

  factory Wallet.initial() {
    return Wallet(
      id: "INITIAL",
      encryptedToken: "", //email (encrypted)
      unreadMsgCount: 0,
      voucherTxCount: 0,
      balance: 0.0,
      points: 0.0,
      enabled: true,
      dateCreated: Timestamp.now(),
      lastUpdated: Timestamp.now(),
    );
  }

  factory Wallet.returnCopy(
      String id,
      String encToken,
      num vtxCount,
      num unreadMsg,
      num balance,
      num pts,
      Timestamp? dateCreated,
      Timestamp? lastUpdated,
      bool? enabled) {
    return Wallet(
        id: id,
        encryptedToken: encToken,
        voucherTxCount: vtxCount,
        unreadMsgCount: unreadMsg,
        balance: balance,
        points: pts,
        enabled: enabled,
        dateCreated: dateCreated,
        lastUpdated: lastUpdated);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wallet &&
          id == other.id &&
          encryptedToken == other.encryptedToken &&
          voucherTxCount == other.voucherTxCount &&
          unreadMsgCount == other.unreadMsgCount &&
          balance == other.balance &&
          points == other.points &&
          dateCreated == other.dateCreated &&
          lastUpdated == other.lastUpdated &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => id.hashCode ^ points.hashCode ^ balance.hashCode;

  Wallet.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          encryptedToken: json['encryptedToken'] != null
              ? json['encryptedToken']! as String
              : "",
          //txHistory: (json['txHistory']! as List).cast<TxEntry>(),
          //vouchers: (json['vouchers']! as List).cast<VoucherTx>(),
          points: json['points']! as num,
          balance: json['balance']! as num,
          voucherTxCount: json['voucherTxCount']! as num,
          unreadMsgCount: json['unreadMsgCount']! as num,
          enabled: json['enabled'] != null ? json['enabled']! as bool : null,
          dateCreated: json['dateCreated'] != null
              ? json['dateCreated'] as Timestamp
              : null,
          lastUpdated: json['lastUpdated'] != null
              ? json['lastUpdated'] as Timestamp
              : null,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'encryptedToken': encryptedToken,
      'balance': balance,
      'points': points,
      'voucherTxCount': voucherTxCount,
      'unreadMsgCount': unreadMsgCount,
      'enabled': enabled,
      'dateCreated': dateCreated,
      'lastUpdated': lastUpdated,
    };
  }
}
