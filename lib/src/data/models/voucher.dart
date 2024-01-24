import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtg_web_admin/src/data/models/timestamp_converter.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher.g.dart';

@JsonSerializable()
class Voucher extends Equatable {
  @TimestampConverter()
  final DateTime? expiry;
  @TimestampConverter()
  final DateTime? localTime;
  final String? logoAsset;
  final String? logoAssetPath;
  final String? region;
  final String? titleEN;
  final String? titleCH;
  final String? voucherNumber;
  final String? voucherStatus;
  @JsonKey(name: "voucherURL")
  final String? voucherUrl;
  final num? voucherValue;

  const Voucher(
      {this.expiry,
      this.localTime,
      this.logoAsset,
      this.logoAssetPath,
      this.region,
      this.titleEN,
      this.titleCH,
      this.voucherNumber,
      this.voucherStatus,
      this.voucherUrl,
      this.voucherValue});

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return _$VoucherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VoucherToJson(this);

  @override
  List<Object?> get props => [
        expiry,
        localTime,
        logoAsset,
        logoAssetPath,
        region,
        titleEN,
        titleCH,
        voucherNumber,
        voucherUrl,
        voucherValue
      ];
}
