import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../res/R.dart';
import 'utils.dart';

extension CustomTheme on TextTheme {
  TextStyle get large40ButtonStyle => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 40 : 40.sp,
      fontWeight: FontWeight.w600,
      height: 48.41 / 41);

  TextStyle get semiBold16Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 16 : 16.sp,
      fontWeight: FontWeight.w600,
      height: 19.36 / 16);

  TextStyle get semiBold16StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      height: 19.36 / 16);

  TextStyle get bold16Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 16 : 16.sp,
      fontWeight: FontWeight.bold,
      height: 19.36 / 16);

  TextStyle get semiBold15Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 15 : 15.sp,
      fontWeight: FontWeight.w600,
      height: 18.15 / 15);

  TextStyle get semiBold13Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 13 : 13.sp,
      fontWeight: FontWeight.w600,
      height: 15.73 / 13);

  TextStyle get semiBold12Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 12 : 12.sp,
      fontWeight: FontWeight.w600,
      height: 14.52 / 12);

  TextStyle get semiBold32Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 32 : 32.sp,
      fontWeight: FontWeight.w600,
      height: 38.73 / 32);

  TextStyle get semiBold35Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 35 : 35.sp,
      fontWeight: FontWeight.w600,
      height: 42.36 / 35);

  TextStyle get semiBold22Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 22 : 22.sp,
      fontWeight: FontWeight.w600,
      height: 26.63 / 22);

  TextStyle get semiBold24Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 24 : 24.sp,
      fontWeight: FontWeight.w600,
      height: 29.05 / 24);

  TextStyle get semiBold25Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 25 : 25.sp,
      fontWeight: FontWeight.w600,
      height: 30.26 / 25);

  TextStyle get semiBold25StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 25.sp,
      fontWeight: FontWeight.w600,
      height: 30.26 / 25);

  TextStyle get bold35Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 35 : 35.sp,
      fontWeight: FontWeight.w700,
      height: 42.36 / 35);

  TextStyle get bold24Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 24 : 24.sp,
      fontWeight: FontWeight.w700,
      height: 29.05 / 24);

  TextStyle get bold22Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 22 : 22.sp,
      fontWeight: FontWeight.w700,
      height: 26.63 / 22);

  TextStyle get bold30Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 30 : 30.sp,
      fontWeight: FontWeight.w700,
      height: 36.31 / 30);

  TextStyle get bold40Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 40 : 40.sp,
      fontWeight: FontWeight.w700,
      height: 48.41 / 48);

  TextStyle get bold48Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 48 : 48.sp,
      fontWeight: FontWeight.w700,
      height: 58.09 / 48);

  TextStyle get semiBold17Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 17 : 17.sp,
      fontWeight: FontWeight.w600,
      height: 20.57 / 17);

  TextStyle get semiBold18Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 18 : 18.sp,
      fontWeight: FontWeight.w600,
      height: 21.78 / 18);

  TextStyle get semiBold18StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      height: 21.78 / 18);

  TextStyle get bold18Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 18 : 18.sp,
      fontWeight: FontWeight.w700,
      height: 21.78 / 18);

  TextStyle get semiBold20Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 20 : 20.sp,
      fontWeight: FontWeight.w600,
      height: 24 / 20);

  TextStyle get semiBold20StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      height: 24 / 20);

  TextStyle get bold20Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 20 : 20.sp,
      fontWeight: FontWeight.bold,
      height: 24 / 20);

  TextStyle get bold26Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 26 : 26.sp,
      fontWeight: FontWeight.bold,
      height: 31.47 / 26);

  TextStyle get semiBold28Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 28 : 28.sp,
      fontWeight: FontWeight.w600,
      height: 33.89 / 28);

  TextStyle get normal28Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 28 : 28.sp,
      fontWeight: FontWeight.w500,
      height: 33.89 / 28);

  TextStyle get normal19Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 19 : 19.sp,
      fontWeight: FontWeight.w500,
      height: 22.9 / 19);

  TextStyle get normal18Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 18 : 18.sp,
      fontWeight: FontWeight.w500,
      height: 21.78 / 18);

  TextStyle get normal16Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 16 : 16.sp,
      fontWeight: FontWeight.w500,
      height: 19.36 / 16);

  TextStyle get normal16StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: 19.36 / 16);

  TextStyle get normal17Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 17 : 17.sp,
      fontWeight: FontWeight.w500,
      height: 20.57 / 17);

  TextStyle get normal15Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 15 : 15.sp,
      fontWeight: FontWeight.w500,
      height: 18.15 / 15);

  TextStyle get normal15StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      height: 18.15 / 15);

  TextStyle get semiBold15StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      height: 18.15 / 15);

  TextStyle get normal12Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 12 : 12.sp,
      fontWeight: FontWeight.w500,
      height: 14.52 / 12);

  TextStyle get regular12Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 12 : 12.sp,
      fontWeight: FontWeight.w400,
      height: 14.52 / 12);

  TextStyle get light12Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 14.52 / 12);

  TextStyle get normal22Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 22 : 22.sp,
      fontWeight: FontWeight.w500,
      height: 26.63 / 22);

  TextStyle get regular18Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 18 : 18.sp,
      fontWeight: FontWeight.w400,
      height: 21.78 / 18);

  TextStyle get regular15StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      height: 18.15 / 15);

  TextStyle get regular15Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 15 : 15.sp,
      fontWeight: FontWeight.w400,
      height: 18.15 / 15);

  TextStyle get regular14Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 14 : 14.sp,
      fontWeight: FontWeight.w400,
      height: 16.94 / 14);

  TextStyle get regular16Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 16 : 16.sp,
      fontWeight: FontWeight.w400,
      height: 19.36 / 16);

  TextStyle get light16Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 16 : 16.sp,
      fontWeight: FontWeight.w300,
      height: 19.36 / 16);

  TextStyle get normal13Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 13 : 13.sp,
      fontWeight: FontWeight.w500,
      height: 15.73 / 13);

  TextStyle get normal13StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      height: 15.73 / 13);

  TextStyle get normal14Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 14 : 14.sp,
      fontWeight: FontWeight.w500,
      height: 16.94 / 14);

  TextStyle get regular13Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 13 : 13.sp,
      fontWeight: FontWeight.w400,
      height: 15.73 / 13);

  TextStyle get regular13StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      height: 15.73 / 13);

  TextStyle get normal14StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: 16.94 / 14);

  TextStyle get normal24Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 24 : 24.sp,
      fontWeight: FontWeight.w500,
      height: 29.05 / 24);

  TextStyle get semiBold24StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 24.w,
      fontWeight: FontWeight.w600,
      height: 29.05 / 24);

  TextStyle get semiBold14StyleAdaptive => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      height: 16.94 / 14);

  TextStyle get normal20Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: kIsWeb ? 20 : 20.sp,
      fontWeight: FontWeight.w500,
      height: 24.2 / 20);

  TextStyle get title2Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 39 / 32);

  TextStyle get titleLarge30Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 36.31 / 30);

  TextStyle get semiBold40Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      height: 48 / 40);

  TextStyle get normal40Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 40,
      fontWeight: FontWeight.w500,
      height: 48 / 40);

  TextStyle get semiBold48Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 48,
      fontWeight: FontWeight.w600,
      height: 58.09 / 48);

  TextStyle get largeTextStyle => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 48 / 40);

  TextStyle get largeText32Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 39 / 32);

  TextStyle get largeText24Style => GoogleFonts.inter(
      color: R.color.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 29.05 / 24);

  TextStyle textSemiBoldButton(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold18Style : semiBold15Style;

  TextStyle textNormalButton(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal18Style : normal15Style;

  TextStyle textFieldStyle(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold18Style : semiBold16Style;

  TextStyle searchStyle(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold20Style : semiBold16Style;

  TextStyle valueStyle(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold20Style : semiBold18Style;

  TextStyle valueStyle2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold16Style : normal15Style;

  TextStyle textButton2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold20Style : semiBold15Style;

  TextStyle textSending(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold20Style : normal18Style;

  TextStyle textLabel(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? bold35Style : semiBold22Style;

  TextStyle textTitle(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold24Style : semiBold18Style;

  TextStyle boldTitle(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? bold24Style : bold22Style;

  TextStyle textTitle2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold24Style : semiBold20Style;

  TextStyle textTitle3(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal24Style : semiBold18Style;

  TextStyle boldTitle2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? bold24Style : bold18Style;

  TextStyle textNormal(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal19Style : normal15Style;

  TextStyle textNormal2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal19Style : semiBold15Style;

  TextStyle textLight3(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? light16Style : light12Style;

  TextStyle textRegular3(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? regular16Style : regular12Style;

  TextStyle textNormal3(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal16Style : normal12Style;

  TextStyle textRegular4(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? regular16Style : regular14Style;

  TextStyle textNormal4(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal16Style : normal14Style;

  TextStyle textNormal5(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal18Style : normal16Style;

  TextStyle textNormal6(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal20Style : normal16Style;

  TextStyle textNormal7(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal20Style : normal15Style;

  TextStyle textDescription(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal24Style : normal15Style;

  TextStyle textDescription2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal18Style : normal15Style;

  TextStyle textDescription3(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal16Style : normal15Style;

  TextStyle textNormalSmall(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal15Style : normal13Style;

  TextStyle textRegularSmall(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? regular15Style : regular13Style;

  TextStyle textSmall400(BuildContext context) =>
      (kIsWeb && Utils.isDesktopWeb(context) ? normal15Style : normal13Style)
          .copyWith(fontWeight: FontWeight.w400);

  TextStyle regularTextDescription(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? regular18Style : regular16Style;

  TextStyle regularTextDescription2(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? regular18Style : regular15Style;

  TextStyle textSemiBoldHuge(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? semiBold40Style : semiBold28Style;

  TextStyle textNormalHuge(BuildContext context) =>
      kIsWeb && Utils.isDesktopWeb(context) ? normal40Style : normal28Style;
}
