import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/region_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:universal_html/html.dart' as html;
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/constants.dart';
import '../../model/navigation/navigation.dart';
import '../../res/R.dart';
import 'const.dart';
import 'date_util.dart';
import 'enum.dart';
import 'logger.dart';
import 'navigation_utils.dart';
import 'package:mime/mime.dart';

T? castOrNull<T>(dynamic x) => x is T ? x : null;

T castOrFallback<T>(dynamic x, T fallback) => x is T ? x : fallback;

class Utils {
  static final _random = Random();
  static int nextRandom(int min, int max) => min + _random.nextInt(max - min);

  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      logger.d('Internet not connect');
      return false;
    }
    return false;
  }

  static void showSnackBar(BuildContext context, String? text) {
    if (Utils.isEmpty(text)) return;
    final snackBar = SnackBar(
      content: Text(text ?? ""),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static void showErrorSnackBar(BuildContext context, String? text) {
    onWidgetDidBuild(() => showSnackBar(context, text));
  }

  static Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      logger.e(e);
      // Error in getting access to the file.
    }
  }

  // static String getTypeUrlLauncher(String url, LaunchType type) {
  //   switch (type) {
  //     case LaunchType.LAUNCH_TYPE_WEB:
  //       return url;
  //     case LaunchType.LAUNCH_TYPE_EMAIL:
  //       return "mailto:$url";
  //     case LaunchType.LAUNCH_TYPE_PHONE:
  //       return "tel:$url";
  //     case LaunchType.LAUNCH_TYPE_SMS:
  //       return "sms:$url";
  //   }
  //   return url;
  // }
  //
  // static Future launchURL(String url) async {
  //   url = url.replaceAll(" ", "");
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     logger.d('Đã có lỗi xảy ra');
  //   }
  // }

  static String? getMimeType(String path) {
    return lookupMimeType(path);
  }

  static bool isEmpty(Object? text) {
    if (text is String) return text.isEmpty;
    if (text is List) return text.isEmpty;
    return text == null;
  }

  static String? subString(String? text, int maxLengthCut) {
    return (text != null && text.length > maxLengthCut)
        ? text.substring(0, maxLengthCut)
        : text;
  }

  static bool isEmptyArray(List? list) {
    return list == null || list.isEmpty;
  }

  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

  static Color parseStringToColor(String? color, {Color? defaultColor}) {
    if (Utils.isEmpty(color))
      return defaultColor ?? Colors.black;
    else
      return Color(int.parse('0xff' + color!.trim().substring(1)));
  }

  static void showDialogTwoButtonAfterLayout(
      {required BuildContext context,
      required String? title,
      required Widget contentWidget,
      required List<Widget> actions}) async {
    onWidgetDidBuild(() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              title: title != null ? Text(title) : null,
              content: contentWidget,
              actions: actions);
        }));
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static int? convertPriceToNumber(String? price) {
    if (price == null) return null;
    String newPrice = price
        .replaceAll(" ", "")
        .replaceAll("đ", "")
        .replaceAll("₫", "")
        .replaceAll("\$", "")
        .replaceAll(",", "");
    try {
      return int.parse(newPrice);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  static String formatMoney(dynamic amount) {
    amount ??= 0.0;
    if (amount is String) {
      amount = double.parse(amount);
    }
    if (amount == 0) amount = 0.0;
    return (amount as num).toStringAsFixed(1);
  }

  static void copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static navigateNextFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String getFileNameFromFile(File file) {
    return basename(file.path);
  }

  static String getFileName(String path) {
    return basenameWithoutExtension(path);
  }

  static String? base64Image(File? file) {
    if (file == null) return null;
    List<int> imageBytes = file.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  //
  // static String timeAgo(String? time) {
  //   if (Utils.isEmpty(time)) return "";
  //   return timeago.format(DateTime.parse(time!), locale: LocaleType.EN.name.toLowerCase());
  // }
  //
  // static String timeAgoByDate(DateTime? dateTime, {String? locale}) {
  //   if (Utils.isEmpty(dateTime)) return "";
  //   timeago.setLocaleMessages(
  //     locale ?? LocaleType.EN.name.toLowerCase(),
  //     TimeagoLookupMessagesWithoutPrefix(),
  //   );
  //   return timeago.format(dateTime!, locale: locale);
  // }
  //
  // static String timeAgoCustom(DateTime? dateTime) {
  //   if (Utils.isEmpty(dateTime)) return "";
  //   return TimeAgo.timeAgoSinceDate(dateTime!, numericDates: false);
  // }
  //
  // static String timeAgoForComment(DateTime? dateTime) {
  //   if (Utils.isEmpty(dateTime)) return "";
  //   timeago.setDefaultLocale(LocaleType.EN.name.toLowerCase());
  //   return timeago.format(dateTime!, locale: LocaleType.EN.name.toLowerCase());
  // }

  static Future<Map<String, dynamic>> parseJson(String fileName) async {
    return jsonDecode(await rootBundle.loadString("assets/$fileName"));
  }

  static Future<String> loadStringTranslations(String fileName) async {
    return await rootBundle.loadString("lib/res/translations/$fileName");
  }

  static String getPhoneNumber(String? phoneNumber, String countryCode) {
    String? phone = phoneNumber?.trim();
    if (phone?.startsWith("0") == true) {
      phone = phone?.substring(1, phone.length);
    }
    phone = "${countryCode}$phone";
    phone = phone.replaceAll("+", "");
    return phone;
  }

  static String getAddress(
      {String? address,
      String? ward,
      String? district,
      String? province,
      String? city,
      String? country}) {
    String result = "";
    if (!Utils.isEmpty(address)) {
      result += address!;
    }
    if (!Utils.isEmpty(ward)) {
      if (!Utils.isEmpty(result)) result += ", ";
      result += ward!;
    }
    if (!Utils.isEmpty(district)) {
      if (!Utils.isEmpty(result)) result += ", ";
      result += district!;
    }
    if (!Utils.isEmpty(city)) {
      if (!Utils.isEmpty(result)) result += ", ";
      result += city!;
    }
    if (!Utils.isEmpty(province)) {
      if (!Utils.isEmpty(result)) result += ", ";
      result += province!;
    }
    if (!Utils.isEmpty(country)) {
      if (!Utils.isEmpty(result)) result += ", ";
      result += country!;
    }
    return result;
  }

  static String getTextBreakLine(List<String?> listText) {
    String result = "";
    listText.forEach((element) {
      int index = listText.indexOf(element);
      if (index == 0) {
        result += listText[0] ?? "";
      } else {
        if (!Utils.isEmpty(listText[index])) {
          if (!Utils.isEmpty(result)) result += "\n";
          result += listText[index]!;
        }
      }
    });
    return result;
  }

  static String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static String getPhoneNumberNonPrefix(
      String phoneNumber, String countryCode) {
    if (countryCode.startsWith("+")) {
      countryCode = countryCode.substring(1);
    }
    return phoneNumber.substring(countryCode.length);
  }

  static String getCountryCode(
      String phoneNumber, List<String> listNationalityCode) {
    if (phoneNumber.startsWith("+")) {
      phoneNumber = phoneNumber.substring(1);
    }
    String threeFirstChars = "";
    String twoFirstChars = "";
    String oneFirstChars = "";
    if (phoneNumber.length > 3) {
      threeFirstChars = phoneNumber.substring(0, 3);
      twoFirstChars = phoneNumber.substring(0, 2);
      oneFirstChars = phoneNumber.substring(0, 1);
    } else if (phoneNumber.length > 2) {
      twoFirstChars = phoneNumber.substring(0, 2);
      oneFirstChars = phoneNumber.substring(0, 1);
    } else if (phoneNumber.length > 1) {
      oneFirstChars = phoneNumber.substring(0, 1);
    }
    String code = "";
    if (!Utils.isEmpty(threeFirstChars)) {
      try {
        code = listNationalityCode.firstWhere(
            (element) => element.substring(1).startsWith(threeFirstChars));
      } catch (e) {}
      if (!Utils.isEmpty(code)) {
        return code;
      }
    }
    if (!Utils.isEmpty(twoFirstChars)) {
      try {
        code = listNationalityCode.firstWhere(
            (element) => element.substring(1).startsWith(twoFirstChars));
      } catch (e) {}
      if (!Utils.isEmpty(code)) {
        return code;
      }
    }
    if (!Utils.isEmpty(oneFirstChars)) {
      try {
        code = listNationalityCode.firstWhere(
            (element) => element.substring(1).startsWith(oneFirstChars));
      } catch (e) {}
      if (!Utils.isEmpty(code)) {
        return code;
      }
    }
    return code;
  }

  static convertTimeFormat(int hour, int minute) {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  static String getTransactionId(
      DateTime? time, String kioskId, int receiptCustomerNo) {
    return "${DateUtil.parseDateToString(time, Const.DATE_RECEIPT_NO_FORMAT)}-$kioskId-${receiptCustomerNo.toString().padLeft(3, '0')}";
  }

  static int getReceiptCustomerNo() {
    Random random = Random();
    return (random.nextInt(998) + 1);
  }

  static String convertKioskTime(String time) {
    List<String> times = time.split("-");
    return times
        .map((e) => DateUtil.parseStringDateToString(
              e
                  .trim()
                  .replaceAll("am", "AM")
                  .replaceAll("pm", "PM")
                  .replaceAll(" ", ""),
              Const.DATE_KIOSK_AVAILABLE_FORMAT,
              Const.DATE_TIME_FORMAT_TIME_24,
            ))
        .toList()
        .join(" - ")
        .toUpperCase();
  }

  static Future launchURL(String url,
      {LaunchMode mode = kIsWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication}) async {
    url = url.replaceAll(" ", "%20");
    try {
      await launchUrl(Uri.parse(url), mode: mode);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  static Future launchURL_V2(String url,
      {LaunchMode mode = kIsWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication}) async {
    //url = url.replaceAll(" ", "%20");
    try {
      // _self to ensure it uses the same window and not open new tab;
      await launchUrl(Uri.parse(url), mode: mode, webOnlyWindowName: '_self');
    } catch (e) {
      logger.e(e.toString());
    }
  }

  static String prefixPhoneNumber() {
    String prefix = "+852";
    if (Globals.REGION == "HK") {
      prefix = "+852 ";
    } else if (Globals.REGION == "SG") {
      prefix = "+65 ";
    } else if (Globals.REGION == "TH") {
      prefix = "+66 ";
    }
    return prefix;
  }

  static int getPhoneLength() {
    int length = 8;
    if (Globals.REGION == "HK") {
      length = 8;
    } else if (Globals.REGION == "SG") {
      length = 8;
    } else if (Globals.REGION == "TH") {
      length = 9;
    }
    return length;
  }

  static String appendPrefixPhoneNumber(String phoneNumber) {
    return prefixPhoneNumber() + phoneNumber;
  }

  static String generateRandomString(int length) {
    final _random = Random();
    const _availableChars = '1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();
    return randomString;
  }

  static void rewriteUrl(int index) {
    String? route;
    if (index == 1) {
      route = Routes.ROUTE_MY_VOUCHERS;
    } else if (index == 2) {
      route = Routes.ROUTE_TRANSACTION_HISTORY;
    } else if (index == 3) {
      route = Routes.ROUTE_TOP_UP;
    } else if (index == 4) {
      route = Routes.ROUTE_USER_SETTING;
    }
    html.window.history
        .replaceState(null, "", !Utils.isEmpty(route) ? '#/$route' : "#/");
  }

  static Future<void> changeCaptchaVisibility(bool showBagde) async {
    if (!kIsWeb) return;
    var badge = html.document.querySelector(".grecaptcha-badge");
    if (badge == null) return;
    badge.style.zIndex = "10";
    badge.style.visibility = showBagde ? "visible" : "hidden";
  }

  static void showToast(BuildContext context, String? text,
      {ToastType? type = ToastType.ERROR}) {
    onWidgetDidBuild(() {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.removeQueuedCustomToasts();
      Widget toast = Container(
        width: 1.sw,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: type == ToastType.ERROR
                ? R.color.lightRedBackground
                : R.color.green),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(text ?? "",
                  style: Theme.of(context).textTheme.normal16Style),
            ),
          ],
        ),
      );

      if (!Utils.isEmpty(text)) {
        fToast.showToast(
          child: toast,
          gravity: ToastGravity.TOP,
          positionedToastBuilder: (context, child) {
            return Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 0,
              child: child,
            );
          },
          toastDuration: const Duration(seconds: 3),
        );
      }
    });
  }

  static bool isMobSmall(BuildContext context) =>
      kIsWeb && (MediaQuery.of(context).size.width < 450);

  static bool isDesktopWeb(BuildContext context) =>
      kIsWeb && ResponsiveBreakpoints.of(context).isDesktop;

  static bool isRegionSG(BuildContext context) =>
      Provider.of<AppLocale>(context).locale.countryCode?.toUpperCase() == "SG";

  static bool isRegionHK(BuildContext context) =>
      Provider.of<AppLocale>(context).locale.countryCode?.toUpperCase() == "HK";

  static bool isRegionTH(BuildContext context) =>
      Provider.of<AppLocale>(context).locale.countryCode?.toUpperCase() == "TH";

  static double getZoomLevel(double radius) {
    double zoomLevel = Const.DEFAULT_ZOOM_LEVEL;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.tryParse(zoomLevel.toStringAsFixed(2)) ??
        Const.DEFAULT_ZOOM_LEVEL;
    return zoomLevel;
  }

  static Future<String> getDeviceId() async {
    return (await PlatformDeviceId.getDeviceId) ?? "";
  }

  static void showForegroundNotification(
      BuildContext context, String title, String body,
      {required VoidCallback onTapNotification}) {
    showOverlayNotification((context) {
      return Card(
        color: R.color.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          bottom: false,
          child: InkWell(
            onTap: () {
              OverlaySupportEntry.of(context)!.dismiss();
              onTapNotification.call();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(R.drawable.ic_notification_foreground,
                                width: 32.w),
                            SizedBox(width: 10.w),
                            Text(
                              R.string.app_name.tr(),
                              style:
                                  Theme.of(context).textTheme.semiBold15Style,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.semiBold15Style,
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          body,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.normal13Style,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close, color: R.color.white),
                      onPressed: () {
                        OverlaySupportEntry.of(context)!.dismiss();
                      })
                ],
              ),
            ),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 4000));
  }
}
