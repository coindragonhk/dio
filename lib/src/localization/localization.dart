import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../data/preferences/app_preferences.dart';
import '../utils/enum.dart';
import '../utils/logger.dart';
import 'csv_loader/csv_asset_loader.dart';

class Localization {
  static AppPreferences appPreferences = getIt<AppPreferences>();

  static List<Locale> supportedLanguage = [
    LanguageType.SCHINESE.locale,
    LanguageType.TCHINESE.locale,
    LanguageType.THAI.locale,
    const Locale('en', 'SG'),
    const Locale('en', 'HK'),
    const Locale('en', 'TH'),
    const Locale('en', 'US'),
  ];

  static const String languageFilePath = 'lib/res/translations/langs.csv';

  static Widget getLocalizationWidget({required Widget app}) {
    return EasyLocalization(
        supportedLocales: supportedLanguage,
        path: languageFilePath,
        fallbackLocale: LanguageType.ENGLISH.locale,
        startLocale: LanguageTypeExt.getLanguageTypeFromCode(
                appPreferences.appLanguageCode)
            .locale,
        useOnlyLangCode: false,
        saveLocale: false,
        assetLoader: CsvAssetLoader(),
        child: app);
  }

  static void setDefaultLanguage(BuildContext context) {
    Locale deviceLanguage = context.deviceLocale;
    logger.d(deviceLanguage);

    if (!LanguageType.values
        .map((e) => e)
        .toList()
        .contains(deviceLanguage.languageCode)) {
      deviceLanguage = LanguageType.ENGLISH.locale;
    }
    logger.d(deviceLanguage);
    appPreferences.saveAppLanguage(deviceLanguage.toString());
    loadLanguage(context);
  }

  static Future<void> changeLanguage(
      BuildContext context, Locale locale) async {
    final LanguageType currentLanguage =
        LanguageTypeExt.getLanguageTypeFromCode(appPreferences.appLanguageCode);
    if (currentLanguage.locale == locale ||
        !supportedLanguage.contains(locale)) {
      return;
    }
    await context.setLocale(locale);
    appPreferences.saveAppLanguage(locale.toString());
  }

  static loadLanguage(BuildContext context) async {
    logger.i(appPreferences.appLanguageCode);
    await context.setLocale(
        LanguageTypeExt.getLanguageTypeFromCode(appPreferences.appLanguageCode)
            .locale);
  }

  //static String? get kioskRegion => kioskInfo?.country;

  static LanguageType get currentLanguage =>
      LanguageTypeExt.getLanguageTypeFromCode(appPreferences.appLanguageCode);

  static bool get isLanguageEn => currentLanguage == LanguageType.ENGLISH;
  static bool get isLanguageTch => currentLanguage == LanguageType.TCHINESE;
  static bool get isLanguageSch => currentLanguage == LanguageType.SCHINESE;
  static bool get isLanguageTh => currentLanguage == LanguageType.THAI;
}
