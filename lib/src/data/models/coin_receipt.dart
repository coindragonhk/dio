import 'package:json_annotation/json_annotation.dart';

part 'coin_receipt.g.dart';

@JsonSerializable()
class CoinReceipt {
  String? type;
  num? value;
  num? count;

  CoinReceipt({this.type, this.value, this.count});

  factory CoinReceipt.fromJson(Map<String, dynamic> json) {
    return _$CoinReceiptFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoinReceiptToJson(this);
}
