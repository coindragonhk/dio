// ignore_for_file: file_names

import '../src/localization/localization.dart';
import 'generated/colors.g.dart';
import 'dimens.dart';
import 'generated/drawables.g.dart';
import 'generated/fonts.g.dart';
import 'generated/strings.g.dart';

class R {
  R._();

  static final drawable = Drawables();
  static final string = Strings();
  static final font = Fonts();
  static final color = Colors();
  static final dimen = Dimens();

  static String tr(
      {required String? en,
      required String? ch,
      required String? th,
      String? sch,
      }) {
    return Localization.isLanguageEn
        ? en ?? ""
        : Localization.isLanguageTch
            ? ch ?? ""
            : Localization.isLanguageSch
                ? sch ?? ""
                : th ?? "";
  }
}
