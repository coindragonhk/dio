import 'dart:async';
import 'dart:ui';

import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart';
import 'package:dtg_web_admin/src/data/repository/app_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'authentication_state.dart';

@LazySingleton()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AppPreferences _pref = GetIt.I<AppPreferences>();
  AppRepository repository = AppRepository();

  //User? get user => FirebaseAuth.instance.currentUser;

  bool get isAlreadyOnBoarding =>
      _pref.getBool(AppPreferences.KEY_DID_ON_BOARDING) ?? false;

  bool get isLoggedIn => _pref.isLoggedIn;

  AuthenticationCubit() : super(AuthenticationUninitialized());

  void openApp() async {
    emit(AuthenticationUninitialized());
    //FirebaseAuth.instance.authStateChanges();
    if (kIsWeb) {
      emit(AuthenticationAuthenticated());
    } else {
      Future.delayed(
        const Duration(seconds: 4),
        () {
          if (isAlreadyOnBoarding) {
            if (isLoggedIn) {
              emit(AuthenticationAuthenticated());
            } else {
              emit(AuthenticationUnauthenticated());
            }
          } else {
            emit(AuthenticationOnBoarding());
          }
        },
      );
    }
  }

  void introToLogin() {
    emit(AuthenticationLoading());
    _pref.setData(AppPreferences.KEY_DID_ON_BOARDING, true);
    emit(AuthenticationUnauthenticated());
  }

  void login() async {
    emit(AuthenticationLoading());
    _pref.setData(AppPreferences.KEY_REGION, Globals.REGION);
    if (!kIsWeb) {
      /*final fcmToken = await FirebaseMessaging.instance.getToken();
      await repository.registerDeviceToken(
          await user?.getIdToken() ?? "",
          RegisterDeviceTokenRequest(
            deviceToken: fcmToken ?? "",
            deviceId: await Utils.getDeviceId(),
          ));
          */
    }
    emit(AuthenticationAuthenticated());
  }

  void logout() async {
    emit(AuthenticationLoading());
    /*
    if (!kIsWeb) {
      await repository.unRegisterDeviceToken(
          await user?.getIdToken() ?? "",
          UnRegisterDeviceTokenRequest(
            deviceId: await Utils.getDeviceId(),
          ));
    }
    FirebaseAuthRepository authRepository = GetIt.I<FirebaseAuthRepository>();
    await authRepository.logout();
    */
    emit(AuthenticationUnauthenticated());
  }
}
