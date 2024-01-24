import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtg_web_admin/main.dart';
import 'package:dtg_web_admin/src/data/models/voucher.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart';
import 'package:dtg_web_admin/src/data/repository/app_repository.dart';
import 'package:dtg_web_admin/src/localization/localization.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../../../../constants/constants.dart';
import '../main.dart';

@LazySingleton()
class MainCubit extends Cubit<MainState> {
  final AppRepository _appRepository = AppRepository();
  final AppPreferences _pref = getIt<AppPreferences>();
  //Wallet? wallet;
  List<Voucher> listMyVoucher = [];
  List<OptionsData> listOptionVoucher = [];
  //BottomNavigationType? currentBottomNavigation;
  bool haveUnclaimedReferrals = false;
  List<StreamSubscription> subscriptions = [];

  int get maxLengthOptionVoucher =>
      listOptionVoucher.length < 5 ? listOptionVoucher.length : 5;

  MainCubit() : super(MainInitial()) {
    //_registerPushNotification();
    // checkExistingReferralNotifications().then((value) => {
    //       Future.delayed(const Duration(seconds: 2), () {
    //         listenReferralNotifications();
    //       })
    //     });
  }

  void refreshMain() {
    emit(MainLoading());
    emit(MainInitial());
  }

  void onRefresh() async {
    emit(MainStartRefresh());
    emit(MainRefreshedSuccess());
  }

  void switchLanguage(BuildContext context,
      {String? languageCode, bool setDefault = false}) async {
    emit(MainLoading());

    String langCode = languageCode ?? LanguageType.ENGLISH.languageCode;
    if (!setDefault) {
      if (Globals.REGION == "HK") {
        langCode = Localization.isLanguageTch
            ? LanguageType.ENGLISH.languageCode
            : LanguageType.TCHINESE.languageCode;
      } else if (Globals.REGION == "SG") {
        langCode = Localization.isLanguageSch
            ? LanguageType.ENGLISH.languageCode
            : LanguageType.SCHINESE.languageCode;
      } else if (Globals.REGION == "TH") {
        langCode = Localization.isLanguageTh
            ? LanguageType.ENGLISH.languageCode
            : LanguageType.THAI.languageCode;
      }
    }
    print('switching to : $langCode');

    await Localization.changeLanguage(
      context,
      LanguageTypeExt.getLanguageTypeFromCode(langCode).locale,
    );
    emit(MainInitial());
  }

  void updateRegion(BuildContext context) async {
    emit(MainLoading());
    emit(MainInitial());
  }

  void getIp() {
    emit(MainInitial());
    _appRepository.getIp().then((value) {
      if (value != null && value.status == "success") {
        Globals.REGION = value.countryCode ?? "HK";
        Globals.REGION = (Globals.REGION != "HK" &&
                Globals.REGION != "SG" &&
                Globals.REGION != "TH")
            ? "HK"
            : Globals.REGION;
      } else {
        Globals.REGION = "HK"; // Default
      }
      // Globals.REGION = "HK"; // Default
      logger.d(Globals.REGION);
      emit(MainLoadIpSuccess());
    }).catchError((e) {
      Globals.REGION = "HK";
      emit(MainLoadIpSuccess());
    });
  }
}
