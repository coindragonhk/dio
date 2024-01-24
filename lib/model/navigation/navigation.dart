import 'package:flutter/material.dart';

class Keys {
  static final navKey = GlobalKey<NavigatorState>();
}

class Routes {
  static const mainPage = "MAIN_SCREEN";

  static const homePage = "HOME_SCREEN";

  static const registerPage = "REGISTER_SCREEN";

  static const loginPage = "LOGIN_SCREEN";

  static const phoneLoginPage = "PHONE_LOGIN_SCREEN";

  static const profilePage = "PROFILE_SCREEN";

  static const txHistoryPage = "TX_HISTORY_SCREEN";

  static const settingsPage = "SETTINGS_SCREEN";

  static const referralsPage = "REFERRALS_SCREEN";

  static const voucherPage = "VOUCHER_SCREEN";

  static const charityPage = "CHARITY_SCREEN";

  static const voucherConfirmPage = "VOUCHER_CONFIRM_SCREEN";

  static const voucherTxPage = "VOUCHER_TX_SCREEN";

  static const faqPage = "FAQ_SCREEN";

  static const privacyPage = "PRIVACY_SCREEN";

  static const topUpPage = "TOPUP_PAGE";

  static const QRPage = "QR_PAGE";

  static const howToPage = "HOW_TO_PAGE";

  static const mapPage = "MAP_PAGE";

  static const mapDemoPage = "MAP_DEMO_PAGE";

  static const locationPage = "LOCATION_PAGE";

  static const glmapPage = "GL_MAP_PAGE";

  static const qrPage = "QR_PAGE";

  static const voucherInfoPage = "VOUCHER_INFO";

  static const vouchersIssued = "VOUCHER_ISSUED";

  static const voucherActivePage = "VOUCHER_ISSUED";

  //static const messagePage = "MESSAGE_PAGE";

  //ACTIONS

  static const logoutAction = "LOGOUT_ACTION";

  static const ROUTE_MAP = "/map";
  static const ROUTE_TRANSACTION = "/transaction";
  static const ROUTE_MY_VOUCHERS = "/my-vouchers";
  static const ROUTE_TRANSACTION_HISTORY = "/transaction-history";
  static const ROUTE_TOP_UP = "/top-up-points";
  static const ROUTE_USER_SETTING = "/user-setting";
  static const ROUTE_REFERRALS = "/referrals";
  static const ROUTE_FAQS = "/faqs";
  static const ROUTE_ABOUT_US = "/about-us";
  static const ROUTE_TERM_OF_USE = "/terms-of-use";
  static const ROUTE_PRIVACY_POLICY = "/privacy-policy";
}
