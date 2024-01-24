import 'package:dtg_web_admin/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../res/R.dart';
import 'utils.dart';

enum RegionOptions { HONG_KONG, SINGAPORE, THAILAND }

extension RegionOptionsExt on RegionOptions {
  String get title {
    switch (this) {
      case RegionOptions.HONG_KONG:
        return R.string.hongkong.tr();
      case RegionOptions.SINGAPORE:
        return R.string.singapore.tr();
      case RegionOptions.THAILAND:
        // return "Thailand";
        return R.string.thailand.tr(); // fix
    }
  }
}

enum LanguageType {
  TCHINESE,
  SCHINESE,
  ENGLISH,
  THAI,
}

extension LanguageTypeExt on LanguageType {
  // String get name {
  //   switch (this) {
  //     case LanguageType.ENGLISH:
  //       return R.string.english_name.tr();
  //     case LanguageType.CHINESE:
  //       return R.string.chinese_name.tr();
  //     default:
  //       return R.string.chinese_name.tr();
  //   }
  // }

  String get languageLabel {
    switch (this) {
      case LanguageType.ENGLISH:
        return 'ENG';
      case LanguageType.TCHINESE:
        return '中文繁體';
      case LanguageType.SCHINESE:
        return '中文简体';
      case LanguageType.THAI:
        return 'ภาษาไทย';
    }
  }

  String get languageCode {
    switch (this) {
      case LanguageType.ENGLISH:
        if (Globals.REGION == "SG") {
          return 'en_SG';
        }
        if (Globals.REGION == "HK") {
          return 'en_HK';
        }
        if (Globals.REGION == "TH") {
          return 'en_TH';
        }
        return "en_US";
      case LanguageType.TCHINESE:
        return 'zh_HK';
      case LanguageType.SCHINESE:
        return 'zh_SG';
      case LanguageType.THAI:
        return 'th_TH';
      default:
        return 'en_US';
    }
  }

  Locale get locale {
    switch (this) {
      case LanguageType.ENGLISH:
        if (Globals.REGION == "SG") {
          return const Locale('en', 'SG');
        }
        if (Globals.REGION == "HK") {
          return const Locale('en', 'HK');
        }
        if (Globals.REGION == "TH") {
          return const Locale('en', 'TH');
        }
        return const Locale('en', 'US');

      case LanguageType.TCHINESE:
        return const Locale('zh', 'HK');
      case LanguageType.SCHINESE:
        return const Locale('zh', 'SG');
      case LanguageType.THAI:
        return const Locale('th', 'TH');
      default:
        return const Locale('en', '');
    }
  }

  static LanguageType getLanguageTypeFromCode(String languageCode) {
    switch (languageCode) {
      case 'en_US':
        return LanguageType.ENGLISH;
      case 'en_HK':
        return LanguageType.ENGLISH;
      case 'en_TH':
        return LanguageType.ENGLISH;
      case 'en_SG':
        return LanguageType.ENGLISH;
      case 'en':
        return LanguageType.ENGLISH;
      case 'zh_HANT':
      case 'zh_HK':
      case 'zh_TW':
      case 'zh':
        return LanguageType.TCHINESE;
      case 'zh_HANS':
      case 'zh_SG':
      case 'zh_CN':
        return LanguageType.SCHINESE;
      case 'th':
      case 'th_TH':
        return LanguageType.THAI;
      default:
        return LanguageType.ENGLISH;
    }
  }
}

enum OptionsType { ALL, TOP_UP, BANKS, E_VOUCHER, PAY_BILLS, DONATE }

extension OptionsTypeExt on OptionsType {
  String get title {
    switch (this) {
      case OptionsType.BANKS:
        return R.string.label_bank_deposit.tr();
      case OptionsType.ALL:
        return R.string.label_show_all.tr();
      case OptionsType.TOP_UP:
        return R.string.title_topup_deposit.tr();
      case OptionsType.E_VOUCHER:
        return R.string.label_e_voucher.tr();
      case OptionsType.PAY_BILLS:
        return R.string.label_pay_bills.tr();
      case OptionsType.DONATE:
        return R.string.label_donate.tr();
    }
  }

