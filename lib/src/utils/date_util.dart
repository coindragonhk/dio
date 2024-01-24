import 'package:intl/intl.dart';
import '../../main.dart';
import '../data/preferences/app_preferences.dart';
import 'const.dart';
import 'logger.dart';

class DateUtil {
  static final AppPreferences _pref = getIt<AppPreferences>();

  static DateTime? parseStringToDate(String? dateStr,
      {String? format, String? locale, bool isUtc = false}) {
    DateTime? date;
    if (dateStr != null) {
      try {
        date = DateFormat(format /*?? _pref.appLanguageCode*/)
            .parse(dateStr, isUtc);
      } on FormatException catch (e) {
        logger.e(e.toString());
      }
    }
    return date;
  }

  static String parseDateToString(DateTime? dateTime, String format,
      {String? locale}) {
    String date = "";
    if (dateTime != null) {
      try {
        date = DateFormat(format, locale ?? _pref.appLanguageCode)
            .format(dateTime.toLocal());
      } on FormatException catch (e) {
        logger.e(e.toString());
      }
    }
    return date;
  }

  static String? parseStringDateToString(
      String? dateSv, String fromFormat, String toFormat,
      {String? locale}) {
    String? date = dateSv;
    if (dateSv != null) {
      try {
        date = DateFormat(toFormat, locale ?? _pref.appLanguageCode).format(
            DateFormat(fromFormat, locale ?? _pref.appLanguageCode)
                .parse(dateSv));
      } on FormatException catch (e) {
        logger.d(e.toString());
      }
    }
    return date;
  }

  static String? parseStringDateToString2(String? dateSv,
      {String toFormat = Const.DATE_FORMAT, String? locale}) {
    String? date = dateSv;
    if (dateSv != null) {
      try {
        date = DateFormat(toFormat, locale ?? _pref.appLanguageCode)
            .format(DateTime.parse(dateSv));
      } on FormatException catch (e) {
        logger.d(e.toString());
      }
    }
    return date;
  }
}
