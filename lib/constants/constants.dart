import 'package:dtg_web_admin/res/R.dart';
import 'package:flutter/material.dart';

class Constants {
  static const Color PRIMARY_COLOR = Color(0xffFBFBFB);
  static String OTP_GIF_IMAGE = R.drawable.img_otp;
}

class Globals {
  static num PT_RATE = 10;
  static bool pushNote = false;
  static String DEFLANG = "en";
  static String REGION = "HK"; //default region
  static String SG_CODE = "SG"; //default region
  static String HK_CODE = "HK"; //default region
  static String TH_CODE = "TH"; //default region
  static String SG_WALLET = "walletsSG"; // firebase collections
  static String HK_WALLET = "walletsHK"; //
  static String TH_WALLET = "walletsTH"; //
  static bool FIRST_LOGIN = false;
  static String REWARD_FIRST_MSG_ID = "reward-1";
  static String REWARD_EMAIL_MSG_ID = "reward-2";
  static String REWARD_TOPUP_MSG_ID = "reward-3";
  static String REWARD_SHARE_MSG_ID = "reward-4";
  static String UNLINK_ACCOUNT = "https://cds3.dyndns.ws:3000/drrewards/unlink";
  static String VOUCHER_INV_HK =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/inv/redeem';
  static String VOUCHER_BHN_HK =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/bhn/redeem';
  static String VOUCHER_INV_SG =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/inv/sg/redeem';
  static String VOUCHER_BHN_SG =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/bhn/sg/issue';
  static String VOUCHER_INV_TH =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/inv/th/issue';
  static String VOUCHER_BHN_TH =
      'https://coindragon-tx-server.dynalias.net:3000/ecoupon/bhn/th/issue';
  static String UNLOCK_REWARD =
      'https://coindragon-tx-server.dynalias.net:3000/drrewards/unlock_reward';
  static String CHARITY_HK =
      'https://coindragon-tx-server.dynalias.net:3000/drrewards/donate';
  static String CHARITY_SG =
      'https://coindragon-tx-server.dynalias.net:3000/drrewards/donate';
  static String CHARITY_TH =
      'https://coindragon-tx-server.dynalias.net:3000/drrewards/donate';

  static const String CHECKSUM = "4k6TA1h5rFps";
  static const String CDTXS_CS = "31C46194C9A237226332A237E063785E";
}
