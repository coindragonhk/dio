import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsTopUpDialog extends StatelessWidget {
  final OptionsData optionsData;
  final VoidCallback? onTapFindKiosk;

  const OptionsTopUpDialog(
      {super.key, required this.optionsData, this.onTapFindKiosk});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 1188,
          padding: Utils.isDesktopWeb(context)
              ? const EdgeInsets.only(left: 86, top: 40, right: 40, bottom: 40)
              : const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: R.color.colorLightGrey,
              borderRadius:
                  BorderRadius.circular(Utils.isDesktopWeb(context) ? 40 : 20),
              border: Border.all(color: R.color.darkRed, width: 4)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: Utils.isDesktopWeb(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 11),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Utils.isDesktopWeb(context) ? 16 : 12),
                                border: Border.all(
                                    width: 4,
                                    color: optionsData
                                        .getBorderTagColorTopUpDialog())),
                            child: Image.asset(
                              optionsData.getLogoTopUpDialog(),
                              width: Utils.isDesktopWeb(context) ? 130 : 73,
                              height: Utils.isDesktopWeb(context) ? 50 : 28,
                            ),
                          ),
                          SizedBox(
                            width: Utils.isDesktopWeb(context) ? 16 : 10,
                          ),
                          Expanded(
                            child: Text(
                              optionsData.getTitleTopUpDialog().tr(),
                              style: Utils.isDesktopWeb(context)
                                  ? Theme.of(context).textTheme.bold35Style
                                  : Theme.of(context).textTheme.bold22Style,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleTapDetector(
                      onTap: () {
                        NavigationUtils.popPage(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.all(Utils.isDesktopWeb(context) ? 0 : 4),
                        child: Image.asset(
                          R.drawable.ic_close_large,
                          width: Utils.isDesktopWeb(context) ? 30 : 22,
                          height: Utils.isDesktopWeb(context) ? 30 : 22,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Utils.isDesktopWeb(context) ? 30 : 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 46),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text: optionsData.getDescTopUpDialog().tr()),
                      const TextSpan(text: " "),
                      TextSpan(
                          text: optionsData.getDescSuffixTopUpDialog().tr(),
                          style: (Utils.isDesktopWeb(context)
                                  ? Theme.of(context).textTheme.semiBold24Style
                                  : Theme.of(context).textTheme.semiBold15Style)
                              .copyWith(
                            decoration: TextDecoration.underline,
                          ))
                    ]),
                    style: Utils.isDesktopWeb(context)
                        ? Theme.of(context).textTheme.normal24Style
                        : Theme.of(context).textTheme.normal15Style,
                  ),
                ),
                SizedBox(
                  height: Utils.isDesktopWeb(context) ? 40 : 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    runSpacing: 20,
                    spacing: Utils.isDesktopWeb(context) ? 189 : 0,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Utils.isRegionHK(context)
                                ? R.drawable.img_coin_lineup_hk
                                : Utils.isRegionSG(context)
                                    ? R.drawable.img_coin_lineup_sg
                                    : R.drawable.img_coin_lineup_th,
                            width: Utils.isDesktopWeb(context)
                                ? (Utils.isRegionSG(context) ? 660 : 327)
                                : 315,
                            height: Utils.isDesktopWeb(context) ? 123 : 69,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            Utils.isRegionHK(context)
                                ? R.string.label_coins_hkd.tr()
                                : Utils.isRegionSG(context)
                                    ? R.string.label_coins_sgd.tr()
                                    : R.string.label_coins_thb.tr(),
                            style: Utils.isDesktopWeb(context)
                                ? Theme.of(context).textTheme.regular18Style
                                : Theme.of(context).textTheme.normal15Style,
                          ),
                          if (Utils.isDesktopWeb(context)) ...[
                            _rowFee(
                                context,
                                R.tr(
                                    en: optionsData.coinFeeTagEn ?? "",
                                    th: optionsData.coinFeeTagTh ?? "",
                                    ch: optionsData.coinFeeTagCh ?? "")),
                            const SizedBox(
                              height: 10,
                            ),
                            _rangeDeposit(context, optionsData.coinMin,
                                optionsData.coinLimit)
                          ] else ...[
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                _rowFee(
                                    context,
                                    R.tr(
                                        en: optionsData.coinFeeTagEn ?? "",
                                        th: optionsData.coinFeeTagTh ?? "",
                                        ch: optionsData.coinFeeTagCh ?? "")),
                                const Spacer(),
                                _rangeDeposit(context, optionsData.coinMin,
                                    optionsData.coinLimit)
                              ],
                            )
                          ]
                        ],
                      ),
                      !Utils.isRegionSG(context)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Utils.isRegionHK(context)
                                      ? R.drawable.img_hk_banknote_series
                                      : R.drawable.img_th_banknote_series,
                                  width:
                                      Utils.isDesktopWeb(context) ? 327 : 315,
                                  height:
                                      Utils.isDesktopWeb(context) ? 123 : 118,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  R.string.label_notes_hkd.tr(),
                                  style: Utils.isDesktopWeb(context)
                                      ? Theme.of(context)
                                          .textTheme
                                          .regular18Style
                                      : Theme.of(context)
                                          .textTheme
                                          .normal15Style,
                                ),
                                if (Utils.isDesktopWeb(context)) ...[
                                  _rowFee(
                                      context,
                                      R.tr(
                                          en: optionsData.noteFeeTagEn ?? "",
                                          th: optionsData.noteFeeTagTh ?? "",
                                          ch: optionsData.noteFeeTagCh ?? "")),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _rangeDeposit(context, optionsData.noteMin,
                                      optionsData.noteLimit)
                                ] else ...[
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      _rowFee(
                                          context,
                                          R.tr(
                                              en: optionsData.noteFeeTagEn ??
                                                  "",
                                              th: optionsData.noteFeeTagTh ??
                                                  "",
                                              ch: optionsData.noteFeeTagCh ??
                                                  "")),
                                      const Spacer(),
                                      _rangeDeposit(
                                          context,
                                          optionsData.noteMin,
                                          optionsData.noteLimit)
                                    ],
                                  )
                                ]
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                if (!optionsData.isBankDeposit()) ...[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    optionsData.getNoteTopUpDialog().tr(),
                    style: Utils.isDesktopWeb(context)
                        ? Theme.of(context).textTheme.normal20Style
                        : Theme.of(context).textTheme.regular14Style,
                  ),
                ],
                SizedBox(
                  height: Utils.isDesktopWeb(context) ? 30 : 20,
                ),
                Row(
                  children: [
                    Utils.isDesktopWeb(context)
                        ? const Spacer()
                        : const SizedBox(),
                    Utils.isDesktopWeb(context)
                        ? _buttonFindLocation(context)
                        : Expanded(child: _buttonFindLocation(context)),
                    SizedBox(
                      width: Utils.isDesktopWeb(context) ? 46 : 0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonFindLocation(BuildContext context) {
    return ButtonWidget(
      title: R.string.label_find_kiosk.tr(),
      height: 52,
      width: Utils.isDesktopWeb(context) ? 328 : null,
      filledBackground: true,
      onPressed: () {
        NavigationUtils.popPage(context);
        onTapFindKiosk?.call();
      },
    );
  }

  Widget _rowFee(BuildContext context, String fee) {
    return Text(
      fee,
      style: Utils.isDesktopWeb(context)
          ? Theme.of(context).textTheme.large40ButtonStyle
          : Theme.of(context).textTheme.semiBold35Style,
    );
  }

  Widget _rangeDeposit(BuildContext context, num? minValue, num? maxValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Utils.isDesktopWeb(context) ? 148 : 111,
              child: Text(R.string.label_min_deposit.tr(),
                  style: Utils.isDesktopWeb(context)
                      ? Theme.of(context).textTheme.normal20Style
                      : Theme.of(context).textTheme.normal16Style),
            ),
            Text(
              "\$ ${Utils.formatMoney(minValue)}",
              style: Utils.isDesktopWeb(context)
                  ? Theme.of(context).textTheme.semiBold22Style
                  : Theme.of(context).textTheme.semiBold18Style,
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Utils.isDesktopWeb(context) ? 148 : 111,
              child: Text(R.string.label_max_deposit.tr(),
                  style: Utils.isDesktopWeb(context)
                      ? Theme.of(context).textTheme.normal20Style
                      : Theme.of(context).textTheme.normal16Style),
            ),
            Text(
              "\$ ${Utils.formatMoney(maxValue)}${optionsData.isBankDeposit() ? "" : "*"}",
              style: Utils.isDesktopWeb(context)
                  ? Theme.of(context).textTheme.semiBold22Style
                  : Theme.of(context).textTheme.semiBold18Style,
            ),
          ],
        )
      ],
    );
  }
}
