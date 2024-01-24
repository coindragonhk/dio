import 'package:dtg_web_admin/src/utils/const.dart';

import 'utils.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toCapitalized())
      .join(" ");

  String? getFlagFromCountryCode() => toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  String? toEmoji() => startsWith("U+") == true
      ? String.fromCharCode(int.parse("0x${replaceAll("U+", "")}"))
      : this;

  String? getPhoneNumberWithoutPrefix() => replaceAll(" ", "")
      .replaceAll(Utils.prefixPhoneNumber().trim(), "")
      .trim();

  String toBalanceValue(num? value) => '\$ ${(value ?? 0).toStringAsFixed(1)}';

  String formatBankNumber(String mask,
      {String separator = "-", String maskSymbol = "*"}) {
    if (mask.contains(separator)) {
      // Support case copy/paste value to text field
      String newValueString = this;
      for (int i = 0; i < mask.length; i++) {
        if (mask[i] == separator) {
          newValueString = newValueString.substring(0, i) +
              separator +
              newValueString.substring(i, newValueString.length);
        }
        if (mask[i] == maskSymbol) {
          newValueString = newValueString.substring(0, i) +
              maskSymbol +
              newValueString.substring(i + 1, newValueString.length);
        }
      }
      if (newValueString.length > mask.length) {
        newValueString = newValueString.substring(0, mask.length);
      }
      return newValueString;
    }
    return this;
  }

  String formatHiddenPhoneNumber() {
    return replaceRange(length - 6, length - 3, "***");
  }

  String getImageName() {
    String imgName = toLowerCase();
    //print("imgName (before): $imgName");
    imgName = imgName
        .toLowerCase()
        .replaceAll("ä", "a")
        .replaceAll("™", "")
        .replaceAll(RegExp(r'-'), "_")
        .replaceAll(" ", "_")
        .replaceAll("_n'_", "_")
        .replaceAll("_&_", "_")
        .replaceAll("é", "e")
        .trim();
    //print("imgName (after): $imgName");
    return imgName;
  }

  String convertV1NameToLogoAsset({num width = 0}) {
    //print(this);
    List<String> strTok = this.split('/');
    String assetName = Const.assetV1Map[strTok.last]!;
    if (width != 0) {
      List<String> token = assetName.split('.');
      assetName = '${token[0]}_W${width}.${token[1]}';
      //print(assetName);
    }
    //map v1 assetName
    return '${Const.ASSET_BASE_URL}/images/kioskAssets/HK/vouchers/$assetName';
  }

  String getLogoUrl({num width = 0}) {
    String logoPath = this.trim();
    String imgUrl = '${Const.ASSET_BASE_URL}${logoPath}';
    if (width != 0) {
      List<String> strTok = logoPath!.split('.');
      imgUrl = '${Const.ASSET_BASE_URL}${strTok[0]}_W${width}.${strTok[1]}';
    }
    //print('logoPath: ${imgUrl}');

    return Uri.encodeFull(imgUrl);
  }

  String omitDollarValue() {
    String assetName = trim();
    for (String pattern in Const.dollarValuePattern) {
      assetName = assetName.replaceAll(pattern, '');
    }
    return assetName;
  }

  String toAssetBaseName() {
    String assetName = trim().toLowerCase();
    //print('assetName (lcase): $assetName');

    for (String pattern in Const.assetV1StringPattern) {
      assetName = assetName.replaceAll(pattern, '');
    }
    assetName = assetName
        .replaceAll(" ", "")
        .replaceAll("-", " ")
        .replaceAll("ä", "a")
        .replaceAll("™", "");

    for (String pattern in Const.pnsV1Variants) {
      assetName = assetName.replaceAll(pattern, 'parknshop');
    }
    //print('assetName (after): $assetName');
    return assetName;
  }

  String convertFirebaseEndlines({bool isHtml = false}) {
    return replaceAll('_b', isHtml ? '<br>' : '\n');
  }

  String removePrefix(String prefix) {
    return replaceAll(prefix, '');
  }
}
