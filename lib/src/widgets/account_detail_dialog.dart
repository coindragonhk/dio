import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/string_ext.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'terms_dialog.dart';

class AccountDetailDialog extends StatelessWidget {
  final OptionsData optionsData;
  final String account;
  final num currentPoints;
  final num costPoints;
  final String voucherText;
  final String quantity;
  final String totalValue;
  final VoidCallback onTapConfirm;

  const AccountDetailDialog({
    super.key,
    required this.optionsData,
    required this.onTapConfirm,
    required this.account,
    required this.currentPoints,
    required this.costPoints,
    required this.voucherText,
    required this.quantity,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: Utils.isDesktopWeb(context) ? 844 : double.infinity,
              padding: EdgeInsets.only(
                  left: kIsWeb ? (Utils.isDesktopWeb(context) ? 86 : 20) : 20.w,
                  right:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 86 : 20) : 20.w,
                  top: kIsWeb ? (Utils.isDesktopWeb(context) ? 40 : 30) : 20.w,
                  bottom:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 40 : 16) : 12.w),
              decoration: BoxDecoration(
                  color: R.color.colorVoucherBackground,
                  borderRadius: BorderRadius.circular(kIsWeb ? 12 : 8),
                  border: Border.all(
                      color: R.color.darkRed, width: kIsWeb ? 4 : 2)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utils.isDesktopWeb(context)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: accountDetailWidget(context)),
                              SizedBox(
                                width: kIsWeb ? 20 : 20.w,
                              ),
                              Expanded(child: voucherSummaryWidget(context)),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              accountDetailWidget(context),
                              SizedBox(
                                height: kIsWeb ? 20 : 20.w,
                              ),
                              voucherSummaryWidget(context)
                            ],
                          ),
                    SizedBox(
                      height: kIsWeb
                          ? (Utils.isDesktopWeb(context) ? 40 : 30)
                          : 30.w,
                    ),
                    Container(
                      height: kIsWeb
                          ? (Utils.isDesktopWeb(context) ? 96 : 87)
                          : 79.w,
                      alignment: Alignment.center,
                      // padding:  EdgeInsets.symmetric(horizontal: Utils.isDesktopWeb(context)?100 : 24),
                      decoration: BoxDecoration(
                          color: R.color.backgroundColorPoints,
                          borderRadius:
                              BorderRadius.circular(kIsWeb ? 12 : 8.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                R.string.total_cost_confirm.tr().trim(),
                                style: kIsWeb
                                    ? Theme.of(context)
                                        .textTheme
                                        .textNormalSmall(context)
                                        .copyWith(color: R.color.black)
                                    : Theme.of(context)
                                        .textTheme
                                        .normal15StyleAdaptive
                                        .copyWith(color: R.color.black),
                              ),
                              SizedBox(
                                height: kIsWeb ? 5 : 8.w,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    R.drawable.img_dragon_points_logo,
                                    height: kIsWeb
                                        ? (Utils.isDesktopWeb(context)
                                            ? 48
                                            : 39)
                                        : 29.w,
                                  ),
                                  SizedBox(
                                    width: kIsWeb ? 5 : 4.w,
                                  ),
                                  Text(
                                    "$costPoints ${R.string.points.tr()}",
                                    style: (kIsWeb
                                            ? (Utils.isDesktopWeb(context)
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .largeTextStyle
                                                : Theme.of(context)
                                                    .textTheme
                                                    .largeText32Style)
                                            : Theme.of(context)
                                                .textTheme
                                                .largeText24Style)
                                        .copyWith(color: R.color.black),
                                  )
                                ],
                              )
                            ],
                          )),
                          SizedBox(
                            width: kIsWeb
                                ? (Utils.isDesktopWeb(context) ? 50 : 20)
                                : 20.w,
                          ),
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                R.string.label_payment_confirm.tr(),
                                style: kIsWeb
                                    ? Theme.of(context)
                                        .textTheme
                                        .textNormalSmall(context)
                                        .copyWith(color: R.color.black)
                                    : Theme.of(context)
                                        .textTheme
                                        .normal15StyleAdaptive
                                        .copyWith(color: R.color.black),
                              ),
                              SizedBox(
                                height: kIsWeb ? 5 : 8.w,
                              ),
                              Image.asset(
                                R.drawable.ic_dragon_rewards,
                                height: kIsWeb
                                    ? (Utils.isDesktopWeb(context) ? 48 : 39)
                                    : 29.w,
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kIsWeb ? 20 : 30.w,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                              text: R.string.label_voucher_confirm_desc_1.tr(),
                              style: kIsWeb
                                  ? Theme.of(context)
                                      .textTheme
                                      .textDescription3(context)
                                  : Theme.of(context)
                                      .textTheme
                                      .normal14StyleAdaptive),
                          TextSpan(
                              text: R.string.label_terms_and_conditions.tr(),
                              style: (kIsWeb
                                      ? Theme.of(context)
                                          .textTheme
                                          .textDescription3(context)
                                      : Theme.of(context)
                                          .textTheme
                                          .normal14StyleAdaptive)
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      height: kIsWeb ? 18.15 / 15 : 16.94 / 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showGeneralDialog(
                                      context: context,
                                      useRootNavigator: true,
                                      pageBuilder: (context, _, __) => TermsDialog(
                                          widthDesktop: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              298 * 2,
                                          height: Utils.isDesktopWeb(context)
                                              ? 589
                                              : 617,
                                          title: R
                                              .string.label_terms_and_conditions
                                              .tr(),
                                          description: R.tr(
                                              th: optionsData
                                                  .termsAndConditionsEN
                                                  ?.convertFirebaseEndlines(),
                                              en: optionsData
                                                  .termsAndConditionsEN
                                                  ?.convertFirebaseEndlines(),
                                              ch: optionsData
                                                  .termsAndConditionsCH
                                                  ?.convertFirebaseEndlines())));
                                }),
                          TextSpan(
                              text: R.string.label_voucher_confirm_desc_2.tr(),
                              style: kIsWeb
                                  ? Theme.of(context)
                                      .textTheme
                                      .textDescription3(context)
                                  : Theme.of(context)
                                      .textTheme
                                      .normal14StyleAdaptive),
                          TextSpan(
                              text: R.string.label_service_policy.tr(),
                              style: (kIsWeb
                                      ? Theme.of(context)
                                          .textTheme
                                          .textDescription3(context)
                                      : Theme.of(context)
                                          .textTheme
                                          .normal14StyleAdaptive)
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      height: kIsWeb ? 18.15 / 15 : 16.94 / 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showGeneralDialog(
                                    context: context,
                                    useRootNavigator: true,
                                    pageBuilder: (context, _, __) =>
                                        TermsDialog(
                                      widthDesktop:
                                          MediaQuery.of(context).size.width -
                                              126 * 2,
                                      height: Utils.isDesktopWeb(context)
                                          ? 589
                                          : 617,
                                      title: R.string.label_service_policy.tr(),
                                      description: "",
                                      //R.string.description_policy.tr(),
                                    ),
                                  );
                                }),
                          TextSpan(
                              text: ".",
                              style: kIsWeb
                                  ? Theme.of(context)
                                      .textTheme
                                      .textDescription3(context)
                                  : Theme.of(context)
                                      .textTheme
                                      .normal14StyleAdaptive),
                          if (!Utils.isDesktopWeb(context))
                            TextSpan(
                                text: "\n",
                                style: kIsWeb
                                    ? Theme.of(context)
                                        .textTheme
                                        .textDescription3(context)
                                    : Theme.of(context)
                                        .textTheme
                                        .normal14StyleAdaptive),
                          TextSpan(
                              text: R.string.label_voucher_confirm_desc_3.tr(),
                              style: (kIsWeb
                                      ? Theme.of(context)
                                          .textTheme
                                          .textDescription3(context)
                                      : Theme.of(context)
                                          .textTheme
                                          .normal14StyleAdaptive)
                                  .copyWith(
                                      height: kIsWeb
                                          ? (Utils.isDesktopWeb(context)
                                              ? 22 / 16
                                              : 18.15 / 15)
                                          : 16.94 / 14)),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: kIsWeb
                          ? (Utils.isDesktopWeb(context) ? 40 : 20)
                          : 20.w,
                    ),
                    Align(
                      alignment: Utils.isDesktopWeb(context)
                          ? Alignment.centerRight
                          : Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            R.string.remain_balance.tr().trim(),
                            style: kIsWeb
                                ? Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)
                                : Theme.of(context)
                                    .textTheme
                                    .normal16StyleAdaptive,
                          ),
                          SizedBox(
                            width: kIsWeb ? 12 : 12.w,
                          ),
                          Image.asset(
                            R.drawable.img_dragon_points_logo,
                            height: kIsWeb ? 30 : 24.w,
                          ),
                          SizedBox(
                            width: kIsWeb ? 5 : 4.w,
                          ),
                          Text(
                              "${currentPoints - costPoints} ${R.string.points.tr()}",
                              style: kIsWeb
                                  ? Theme.of(context)
                                      .textTheme
                                      .valueStyle(context)
                                  : Theme.of(context)
                                      .textTheme
                                      .semiBold20StyleAdaptive)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kIsWeb ? 12 : 12.w,
                    ),
                    Align(
                        alignment: Utils.isDesktopWeb(context)
                            ? Alignment.centerRight
                            : Alignment.center,
                        child: ButtonWidget(
                          title: R.string.confirm.tr(),
                          height: kIsWeb ? 52 : 52.w,
                          width: Utils.isDesktopWeb(context)
                              ? 103
                              : double.infinity,
                          filledBackground: true,
                          onPressed: () {
                            onTapConfirm();
                            NavigationUtils.popPage(context);
                          },
                        ))
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
                  padding: EdgeInsets.all(Utils.isDesktopWeb(context) ? 0 : 4),
                  child: Image.asset(
                    R.drawable.ic_close_large,
                    width:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 30 : 22) : 20.w,
                    height:
                        kIsWeb ? (Utils.isDesktopWeb(context) ? 30 : 22) : 20.w,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget accountDetailWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          R.string.label_account_details.tr(),
          style: kIsWeb
              ? Theme.of(context).textTheme.boldTitle(context)
              : Theme.of(context).textTheme.semiBold18StyleAdaptive,
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 12.w,
        ),
        Row(
          children: [
            SizedBox(
              width: kIsWeb ? 130 : 120.w,
              child: Text(
                R.string.account.tr(),
                style: kIsWeb
                    ? Theme.of(context).textTheme.normal16Style
                    : Theme.of(context).textTheme.normal15StyleAdaptive,
              ),
            ),
            SizedBox(width: kIsWeb ? 12 : 12.w),
            Expanded(
              child: Text(
                account.formatHiddenPhoneNumber(),
                style: kIsWeb
                    ? Theme.of(context).textTheme.valueStyle(context)
                    : Theme.of(context).textTheme.semiBold18StyleAdaptive,
              ),
            ),
          ],
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 4.w,
        ),
        Row(
          children: [
            SizedBox(
                width: kIsWeb ? 130 : 120.w,
                child: Text(R.string.current_balance.tr(),
                    style: kIsWeb
                        ? Theme.of(context).textTheme.normal16Style
                        : Theme.of(context).textTheme.normal15StyleAdaptive)),
            const SizedBox(width: 12),
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.drawable.img_dragon_points_logo,
                  height: kIsWeb ? 30 : 24.w,
                ),
                SizedBox(
                  width: kIsWeb ? 5 : 4.w,
                ),
                Text(
                  "$currentPoints ${R.string.points.tr()}",
                  style: kIsWeb
                      ? Theme.of(context).textTheme.valueStyle(context)
                      : Theme.of(context).textTheme.semiBold18StyleAdaptive,
                )
              ],
            ))
          ],
        ),
      ],
    );
  }

  Widget voucherSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.label_voucher_summary.tr(),
            style: kIsWeb
                ? Theme.of(context).textTheme.boldTitle(context)
                : Theme.of(context).textTheme.semiBold18StyleAdaptive),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 12.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: kIsWeb ? 90 : 84.w,
                child: Text(R.string.e_voucher_summary.tr(),
                    style: kIsWeb
                        ? Theme.of(context).textTheme.normal16Style
                        : Theme.of(context).textTheme.normal15StyleAdaptive)),
            SizedBox(width: kIsWeb ? 12 : 12.w),
            Expanded(
                child: Text(voucherText,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.valueStyle(context)
                        : Theme.of(context).textTheme.semiBold18StyleAdaptive))
          ],
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 4.w,
        ),
        Row(
          children: [
            SizedBox(
                width: kIsWeb ? 90 : 84.w,
                child: Text(R.string.quantity_summary.tr(),
                    style: kIsWeb
                        ? Theme.of(context).textTheme.normal16Style
                        : Theme.of(context).textTheme.normal15StyleAdaptive)),
            SizedBox(width: kIsWeb ? 12 : 12.w),
            Expanded(
                child: Text(quantity,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.valueStyle(context)
                        : Theme.of(context).textTheme.semiBold18StyleAdaptive))
          ],
        ),
        SizedBox(
          height: kIsWeb ? (Utils.isDesktopWeb(context) ? 12 : 8) : 4.w,
        ),
        Row(
          children: [
            SizedBox(
                width: kIsWeb ? 90 : 84.w,
                child: Text(R.string.total_value_summary.tr(),
                    style: kIsWeb
                        ? Theme.of(context).textTheme.normal16Style
                        : Theme.of(context).textTheme.normal15StyleAdaptive)),
            SizedBox(width: kIsWeb ? 12 : 12.w),
            Expanded(
                child: Text(totalValue,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.valueStyle(context)
                        : Theme.of(context).textTheme.semiBold18StyleAdaptive))
          ],
        ),
      ],
    );
  }
}
