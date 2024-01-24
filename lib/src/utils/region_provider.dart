/*
class RegionProvider with ChangeNotifier {
  static AppPreferences pref = GetIt.I<AppPreferences>();
  String? get region => pref.region;

  void setRegion(String region) {
    pref.saveRegion(region);
    notifyListeners();
  }
} 
*/

import 'package:flutter/material.dart';

/*
class Region with ChangeNotifier {
  String regionCode;

  Region({
    required this.regionCode,
  });

  // A method to change the region
  void changeRegion(String newName) {
    regionCode = newName;
    notifyListeners(); // Uncomment this if you're using ChangeNotifier
  }
}
*/
class AppLocale extends ChangeNotifier {
  Locale _locale;

  AppLocale(this._locale);

  Locale get locale => _locale;
  set locale(Locale locale) {
    if (locale != _locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}
