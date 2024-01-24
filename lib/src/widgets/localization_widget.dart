import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/main.dart';
import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart';
import 'package:dtg_web_admin/src/localization/localization.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

// ignore: must_be_immutable
class LocalizationDialog extends StatefulWidget {
  final Function onChangeLanguage;
  final Function onChangeRegion;
  late LanguageType currentLanguage;
  late RegionOptions currentRegion;
  final AppPreferences _pref = getIt<AppPreferences>();

  LocalizationDialog({
    super.key,
    required this.onChangeLanguage,
    required this.onChangeRegion,
  }) {
    currentLanguage = Localization.isLanguageEn
        ? LanguageType.ENGLISH
        : Localization.isLanguageSch
            ? LanguageType.SCHINESE
            : Localization.isLanguageTch
                ? LanguageType.TCHINESE
                : LanguageType.THAI;

    currentRegion = Globals.REGION == 'SG'
        ? RegionOptions.SINGAPORE
        : Globals.REGION == 'TH'
            ? RegionOptions.THAILAND
            : RegionOptions.HONG_KONG;
  }

  @override
  State<LocalizationDialog> createState() => _LocalizationDialogState();
}

class _LocalizationDialogState extends State<LocalizationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: PointerInterceptor(
          child: Stack(
            children: [
              Container(
                // width: Utils.isDesktopWeb(context) ? 844 : double.infinity,
                width: Utils.isDesktopWeb(context) ? 672 : double.infinity,
                padding: EdgeInsets.only(
                    left:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 88 : 20) : 20.w,
                    right:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 88 : 20) : 20.w,
                    top:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 28 : 18) : 18.w,
                    bottom: kIsWeb
                        ? (Utils.isDesktopWeb(context) ? 40 : 16)
                        : 12.w),
                decoration: BoxDecoration(
                    color: R.color.colorVoucherBackground,
                    borderRadius: BorderRadius.circular(kIsWeb ? 12 : 8),
                    border: Border.all(
                        color: R.color.darkRed, width: kIsWeb ? 4 : 2)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          titleWidget(context),
                          SizedBox(
                            height: kIsWeb ? 6 : 18.w,
                          ),
                          currentLocationWidget(context, widget.currentRegion,
                              ValueKey(widget.currentRegion)),
                          SizedBox(
                            height: kIsWeb ? 23 : 18.w,
                          ),
                          changeLanguageWidget(context),
                          SizedBox(
                            height: kIsWeb ? 32 : 23.w,
                          ),
                          changeRegionWidget(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: kIsWeb ? (Utils.isDesktopWeb(context) ? 40 : 34) : 20.w,
                right: kIsWeb ? (Utils.isDesktopWeb(context) ? 30 : 24) : 20.w,
                child: SingleTapDetector(
                  onTap: () {
                    NavigationUtils.popPage(context);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.all(Utils.isDesktopWeb(context) ? 0 : 4),
                    child: Image.asset(
                      R.drawable.ic_close_large,
                      width: kIsWeb
                          ? (Utils.isDesktopWeb(context) ? 30 : 22)
                          : 20.w,
                      height: kIsWeb
                          ? (Utils.isDesktopWeb(context) ? 30 : 22)
                          : 20.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget flagLocationWidget(
      BuildContext context, RegionOptions region, Key? key) {
    return Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: Utils.isDesktopWeb(context) ? 12 : 1.w),
          Image.asset(
            region == RegionOptions.SINGAPORE
                ? R.drawable.ic_SG
                : region == RegionOptions.THAILAND
                    ? R.drawable.ic_TH
                    : R.drawable.ic_HK, // fix R.drawable.ic_TH
            height: Utils.isDesktopWeb(context) ? 50.w : 50.w,
            width: Utils.isDesktopWeb(context) ? 75.w : 75.w,
          ),
          SizedBox(width: Utils.isDesktopWeb(context) ? 12 : 20.w),
          Text(
            region == RegionOptions.SINGAPORE
                ? R.string.singapore.tr()
                : region == RegionOptions.THAILAND
                    ? R.string.thailand.tr()
                    : R.string.hongkong.tr(), // fix R.string.thailand.tr()
            style: kIsWeb && Utils.isDesktopWeb(context)
                ? Theme.of(context).textTheme.valueStyle2(context)
                : Theme.of(context).textTheme.normal16Style,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: Utils.isDesktopWeb(context) ? 12 : 1.w),
        ]);
  }

  Widget titleWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language_outlined,
              size: kIsWeb && Utils.isDesktopWeb(context) ? 60 : 140.w,
              color: Colors.white,
            ),
            SizedBox(width: kIsWeb ? 12 : 12.w),
            Text(
              R.string.label_language_and_region.tr(),
              // "Language & Region",
              // style: kIsWeb && Utils.isDesktopWeb(context) ? 40 : 40.sp,
              style: kIsWeb && Utils.isDesktopWeb(context)
                  ? Theme.of(context).textTheme.semiBold28Style
                  : Theme.of(context).textTheme.semiBold20Style,
            ),
          ],
        ),
      ],
    );
  }

  Widget currentLocationWidget(
      BuildContext context, RegionOptions currentRegion, key) {
    return Utils.isDesktopWeb(context)
        ? Row(
            key: key,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: kIsWeb ? 80 : 60.w,
                child: Text(
                  R.string.current.tr(),
                  // "Current:",
                  style: kIsWeb
                      ? Theme.of(context).textTheme.normal16Style
                      : Theme.of(context).textTheme.normal15StyleAdaptive,
                ),
              ),
              flagLocationWidget(context, widget.currentRegion,
                  ValueKey(widget.currentRegion)),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: kIsWeb ? 70 : 60.w,
                child: Text(
                  // R.string.account.tr(),
                  // R.string.current.tr(),
                  "Current:",
                  style: kIsWeb
                      ? Theme.of(context).textTheme.normal16Style
                      : Theme.of(context).textTheme.normal15StyleAdaptive,
                ),
              ),
              // SizedBox(width: kIsWeb ? 12 : 12.w),
              flagLocationWidget(context, widget.currentRegion,
                  ValueKey(widget.currentRegion)),
            ],
          );
  }

  Widget changeLanguageWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          R.string.select_language.tr(), // fix
          // "Select Language",
          style: kIsWeb
              ? Theme.of(context).textTheme.textNormal(context)
              : Theme.of(context).textTheme.semiBold18StyleAdaptive,
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 12.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ButtonWidget(
                title: Utils.isRegionHK(context)
                    ? "繁體"
                    : Utils.isRegionSG(context)
                        ? "简体"
                        : "ภาษาไทย",
                // width: Utils.isDesktopWeb(context)?134 : 110,
                height: Utils.isDesktopWeb(context) ? 40 : 40,
                width: Utils.isDesktopWeb(context) ? 80 : 60,
                filledBackground: Utils.isRegionHK(context)
                    ? widget.currentLanguage == LanguageType.TCHINESE
                    : Utils.isRegionSG(context)
                        ? widget.currentLanguage == LanguageType.SCHINESE
                        : widget.currentLanguage == LanguageType.THAI,
                onPressed: () {
                  /*if ((Utils.isRegionHK(context) &&
                          (widget.currentLanguage == LanguageType.TCHINESE)) ||
                      (Utils.isRegionSG(context) &&
                          (widget.currentLanguage == LanguageType.SCHINESE)) ||
                      (Utils.isRegionTH(context) &&
                          (widget.currentLanguage == LanguageType.THAI))) {
                    return;
                  }*/
                  widget.onChangeLanguage.call(index: 0);
                }),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
            ButtonWidget(
                title: "English", //R.string.label_english.tr(),
                height: Utils.isDesktopWeb(context) ? 40 : 40,
                width: Utils.isDesktopWeb(context) ? 100 : 80,
                filledBackground:
                    widget.currentLanguage == LanguageType.ENGLISH,
                onPressed: () {
                  if (widget.currentLanguage == LanguageType.ENGLISH) {
                    return;
                  }
                  print(
                      "my current locale: ${context.locale.toStringWithSeparator()}");
                  widget.onChangeLanguage.call(index: 0);
                }),
          ],
        ),
      ],
    );
  }

  Widget changeRegionWidget(BuildContext context) {
    List<Widget> regionButtons = [];

    for (RegionOptions region in RegionOptions.values) {
      if (region == widget.currentRegion) continue;
      regionButtons.add(
        ButtonWidget(
          title: region.toString(),
          width: Utils.isDesktopWeb(context)
              ? 223
              : Utils.isMobSmall(context)
                  ? 140
                  : 197,
          height: Utils.isDesktopWeb(context) ? null : 90,
          child: flagLocationWidget(
              context, region, ValueKey(widget.currentRegion)),
          onPressed: () {
            setState(() {
              widget.currentRegion = region;
            });
            widget.onChangeRegion.call(region);
          },
        ),
      );
      regionButtons.add(
        SizedBox(
            width: kIsWeb
                ? 23
                : Utils.isMobSmall(context)
                    ? 8.w
                    : 16.w),
      );
    }
    regionButtons.removeLast();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.grey,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(R.string.label_or_change_region.tr(), // fix
                  // "Or change region",
                  style: kIsWeb
                      ? Theme.of(context).textTheme.textNormal(context)
                      : Theme.of(context).textTheme.semiBold18StyleAdaptive),
            ),
            const Expanded(
              child: Divider(
                color: Colors.grey,
                height: 2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 23 : 8) : 18.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: regionButtons,
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 4.w,
        ),
      ],
    );
  }
}