  String get queryName {
    switch (this) {
      case OptionsType.TOP_UP:
        return "accounts";
      case OptionsType.BANKS:
        return "banks";
      case OptionsType.E_VOUCHER:
        return "vouchers";
      case OptionsType.PAY_BILLS:
        return "billpay";
      case OptionsType.DONATE:
        return "charities";
      default:
        return "";
    }
  }
}

enum ToastType {
  SUCCESS,
  WARNING,
  ERROR,
}

// enum OptionsName { VOUCHER, DONATION, TOP_UP, PAY_BILLS }

// extension OptionsNameExt on OptionsName {
//   String get queryName {
//     switch (this) {
//       case OptionsName.VOUCHER:
//         return "vouchers";
//       case OptionsName.DONATION:
//         return "charities";
//       case OptionsName.TOP_UP:
//         return "accounts";
//       case OptionsName.PAY_BILLS:
//         return "billpay";
//       default:
//         return "vouchers";
//     }
//   }
// }

enum AvailableStatus { MAINTENANCE, OK }

enum DrawerStep { MAIN, LOGIN }

enum DeliveryType { EMAIL, PHONE /*, GIFT*/ }

extension DeliveryTypeExt on DeliveryType {
  String title(BuildContext context) {
    switch (this) {
      case DeliveryType.EMAIL:
        return Utils.isDesktopWeb(context)
            ? R.string.label_via_email.tr()
            : R.string.label_via_email_mobile.tr();
      case DeliveryType.PHONE:
        return Utils.isDesktopWeb(context)
            ? R.string.label_via_phone_number.tr()
            : R.string.label_via_phone_number_mobile.tr();
      /*
      case DeliveryType.GIFT:
        return Utils.isDesktopWeb(context)
            ? R.string.label_as_a_gift.tr()
            : R.string.label_as_a_gift_mobile.tr();
            */
      default:
        return "";
    }
  }

  double get width {
    switch (this) {
      case DeliveryType.EMAIL:
        return 186;
      case DeliveryType.PHONE:
        return 192;
      /*case DeliveryType.GIFT:
        return 105;*/
      default:
        return double.infinity;
    }
  }
}

enum PaymentMethodOptions {
  COIN_DEPOSIT,
  NOTE_DEPOSIT,
  DRAGON_REWARD,
  OCTOPUS,
  ALIPAY,
  VISA,
  PAYME,
  WECHAT_PAY
}

extension PaymentMethodOptionsExt on PaymentMethodOptions {
  String get dbKey {
    switch (this) {
      case PaymentMethodOptions.ALIPAY:
        return 'Alipay';
      case PaymentMethodOptions.VISA:
        return 'CC';
      case PaymentMethodOptions.PAYME:
        return 'PayMe';
      case PaymentMethodOptions.WECHAT_PAY:
        return 'WeChat';
      case PaymentMethodOptions.DRAGON_REWARD:
      case PaymentMethodOptions.OCTOPUS:
        return "";
      default:
        return "";
    }
  }

