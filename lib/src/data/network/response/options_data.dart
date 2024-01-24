// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/src/data/models/pay_options.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:dtg_web_admin/src/utils/const.dart';

import '../../../../res/R.dart';

part 'options_data.g.dart';

@JsonSerializable()
class OptionsData {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "logoAsset")
  String? logoAsset;
  @JsonKey(name: "logoAssetPath")
  String? logoAssetPath;
  @JsonKey(name: "titleCH")
  String? titleCH;
  @JsonKey(name: "titleEN")
  String? titleEN;
  @JsonKey(name: "titleTH")
  String? titleTH;
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "coinFeeTagCH")
  String? coinFeeTagCh;
  @JsonKey(name: "coinFeeTagEN")
  String? coinFeeTagEn;
  @JsonKey(name: "coinFeeTagTH")
  String? coinFeeTagTh;
  @JsonKey(name: "coinLimit")
  num? coinLimit;
  @JsonKey(name: "coinMin")
  num? coinMin;
  @JsonKey(name: "coinRate")
  num? coinRate;
  @JsonKey(name: "noteFeeTagCH")
  String? noteFeeTagCh;
  @JsonKey(name: "noteFeeTagEN")
  String? noteFeeTagEn;
  @JsonKey(name: "noteFeeTagTH")
  String? noteFeeTagTh;
  @JsonKey(name: "noteLimit")
  num? noteLimit;
  @JsonKey(name: "noteMin")
  num? noteMin;
  @JsonKey(name: "noteRate")
  num? noteRate;
  @JsonKey(name: "productTitleEN")
  String? productTitleEn;
  @JsonKey(name: "productTitleCH")
  String? productTitleCh;
  @JsonKey(name: "productTitleTH")
  String? productTitleTh;
  @JsonKey(name: "productDetailsEN")
  String? productDetailsEn;
  @JsonKey(name: "productDetailsTH")
  String? productDetailsTh;
  @JsonKey(name: "productDetailsCH")
  String? productDetailsCh;
  String? termsAndConditionsEN;
  String? termsAndConditionsCH;
  String? termsAndConditionsTH;
  String? descEN;
  String? descCH;
  String? descTH;
  num? voucherUnit;
  String? vendorCode;
  String? vendorType;
  String? queryId;
  String? website;
  int? yearFounded;
  String? email;
  num? webSeq;
  num? voucherMin;
  List<OptionsData>? voucherOptions;
  @JsonKey(name: "payOptions")
  Map<String, PayOptions>? paymentOptions;
  num? promotionLevel;
  num? vouchersLeft;
  num? inventoryLimit;
  num? threshold;

  OptionsData({
    this.title,
    this.logoAsset,
    this.logoAssetPath,
    this.titleCH,
    this.titleEN,
    this.titleTH,
    this.id,
    this.coinFeeTagCh,
    this.coinFeeTagEn,
    this.coinFeeTagTh,
    this.coinLimit,
    this.coinMin,
    this.coinRate,
    this.noteFeeTagCh,
    this.noteFeeTagEn,
    this.noteFeeTagTh,
    this.noteLimit,
    this.noteMin,
    this.noteRate,
    this.productTitleEn,
    this.productTitleCh,
    this.productTitleTh,
    this.productDetailsTh,
    this.productDetailsEn,
    this.productDetailsCh,
    this.termsAndConditionsEN,
    this.termsAndConditionsCH,
    this.termsAndConditionsTH,
    this.descEN,
    this.descCH,
    this.descTH,
    this.voucherUnit,
    this.vendorCode,
    this.vendorType,
    this.queryId,
    this.website,
    this.yearFounded,
    this.email,
    this.webSeq,
    this.voucherMin,
    this.voucherOptions,
    this.paymentOptions,
    this.promotionLevel,
    this.vouchersLeft,
    this.inventoryLimit,
    this.threshold,
  });

  factory OptionsData.fromJson(Map<String, dynamic> json) =>
      _$OptionsDataFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsDataToJson(this);

