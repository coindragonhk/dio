// ignore_for_file: constant_identifier_names

class Const {
  static const String APP_URL = "https://dragonrewards.io";
  static const String APP_ZH_URL = "https://dragonrewards.io/zh";
  static const String PRIVACY_POLICY_URL =
      "https://dragonrewards.io/privacyPolicy.html";
  static const String PRIVACY_POLICY_ZH_URL =
      "https://dragonrewards.io/zh/privacyPolicy.html";
  static const String TERM_URL =
      "https://dragonrewards.io/serviceAgreement.html";
  static const String TERM_ZH_URL =
      "https://dragonrewards.io/zh/serviceAgreement.html";
  static const String WEBSITE_URL = "https://google.com";

  static const String ASSET_BASE_URL =
      "https://coindragon-tx-server.dynalias.net:3000";
  // date & time
  static const String VOUCHER_ASSET_BG_PATH =
      "${ASSET_BASE_URL}/images/kioskAssets/HK/vouchersBgAsset/";
  static const String DATE_FORMAT_REQUEST = "dd-MM-yyyy";
  static const String DATE_FORMAT = "dd MMMM yyyy";
  static const String DATE_TIME_FORMAT = "dd MMMM yyyy , HH:mm";
  static const String DATE_TIME_FORMAT_TIME = "hh:mm";
  static const String DATE_TIME_FORMAT_TIME_24 = "HH:mm";
  static const String DATE_FORMAT_EXPIRATION = "yyyy-MM-dd";
  static const String DATE_FORMAT_POINT = "dd/MM/yyyy  -  HH:mm";
  static const String DATE_RECEIPT_NO_FORMAT = "MMdd-HHmm";
  static const String DATE_RECEIPT_FORMAT = "dd/MM/yyyy  /  HH:mm";
  static const String DATE_KIOSK_AVAILABLE_FORMAT = "hh:mma";
  static const int LIMIT_DEFAULT = 45;

  static const String LOG_FILE_NAME = "cdg_log.txt";

  //FireStore
  static const String FIRE_STORE_BASE_URL =
      "https://firestore.googleapis.com/$FIRE_STORE_API_VERSION/projects/$FIRE_STORE_PROJECT_ID/databases/$FIRE_STORE_DEFAULT_DATABASE/";
  static const String FIRE_STORE_PROJECT_ID = "cdmobilestore";
  static const String FIRE_STORE_API_VERSION = "v1";
  static const String FIRE_STORE_DEFAULT_DATABASE = "(default)";
  //WS
  static const String WS_URL = "ws://127.0.0.1:40888/";

  static const num DEPOSIT_RATE = 90.0;
  static const num NEXT_TRANSACTION_VALUE = 20.0;
  static const num COIN_DRAGON_SERVICE_FEE = 125.3;
  static const num CREDIT_VALUE_DUMMY = 50.0;
  static const num TOP_UP_RATE = 10;

  static const String FIRST_PAGE = "FIRST_PAGE";

  static const String CHECKSUM = "4k6TA1h5rFps";

  static const API_BASE_URL = "https://cds3.dyndns.ws:3000/db/kiosk/";
  static const APP_DR_URL = "app.dragonrewards.io";
  static const YEDPAY_GENLINK_PATH = "genLink";

  static const IDLE_TIME = 70;

  static const IDLE_EXPIRED_TIME = 10;

  static const TOPUP_VIDEO_TIME = 8;

  static const MIN_LENGTH_ALIPAY_ACCOUNT = 11;
  static const MAX_LENGTH_ALIPAY_ACCOUNT = 12;

  static const MIN_LENGTH_VB_ACCOUNT = 11;
  static const MAX_LENGTH_VB_ACCOUNT = 15;

  static const MIN_LENGTH_SPECIAL_BANK_ACCOUNT = 11;
  static const MAX_LENGTH_SPECIAL_BANK_ACCOUNT = 11;

  static const MIN_LENGTH_GENERAL_BANK_ACCOUNT = 10;
  static const MAX_LENGTH_GENERAL_BANK_ACCOUNT = 12;

  static const String VOUCHER_STATUS_ISSUED = "ISSUED";
  static const String VOUCHER_STATUS_READ = "READ";
  static const String VOUCHER_STATUS_REMOVED = "REMOVED";

  static const String ORDER_BY_TIME = "localTime";
  static const String ORDER_BY_BRAND = "titleEN";
  static const String ORDER_BY_VALUE = "voucherValue";

  static const SUPPORT_EMAIL = "info@coindragon.co";
  static const REWARD_SUPPORT_EMAIL = "support@dragonrewards.io";
  static const AVAILABLE_24_HOUR = ["24 / 7", "24/7", "24 /7", "24/ 7"];
  static const PLAY_STORE_URL =
      "https://play.google.com/store/apps/details?id=com.dtg.dragonrewards";
  static const APP_STORE_URL =
      "https://apps.apple.com/us/app/dragon-rewards/id1610089593";
  static const double DEFAULT_FILTER_RADIUS = 40;
  static const DEFAULT_ZOOM_LEVEL = 16.0;
  static const DEFAULT_ZOOM_LEVEL_MOBILE = 17.0;
  static const PLACE_HOLDER_BRAND_URL = "https://www.facebook.com/coindragonHK";
  static const FACEBOOK_URL_HK = "https://www.facebook.com/coindragonHK";
  static const FACEBOOK_URL_SG = "https://www.facebook.com/coindragonSG";
  static const FACEBOOK_URL_TH = "https://www.facebook.com/coindragonTH";

