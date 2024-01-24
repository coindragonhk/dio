import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/main.dart';
import 'package:dtg_web_admin/src/data/models/voucher.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart';
import 'package:dtg_web_admin/src/data/repository/app_repository.dart';
import 'package:dtg_web_admin/src/page/main/bloc/main_cubit.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../home.dart';

@LazySingleton()
class HomeCubit extends Cubit<HomeState> {
  final AppRepository _appRepository = AppRepository();
  final AppPreferences _pref = getIt<AppPreferences>();
  final MainCubit _mainCubit = GetIt.I<MainCubit>();
  //final FirestoreRepository firestoreRepository =
  //    GetIt.I<FirestoreRepository>();
  // Wallet? wallet;
  List<Voucher> listMyVoucher = [];
  List<OptionsData> listOptionVoucher = [];
  StreamSubscription<QuerySnapshot<Voucher>>? voucherDataStream;
  int get maxLengthOptionVoucher =>
      listOptionVoucher.length < 5 ? listOptionVoucher.length : 5;

  HomeCubit() : super(HomeInitial());

  void refreshHome() {
    emit(HomeLoading());
    emit(HomeInitial());
  }

  void onRefresh() async {
    // monitor network fetch
    emit(HomeStartRefresh());
    // wallet = await firestoreRepository.getWallet();
    emit(HomeRefreshedSuccess());
  }

  void updateRegion() {
    emit(HomeLoading());
    emit(HomeLoadIpSuccess());
  }

  /*
  Only get data for mobile version
   */
  void getData({bool isRefresh = false}) async {
    emit(isRefresh ? HomeInitial() : HomeLoading());

/*
    final requests = [
      firestoreRepository.getWallet(),
      firestoreRepository.filterDistinctOptionsData(OptionsType.E_VOUCHER),
    ];
    try {
      List<dynamic> results = await Future.wait(requests);

      for (int i = 0; i < results.length; i++) {
        dynamic result = results[i];
        switch (i) {
          case 0:
            wallet = result;
            break;
          case 1:
            listOptionVoucher.clear();
            listOptionVoucher = result;
            break;
          default:
        }
      }
    } catch (e) {
      logger.e(e);
    }*/
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
      Globals.DEFLANG = Globals.REGION == "HK"
          ? "zh"
          : Globals.REGION == "SG"
              ? "en"
              : "th";
      String? lastRegionStored = _pref.getString(AppPreferences.KEY_REGION);
      _pref.setData(AppPreferences.KEY_REGION, Globals.REGION);
      if (!Utils.isEmpty(lastRegionStored) &&
          lastRegionStored != Globals.REGION) {
        emit(HomeForceLogOut());
      } else {
        emit(HomeLoadIpSuccess());
      }
    }).catchError((e) {
      Globals.REGION = "HK";
      Globals.DEFLANG = "zh";
      emit(HomeLoadIpSuccess());
    });
    emit(HomeGetDataSuccess());
  }

  /*
  Get ip for only web-based version
   */
  void getIp() {
    emit(HomeLoading());
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
      _pref.saveRegion(Globals.REGION);

      Globals.DEFLANG = Globals.REGION == "HK"
          ? "zh"
          : Globals.REGION == "SG"
              ? "en"
              : "th";
      // Globals.REGION = "HK"; // Default
      emit(HomeLoadIpSuccess());
    }).catchError((e) {
      Globals.REGION = "HK";
      Globals.DEFLANG = "zh";
      emit(HomeLoadIpSuccess());
    });
  }

  @override
  Future<void> close() {
    voucherDataStream?.cancel();
    return super.close();
  }
}