/* String getLogo() {
    return Uri.encodeFull(logoAsset?.trim() ?? "");
  } */

  String getLogo({num width = 0}) {
    String logoPath = logoAssetPath?.trim() ?? "";
    String imgUrl = '${Const.ASSET_BASE_URL}${logoPath}';
    if (width != 0) {
      List<String> strTok = logoPath!.split('.');
      imgUrl = '${Const.ASSET_BASE_URL}${strTok[0]}_W${width}.${strTok[1]}';
    }
    //print('logoPath: ${imgUrl}');

    return Uri.encodeFull(imgUrl);
  }

  /*
  String getLogoRect() {
    return Uri.encodeFull(logoAssetRectangle?.trim() ?? "");
  }*/

  String getDescription() {
    return R.tr(
        en: productDetailsEn ?? descEN,
        ch: productDetailsCh ?? descCH,
        th: productDetailsTh ?? descTH,
        sch: "");
  }

  bool isBankDeposit() {
    switch (id) {
      case "OCTOPUS":
      case "ALIPAY":
      case "TNG":
        return false;
      default:
        return true;
    }
  }

  String getTitleTopUpDialog() {
    switch (id) {
      case "OCTOPUS":
        return R.string.label_octopus_add_value;
      case "ALIPAY":
        return R.string.label_alipayhk_add_value;
      case "TNG":
        return R.string.label_tng_add_value;
      case "TRUEMONEY":
        return R.string.label_truemoney;
      case "RABBIT":
        return R.string.label_rabbit;
      case "RABBITLINEPAY":
        return R.string.label_rabbit_line;
      default:
        return R.string.label_bank_deposit;
    }
  }

  String getDescTopUpDialog() {
    switch (id) {
      case "OCTOPUS":
        return R.string.label_octopus_desc;
      case "ALIPAY":
        return R.string.label_alipay_desc;
      case "TNG":
        return R.string.label_tng_desc;
      case "TRUEMONEY":
        return R.string.label_truemoney_desc;
      case "RABBIT":
        return R.string.label_rabbit_desc;
      case "RABBITLINEPAY":
        return R.string.label_rabbitlinepay_desc;
      default:
        if (Globals.REGION == "TH") {
          return R.string.label_bank_desc_th;
        } else if (Globals.REGION == "SG") {
          return R.string.label_bank_desc_sg;
        }
        return R.string.label_bank_desc_hk;
    }
  }

  String getNoteTopUpDialog() {
    switch (id) {
      case "OCTOPUS":
        return R.string.note_octopus_pop_up;
      case "ALIPAY":
        return R.string.note_alipay_pop_up;
      case "TNG":
        return R.string.note_tng_pop_up;
      default:
        return "";
    }
  }

  String getDescSuffixTopUpDialog() {
    switch (id) {
      case "TNG":
      case "OCTOPUS":
      case "RABBIT":
      case "RABBITLINEPAY":
      case "TRUEMONEY":
        return "";
      case "ALIPAY":
        return R.string.label_2_working_days;
      default:
        return R.string.label_3_working_days;
    }
  }

  String getLogoTopUpDialog() {
    switch (id) {
      case "OCTOPUS":
        return R.drawable.ic_octopus_white;
      case "ALIPAY":
        return R.drawable.img_alipayhk_white_logo;
      case "TNG":
        return R.drawable.img_tng_white_logo;
      case "TRUEMONEY":
        return R.drawable.img_tmn_logo;
      case "RABBIT":
        return R.drawable.img_rabbit_logo;
      case "RABBITLINEPAY":
        return R.drawable.img_rabbitlinepay_logo;
      default:
        return R.drawable.img_bank_white_logo;
    }
  }

  Color getBorderTagColorTopUpDialog() {
    switch (id) {
      case "OCTOPUS":
        return R.color.colorBorderOctopus;
      case "ALIPAY":
        return R.color.colorBorderAliPay;
      case "TNG":
        return R.color.colorBorderTng;
      default:
        return R.color.colorBorderBank;
    }
  }

  OptionsData copyWith({
    String? title,
    String? logoAsset,
    String? logoAssetPath,
    String? titleCH,
    String? titleEN,
    String? titleTH,
    String? id,
    String? coinFeeTagCh,
    String? coinFeeTagEn,
    String? coinFeeTagTh,
    num? coinLimit,
    num? coinMin,
    num? coinRate,
    String? noteFeeTagCh,
    String? noteFeeTagEn,
    String? noteFeeTagTh,
    num? noteLimit,
    num? noteMin,
    num? noteRate,
    String? productTitleEn,
    String? productTitleCh,
    String? productTitleTh,
    String? productDetailsEn,
    String? productDetailsCh,
    String? productDetailsTh,
    String? termsAndConditionsEN,
    String? termsAndConditionsCH,
    String? termsAndConditionsTH,
    String? descEN,
    String? descCH,
    String? descTH,
    num? voucherUnit,
    String? vendorCode,
    String? vendorType,
    String? queryId,
    String? website,
    int? yearFounded,
    String? email,
    num? webSeq,
    num? voucherMin,
    List<OptionsData>? voucherOptions,
    Map<String, PayOptions>? paymentOptions,
    num? promotionLevel,
    num? vouchersLeft,
    num? inventoryLimit,
    num? threshold,
  }) {
    return OptionsData(
      title: title ?? this.title,
      logoAsset: logoAsset ?? this.logoAsset,
      logoAssetPath: logoAssetPath ?? this.logoAssetPath,
      titleCH: titleCH ?? this.titleCH,
      titleEN: titleEN ?? this.titleEN,
      id: id ?? this.id,
      coinFeeTagCh: coinFeeTagCh ?? this.coinFeeTagCh,
      coinFeeTagEn: coinFeeTagEn ?? this.coinFeeTagEn,
      coinLimit: coinLimit ?? this.coinLimit,
      coinMin: coinMin ?? this.coinMin,
      coinRate: coinRate ?? this.coinRate,
      noteFeeTagCh: noteFeeTagCh ?? this.noteFeeTagCh,
      noteFeeTagEn: noteFeeTagEn ?? this.noteFeeTagEn,
      noteLimit: noteLimit ?? this.noteLimit,
      noteMin: noteMin ?? this.noteMin,
      noteRate: noteRate ?? this.noteRate,
      productTitleEn: productTitleEn ?? this.productTitleEn,
      productTitleCh: productTitleCh ?? this.productTitleCh,
      //productTitleTh: productTitleTh ?? this.productTitleTh,
      productDetailsEn: productDetailsEn ?? this.productDetailsEn,
      productDetailsCh: productDetailsCh ?? this.productDetailsCh,
      productDetailsTh: productDetailsTh ?? this.productDetailsTh,
      termsAndConditionsEN: termsAndConditionsEN ?? this.termsAndConditionsEN,
      termsAndConditionsCH: termsAndConditionsCH ?? this.termsAndConditionsCH,
      termsAndConditionsTH: termsAndConditionsTH ?? this.termsAndConditionsTH,
      descEN: descEN ?? this.descEN,
      descCH: descCH ?? this.descCH,
      descTH: descTH ?? this.descTH,
      voucherUnit: voucherUnit ?? this.voucherUnit,
      vendorCode: vendorCode ?? this.vendorCode,
      vendorType: vendorType ?? this.vendorType,
      queryId: queryId ?? this.queryId,
      website: website ?? this.website,
      yearFounded: yearFounded ?? this.yearFounded,
      email: email ?? this.email,
      webSeq: webSeq ?? this.webSeq,
      voucherMin: voucherMin ?? this.voucherMin,
      voucherOptions: voucherOptions ?? this.voucherOptions,
      paymentOptions: paymentOptions ?? this.paymentOptions,
      promotionLevel: promotionLevel ?? this.promotionLevel,
      vouchersLeft: vouchersLeft ?? this.vouchersLeft,
      inventoryLimit: inventoryLimit ?? this.inventoryLimit,
      threshold: threshold ?? this.threshold,
    );
  }
}
