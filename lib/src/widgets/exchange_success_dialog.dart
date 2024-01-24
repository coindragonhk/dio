import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeSuccessDialog extends StatelessWidget {
  final OptionsData optionsData;
  final String transactionId;
  final String quantity;
  final VoidCallback onTapMyVouchers;

  const ExchangeSuccessDialog({
    super.key,
    required this.optionsData,
    required this.onTapMyVouchers,
    required this.transactionId,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: Utils.isDesktopWeb(context) ? 844 : double.infinity,
          padding: EdgeInsets.only(
              left: kIsWeb ? (Utils.isDesktopWeb(context) ? 86 : 20) : 20.w,
              right: kIsWeb ? (Utils.isDesktopWeb(context) ? 86 : 20) : 20.w,
              top: kIsWeb ? (Utils.isDesktopWeb(context) ? 60 : 30) : 20.w,
              bottom: kIsWeb ? (Utils.isDesktopWeb(context) ? 30 : 16) : 12.w),
          decoration: BoxDecoration(
              color: R.color.colorVoucherBackground,
              borderRadius: BorderRadius.circular(kIsWeb ? 12 : 8),
              border:
                  Border.all(color: R.color.darkRed, width: kIsWeb ? 4 : 2)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(R.string.label_exchange_successful.tr(),
                    style: kIsWeb
                        ? Theme.of(context).textTheme.boldTitle(context)
                        : Theme.of(context).textTheme.semiBold18StyleAdaptive),
                SizedBox(
                  height: kIsWeb ? 60 : 28.w,
                ),
                kIsWeb
                    ? Container(
                        height: Utils.isDesktopWeb(context) ? 96 : 74,
                        alignment: Alignment.center,
                        // padding:  EdgeInsets.symmetric(horizontal: Utils.isDesktopWeb(context)?100 : 24),
                        decoration: BoxDecoration(
                            color: R.color.backgroundColorPoints,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              R.tr(
                                  en: optionsData.productTitleEn,
                                  th: optionsData.productTitleTh,
                                  ch: optionsData.productTitleCh),
                              style: Theme.of(context)
                                  .textTheme
                                  .boldTitle2(context)
                                  .copyWith(color: R.color.black),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "x $quantity",
                              style: Theme.of(context)
                                  .textTheme
                                  .boldTitle2(context)
                                  .copyWith(color: R.color.black),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 76.w,
                        alignment: Alignment.center,
                        // padding:  EdgeInsets.symmetric(horizontal: Utils.isDesktopWeb(context)?100 : 24),
                        decoration: BoxDecoration(
                            color: R.color.colorLightGrey,
                            borderRadius: BorderRadius.circular(10.r),
                            border:
                                Border.all(color: R.color.darkRed, width: 2)),
                        child: Row(
                          children: [
                            8.horizontalSpace,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.w),
                              child: Container(
                                height: 60.w,
                                width: 60.w,
                                child: ExtendedImage.network(
                                  optionsData.getLogo(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            8.horizontalSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$ ${optionsData.voucherUnit}",
                                    style:
                                        Theme.of(context).textTheme.bold18Style,
                                  ),
                                  12.verticalSpace,
                                  Text(
                                    R.tr(
                                        en: optionsData.productTitleEn,
                                        th: optionsData.productTitleTh,
                                        ch: optionsData.productTitleCh),
                                    style: Theme.of(context)
                                        .textTheme
                                        .normal14StyleAdaptive,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                if (!kIsWeb) ...[
                  Container(
                    padding: EdgeInsets.only(top: 12.w, bottom: 24.w),
                    alignment: Alignment.center,
                    child: Text(
                      "${R.string.quantity_summary.tr()} $quantity",
                      style: Theme.of(context).textTheme.bold18Style,
                    ),
                  ),
                ] else ...[
                  const SizedBox(
                    height: 8,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      R.string.label_transaction_ref.tr(),
                      textAlign: TextAlign.center,
                      style: kIsWeb
                          ? Theme.of(context)
                              .textTheme
                              .textDescription3(context)
                          : Theme.of(context).textTheme.regular14Style,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      transactionId,
                      textAlign: TextAlign.center,
                      style: kIsWeb
                          ? Theme.of(context).textTheme.valueStyle2(context)
                          : Theme.of(context).textTheme.normal15StyleAdaptive,
                    ),
                  ],
                ),
                SizedBox(
                  height:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 75 : 60) : 28.h,
                ),
                Center(
                  child: Text(
                    kIsWeb
                        ? R.string.label_voucher_available_within.tr()
                        : R.string.label_voucher_available_within_kmob.tr(),
                    textAlign: TextAlign.center,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.textDescription3(context)
                        : Theme.of(context).textTheme.normal14StyleAdaptive,
                  ),
                ),
                if (kIsWeb)
                  Center(
                    child: Text(
                      R.string.label_go_to_my_vouchers.tr(),
                      style:
                          Theme.of(context).textTheme.textDescription3(context),
                    ),
                  ),
                SizedBox(
                  height:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 70 : 60) : 20.w,
                ),
                Align(
                    alignment: Utils.isDesktopWeb(context)
                        ? Alignment.centerRight
                        : Alignment.center,
                    child: Utils.isDesktopWeb(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonWidget(
                                title: R.string.myvouchersabr.tr(),
                                height: 52,
                                width: 147,
                                filledBackground: false,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                  onTapMyVouchers();
                                },
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ButtonWidget(
                                title: R.string.done_confirm.tr(),
                                height: 52,
                                width: 78,
                                filledBackground: true,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ButtonWidget(
                                title: R.string.myvouchersabr.tr(),
                                height: kIsWeb ? 52 : 52.w,
                                filledBackground: false,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                  onTapMyVouchers();
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ButtonWidget(
                                title: R.string.done_confirm.tr(),
                                height: kIsWeb ? 52 : 52.w,
                                filledBackground: true,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                },
                              ),
                            ],
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