  String get image {
    switch (this) {
      case PaymentMethodOptions.COIN_DEPOSIT:
        if (Globals.REGION == "TH") {
          return R.drawable.img_coin_lineup_th;
        } else if (Globals.REGION == "SG") {
          return R.drawable.img_coin_lineup_sg;
        }
        return R.drawable.img_coin_lineup_hk;
      case PaymentMethodOptions.NOTE_DEPOSIT:
        if (Globals.REGION == "TH") {
          return R.drawable.img_th_banknote_series;
        } else if (Globals.REGION == "SG") {
          return R.drawable.img_hk_banknote_series;
        }
        return R.drawable.img_hk_banknote_series;
      case PaymentMethodOptions.DRAGON_REWARD:
        return R.drawable.img_tx_payment;
      case PaymentMethodOptions.OCTOPUS:
        return R.drawable.img_octopus_payment;
      case PaymentMethodOptions.ALIPAY:
        return R.drawable.img_alipayhk;
      case PaymentMethodOptions.PAYME:
        return R.drawable.img_payme_hsbc;
      case PaymentMethodOptions.VISA:
        return R.drawable.img_visa_payment;
      case PaymentMethodOptions.WECHAT_PAY:
        return R.drawable.img_wechat_pay;
      default:
        return "";
    }
  }

  int get widthDesktop {
    switch (this) {
      case PaymentMethodOptions.COIN_DEPOSIT:
        return 218;
      case PaymentMethodOptions.NOTE_DEPOSIT:
        return 128;
      case PaymentMethodOptions.DRAGON_REWARD:
        return 190;
      case PaymentMethodOptions.OCTOPUS:
        return 122;
      case PaymentMethodOptions.ALIPAY:
        return 224;
      case PaymentMethodOptions.PAYME:
        return 227;
      case PaymentMethodOptions.VISA:
        return 322;
      case PaymentMethodOptions.WECHAT_PAY:
        return 149;
      default:
        return 190;
    }
  }

  String? get title {
    switch (this) {
      case PaymentMethodOptions.COIN_DEPOSIT:
        return R.string.coins_deposit.tr();
      case PaymentMethodOptions.NOTE_DEPOSIT:
        return R.string.notes_deposit.tr();
      default:
        return null;
    }
  }
}

enum SectionId {
  MAIN_CONTENT,
  CAROUSEL,
  SERVICE_OUTPUT,
  ACCEPT_SERVICE,
  MAP,
  FOOTER_APP,
  FOOTER_INFO
}

enum FilterAdditionalType { KIOSK, REWARDS }

extension FilterAdditionalTypeExt on FilterAdditionalType {
  String? get query {
    switch (this) {
      case FilterAdditionalType.KIOSK:
        return "web";
      case FilterAdditionalType.REWARDS:
        return "app";
      default:
        return null;
    }
  }

  String? get termOfUseQuery {
    switch (this) {
      case FilterAdditionalType.KIOSK:
        return "kiosk";
      case FilterAdditionalType.REWARDS:
        return "reward";
      default:
        return null;
    }
  }
}

enum BottomNavigationType { FIND_KIOSK, TOP_UP, BROWSE, MY_VOUCHERS }

extension BottomNavigationTypeExt on BottomNavigationType {
  String get title {
    switch (this) {
      case BottomNavigationType.FIND_KIOSK:
        return R.string.label_find_kiosk;
      case BottomNavigationType.TOP_UP:
        return R.string.topup;
      case BottomNavigationType.BROWSE:
        return R.string.label_browse;
      case BottomNavigationType.MY_VOUCHERS:
        return R.string.myvouchersabr;
      default:
        return "";
    }
  }

  String get icon {
    switch (this) {
      case BottomNavigationType.FIND_KIOSK:
        return R.drawable.ic_find_kiosk_mobi;
      case BottomNavigationType.TOP_UP:
        return R.drawable.ic_top_up_mobi;
      case BottomNavigationType.BROWSE:
        return R.drawable.ic_browse_mobi;
      case BottomNavigationType.MY_VOUCHERS:
        return R.drawable.ic_my_voucher_mobi;
      default:
        return "";
    }
  }
}

// enum LanguageOptions { ENGLISH, CHINESE }

// extension LanguageOptionsExt on LanguageOptions {
//   String get title {
//     switch (this) {
//       case LanguageOptions.ENGLISH:
//         return R.string.label_english.tr();
//       case LanguageOptions.CHINESE:
//         return "繁体";
//     }
//   }
// }