  static const INSTAGRAM_URL = "https://www.instagram.com/coindragon/";
  static const YOUTUBE_URL =
      "https://www.youtube.com/c/CoinDragonChannel/featured";
  static const YEDPAY_URL = "https://www.yedpay.com/";
  static const num POINT_RATE = 10;
  static const bool IS_ENABLE_PROMOTION = false;

  static const BLACK_FONT_OPTIONS = [
    "Cafe de Coral",
    "Deliveroo",
    "Google Playstore",
    "Green Common",
    "JHC",
    "KKDay",
    "Pizza Hut",
    "Saint Honore",
    "Shell",
    "SuchPrice",
    "Watsons",
    "YATA"
  ];

  static const Map<String, String> assetV1Map = {
    '759Logo.png': '759.png',
    '759.png': '759.png',
    'Arome_Bakery.png': 'Arome_Bakery.png',
    'appstoreItunesLogo.png': 'Apple_iTunes.png',
    'iTunes_Gift_Card.png': 'Apple_iTunes.png',
    'bhnLogo.png': 'BHN.png',
    'cafeDeCoralLogo.png': 'Cafe_de_Coral.png',
    'Cafe_de_Coral_V2.png': 'Cafe_de_Coral.png',
    'deliverooLogo.png': 'Deliveroo.png',
    'Deliveroo.png': 'Deliveroo.png',
    'fairwoodLogo.png': 'Fairwood.png',
    'Fairwood_V2.png': 'Fairwood.png',
    'foodpandaLogo.png': 'Foodpanda.png',
    'Foodpanda.png': 'Foodpanda.png',
    'footLockerLogo.png': 'Footlocker.png',
    'Footlocker.png': 'Footlocker.png',
    'fusionLogo.png': 'Fusion.png',
    'Fusion.png': 'Fusion.png',
    'Fortress_V2.png': 'Fortress.png',
    'giordanoLogo.png': 'Giordano.png',
    'Giordano_V2.png': 'Giordano.png',
    'greenCommonLogo.png': 'Green_Common.png',
    'Green_Common_V2.png': 'Green_Common.png',
    'haagenDazsLogo.png': 'Haagen_Dazs.png',
    'Haagen_Dazs_V2.png': 'Haagen_Dazs.png',
    'hktvmallLogo.png': 'HKTVmall.png',
    'HKTVmall.png': 'HKTVmall.png',
    'hungFookTongLogo.png': 'Hung_Fook_Tong.png',
    'Hung_Fook_Tong_V2.png': 'Hung_Fook_Tong.png',
    'jhcLogo.png': 'JHC.png',
    'JHC.png': 'JHC.png',
    'kfcLogo.png': 'KFC.png',
    'KFC.png': 'KFC.png',
    'KKDay.png': 'KKDay.png',
    'Klook.png': 'Klook.png',
    'Mannings.png': 'Mannings.png',
    'Netflix.png': 'Netflix.png',
    'nikeLogo.png': 'Nike.png',
    'Nike.png': 'Nike.png',
    'Nintendo_V2.png': 'Nintendo.png',
    'pacificCoffeeLogo.png': 'Pacific_Coffee.png',
    'Pacific_Coffee.png': 'Pacific_Coffee.png',
    'Pizza_Hut.png': 'Pizza_Hut.png',
    'Playstation.png': 'Playstation.png',
    'playstoreLogo.png': 'Google_Playstore.png',
    'Google_Playstore.png': 'Google_Playstore.png',
    'pnsLogo.png': 'ParkNShop.png',
    'ParkNShop.png': 'ParkNShop.png',
    'razerLogo.png': 'Razer_Gold.png',
    'Razer_Gold_V2.png': 'Razer_Gold.png',
    'saintHonoreLogo.png': 'Saint_Honore.png',
    'Saint_Honore.png': 'Saint_Honore.png',
    'sasaLogo.png': 'Sasa.png',
    'Sasa.png': 'Sasa.png',
    'shellLogo.png': 'Shell.png',
    'Shell.png': 'Shell.png',
    'starbucksLogo.png': 'Starbucks.png',
    'Starbucks.png': 'Starbucks.png',
    'suchPriceLogo.png': 'SuchPrice.png',
    'SuchPrice_V2.png': 'SuchPrice.png',
    'tasteLogo.png': 'Taste.png',
    'Taste.png': 'Taste.png',
    'Watsons.png': 'Watsons.png',
    'wellcome.png': 'wellcome.png',
    'yataLogo.png': 'YATA.png',
    'Yata_V2.png': 'YATA.png',
    'zaloraLogo.png': 'Zalora.png',
    'Zalora_V2.png': 'Zalora.png',
  };

  static const List<String> pnsV1Variants = [
    'park\'nshop',
    'parkn\'shop',
    'parkandshop',
  ];

  static const List<String> dollarValuePattern = [
    '\$200',
    '\$120',
    '\$100',
    '\$50',
    '\$25',
    '\$20',
    '\$10'
  ];

  static const List<String> assetV1StringPattern = [
    '電子禮劵',
    'e-voucher',
    '電子現金劵',
    'gift card',
    'e-gift voucher',
    '\$100',
    '\$120',
    '\$25',
    '\$20',
    '\$50',
    ' zh',
  ];

  static const double MAX_WIDTH_SCREEN = 1440;
  static const double MAX_CAROUSEL_HEIGHT = 608;

  static const int PASSCODE_LENGTH = 6;

  static const EXPIRED_PASSCODE_TOPUP = 60;

  static const double RATIO_MIN_HEIGHT_BOTTOM_SHEET = 0.3125;

  static const NOTIFICATION_BASE_API =
      "https://asia-southeast1-cdmobilestore.cloudfunctions.net/api/";
  static const NOTIFICATION_PAGE_KEY = "NotificationPage";
}
