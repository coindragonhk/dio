import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/enum.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@LazySingleton()
class AppPreferences {
  final SharedPreferences _preference;

  AppPreferences(this._preference);

  static const String KEY_EMAIL = "KEY_EMAIL";
  static const String KEY_DID_ON_BOARDING = "KEY_DID_ON_BOARDING";
  static const String KEY_REGION = "KEY_REGION";

  String _currentLanguage = LanguageType.ENGLISH.languageCode;
  Locale _currentLocale = LanguageType.ENGLISH.locale;

  Future<void> saveRegion(String region, {bool firstLoad = false}) async {
    await _preference.setString(KEY_REGION, region);
    _currentLanguage = LanguageType.ENGLISH.languageCode;
    if (region == "HK") {
      _currentLanguage = LanguageType.TCHINESE.languageCode;
    } else if (region == "TH") {
      _currentLanguage = LanguageType.THAI.languageCode;
    }
  }

  String? get region {
    if (Utils.isEmpty(_preference.getString(KEY_REGION))) return null;
    return _preference.getString(KEY_REGION);
  }

  String get appLanguageCode {
    return _currentLanguage;
  }

  String get userMail => getString(KEY_EMAIL) ?? "";

  Future<void> saveAppLanguage(String languageCode) async {
    //await _preference.setString(KEY_LANGUAGE_CODE, languageCode);
    _currentLanguage = languageCode;
  }

  bool get isLoggedIn => false;

  void logout() {}

  String? getString(String key) {
    String? value = _preference.getString(key);
    if (value?.isEmpty == true) value = null;
    return value;
  }

  List<String> getListString(String key) {
    return _preference.getStringList(key) ?? [];
  }

  List<int> getListInt(String key) {
    return _preference.getStringList(key)?.map((e) => int.parse(e)).toList() ??
        [];
  }

  bool? getBool(String key) {
    return _preference.getBool(key);
  }

  int? getInt(String key) {
    return _preference.getInt(key);
  }

  void setData(String key, Object? data) {
    if (data == null) return;
    if (data is int) {
      _preference.setInt(key, data);
    }
    if (data is String) {
      _preference.setString(key, data);
    }
    if (data is bool) {
      _preference.setBool(key, data);
    }
    if (data is List<dynamic>) {
      _preference.setStringList(key, data.map((e) => e.toString()).toList());
    }
  }

  void removeData(String key) {
    _preference.remove(key);
  }
}
