import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/data/network/response/options_data.dart';
import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/enum.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/button_widget.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:dtg_web_admin/src/widgets/text_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dtg_web_admin/src/utils/string_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/models/payment_method.dart';
import 'card_expired_input_formatter.dart';
import 'card_number_input_formatter.dart';
import 'measured_size.dart';
import 'terms_dialog.dart';

class VoucherSummaryQrDialog extends StatelessWidget {
  final OptionsType optionsType;
  final OptionsData? optionsData;
  final String voucherText;
  final String quantity;
  final String totalValue;
  final PaymentMethod? paymentMethod;
  final String? phoneNumber;
  final num? currentPoints;
  final num? pointsSelected;
  final TextEditingController cardNumberTextEditingController =
      TextEditingController();
  final TextEditingController cardExpiredTextEditingController =
      TextEditingController();
  final TextEditingController cardCvcTextEditingController =
      TextEditingController();
  Size? parentDialogSize;
  final VoidCallback? onTapConfirm;

  VoucherSummaryQrDialog(
      {super.key,
      required this.optionsType,
      required this.optionsData,
      required this.voucherText,
      required this.quantity,
      required this.totalValue,
      required this.paymentMethod,
      this.currentPoints,
      this.phoneNumber,
      this.pointsSelected,
      this.onTapConfirm});

  @override
  Widget build(BuildContext context) {
    Widget summaryWidget = Container();

    switch (optionsType) {
      case OptionsType.PAY_BILLS:
        summaryWidget = payBillSummaryWidget(context);
        break;
      case OptionsType.DONATE:
        summaryWidget = donationSummaryWidget(context);
        break;
      case OptionsType.E_VOUCHER:
        summaryWidget = voucherSummaryWidget(context);
        break;
      case OptionsType.TOP_UP:
        summaryWidget = topUpSummaryHeaderWidget(context);
        break;
      default:
    }

    return Material(
      color: Colors.transparent,
      child: Center(
        child: MeasuredSize(
          onChange: (value) {
            parentDialogSize = value;
          },
          child: Stack(
            children: [
              Container(
                width: Utils.isDesktopWeb(context) ? 844 : double.infinity,
                padding: EdgeInsets.only(
                    left: Utils.isDesktopWeb(context) ? 86 : 20,
                    right: Utils.isDesktopWeb(context) ? 86 : 20,
                    top: Utils.isDesktopWeb(context) ? 40 : 30,
                    bottom: Utils.isDesktopWeb(context) ? 40 : 16),
                decoration: BoxDecoration(
                    color: R.color.colorVoucherBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: R.color.darkRed, width: 4)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      summaryWidget,
                      SizedBox(
                        height: Utils.isDesktopWeb(context) ? 40 : 30,
                      ),
                      Container(
                        height: Utils.isDesktopWeb(context) ? 96 : 87,
                        alignment: Alignment.center,
                        //padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: R.color.backgroundColorPoints,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  R.string.total_cost_confirm.tr().trim(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .textNormalSmall(context)
                                      .copyWith(color: R.color.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  totalValue,
                                  style: (Utils.isDesktopWeb(context)
                                          ? Theme.of(context)
                                              .textTheme
                                              .largeTextStyle
                                          : Theme.of(context)
                                              .textTheme
                                              .largeText32Style)
                                      .copyWith(color: R.color.black),
                                ),
                              ],
                            )),
                            SizedBox(
                              width: Utils.isDesktopWeb(context) ? 50 : 20,
                            ),
                            Flexible(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  R.string.label_payment_confirm.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .textNormalSmall(context)
                                      .copyWith(color: R.color.black),
                                ),
                                SizedBox(
                                  height: Utils.isDesktopWeb(context) ? 5 : 10,
                                ),
                                Image.asset(
                                  paymentMethod?.image ?? "",
                                  height: Utils.isDesktopWeb(context) ? 48 : 30,
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      /*
                      if (paymentMethod?.paymentMethod ==
                          PaymentMethodOptions.VISA)
                        _buildCardVisaInfo(context),
                        */
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    "${R.string.label_voucher_confirm_desc_1.tr()} ",
                                // paymentMethod?.paymentMethod == PaymentMethodOptions.ALIPAY || paymentMethod?.paymentMethod == PaymentMethodOptions.WECHAT_PAY
                                //    ? R.string.label_voucher_qr_confirm_desc_1.tr()
                                //    : R.string.label_voucher_confirm_desc_1.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)),
                            TextSpan(
                                text: R.string.label_terms_and_conditions.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
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
                                        height: parentDialogSize?.height ??
                                            (Utils.isDesktopWeb(context)
                                                ? 589
                                                : 617),
                                        title: R
                                            .string.label_terms_and_conditions
                                            .tr(),
                                        description: optionsType ==
                                                OptionsType.TOP_UP
                                            ? ""
                                            : (optionsData != null
                                                ? R.tr(
                                                    en: optionsData
                                                        ?.termsAndConditionsEN
                                                        ?.convertFirebaseEndlines(),
                                                    th: optionsData
                                                        ?.termsAndConditionsEN
                                                        ?.convertFirebaseEndlines(),
                                                    ch: optionsData
                                                        ?.termsAndConditionsCH
                                                        ?.convertFirebaseEndlines())
                                                : ""),
                                      ),
                                    );
                                  }),
                            TextSpan(
                                text:
                                    " ${R.string.label_voucher_confirm_desc_2.tr()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)),
                            TextSpan(
                                text: " ${R.string.label_service_policy.tr()} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)
                                    .copyWith(
                                        decoration: TextDecoration.underline),
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
                                        height: parentDialogSize?.height ??
                                            (Utils.isDesktopWeb(context)
                                                ? 589
                                                : 617),
                                        title:
                                            R.string.label_service_policy.tr(),
                                        description:
                                            "", //R.string.description_policy.tr(),
                                      ),
                                    );
                                  }),
                            if (!Utils.isDesktopWeb(context))
                              TextSpan(
                                  text: "\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .textDescription3(context)),
                            TextSpan(
                                text:
                                    R.string.label_voucher_confirm_desc_3.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .textDescription3(context)
                                    .copyWith(
                                        height: Utils.isDesktopWeb(context)
                                            ? 22 / 16
                                            : 18.15 / 15)),
                          ]),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: Utils.isDesktopWeb(context) ? 40 : 20,
                        ),
                        child: Column(
                          children: [
                            /*
                            if (paymentMethod?.paymentMethod !=
                                PaymentMethodOptions.VISA) ...[
                              if (optionsType == OptionsType.TOP_UP)
                                newBalanceWidget(context),
                              Container(
                                width: 258,
                                height: 258,
                                margin: EdgeInsets.only(
                                    top: optionsType == OptionsType.TOP_UP
                                        ? 12
                                        : 0),
                                child: QRWidget(id: "mock"),
                              )
                            ], */
                            if (optionsType == OptionsType.TOP_UP &&
                                paymentMethod?.paymentMethod ==
                                    PaymentMethodOptions.VISA)
                              Align(
                                  alignment: Utils.isDesktopWeb(context)
                                      ? Alignment.centerRight
                                      : Alignment.center,
                                  child: newBalanceWidget(context)),
                            _buildButtonAction(context)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Utils.isDesktopWeb(context) ? 40 : 34,
                right: Utils.isDesktopWeb(context) ? 30 : 24,
                child: SingleTapDetector(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget newBalanceWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 104,
            child: Text(R.string.label_new_balance.tr(),
                style: Theme.of(context).textTheme.normal16Style)),
        const SizedBox(width: 12),
        Image.asset(
          R.drawable.img_dragon_points_logo,
          height: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "${(currentPoints ?? 0) + (pointsSelected ?? 0)} ${R.string.points.tr()}",
          style: Theme.of(context).textTheme.valueStyle(context),
        )
      ],
    );
  }

  Widget _buildCardVisaInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Utils.isDesktopWeb(context) ? 10 : 30),
      child: Utils.isDesktopWeb(context)
          ? Row(
              children: [
                _buildTitleCardInfo(context),
                //Expanded(child: _buildInputCardVisaInfo(context))
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleCardInfo(context),
                const SizedBox(
                  height: 8,
                ),
                //_buildInputCardVisaInfo(context)
              ],
            ),
    );
  }

  Widget _buildTitleCardInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Text(
        R.string.title_card_detail.tr(),
        style: Utils.isDesktopWeb(context)
            ? Theme.of(context).textTheme.normal15Style
            : Theme.of(context).textTheme.normal16Style,
      ),
    );
  }

  Widget _buildInputCardVisaInfo(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            controller: cardNumberTextEditingController,
            maxLength: 19,
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              CardNumberInputFormatter()
            ],
            icon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 5),
              child: Image.asset(
                R.drawable.ic_card_number_detail,
                height: 22,
                width: 28,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        TextFieldWidget(
            controller: cardExpiredTextEditingController,
            width: 112,
            hintText: R.string.hint_card_expired.tr(),
            maxLength: 5,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(5),
              CardExpiredInputFormatter()
            ]),
        const SizedBox(
          width: 16,
        ),
        TextFieldWidget(
          controller: cardCvcTextEditingController,
          width: 85,
          hintText: R.string.hint_card_cvc.tr(),
          maxLength: 3,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
        ),
        if (Utils.isDesktopWeb(context))
          const SizedBox(
            width: 35,
          ),
      ],
    );
  }

  Widget voucherSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.label_voucher_summary.tr(),
            style: Theme.of(context).textTheme.boldTitle(context)),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.e_voucher_summary.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(voucherText,
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.quantity_summary.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(quantity,
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.total_value_summary.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(totalValue,
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
      ],
    );
  }

  Widget donationSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.title_donation_summary.tr(),
            style: Theme.of(context).textTheme.boldTitle(context)),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.label_donation.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(
                    R.tr(
                        en: optionsData?.productTitleEn,
                        th: optionsData?.productTitleTh,
                        ch: optionsData?.productTitleCh),
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.label_amount.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(totalValue,
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
      ],
    );
  }

  Widget accountDetailWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.label_account_details.tr(),
            style: Theme.of(context).textTheme.boldTitle(context)),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 130,
                child: Text(R.string.account.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(phoneNumber?.formatHiddenPhoneNumber() ?? "",
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 130,
                child: Text(R.string.current_balance.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.drawable.img_dragon_points_logo,
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${currentPoints ?? ""} ${R.string.points.tr()}",
                  style: Theme.of(context).textTheme.valueStyle(context),
                )
              ],
            ))
          ],
        ),
      ],
    );
  }

  Widget topUpSummaryHeaderWidget(BuildContext context) {
    return Utils.isDesktopWeb(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: accountDetailWidget(context)),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: topUpSummaryWidget(context),
              ),
            ],
          )
        : Column(
            children: [
              accountDetailWidget(context),
              const SizedBox(
                height: 20,
              ),
              topUpSummaryWidget(context)
            ],
          );
  }

  Widget topUpSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.title_top_up_summary.tr(),
            style: Theme.of(context).textTheme.boldTitle(context)),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 130,
                child: Text(R.string.label_point_selected.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.drawable.img_dragon_points_logo,
                  height: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${pointsSelected ?? ""} ${R.string.points.tr()}",
                  style: Theme.of(context).textTheme.valueStyle(context),
                )
              ],
            ))
          ],
        ),
      ],
    );
  }

  Widget payBillSummaryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(R.string.title_bill_payment_summary.tr(),
            style: Theme.of(context).textTheme.boldTitle(context)),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.label_telco.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text("China Mobile",
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.account_fill.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text(phoneNumber ?? "",
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
        SizedBox(
          height: Utils.isDesktopWeb(context) ? 12 : 8,
        ),
        Row(
          children: [
            SizedBox(
                width: 90,
                child: Text(R.string.total_value_summary.tr(),
                    style: Theme.of(context).textTheme.normal16Style)),
            const SizedBox(width: 12),
            Expanded(
                child: Text("\$ 2000",
                    style: Theme.of(context).textTheme.valueStyle(context)))
          ],
        ),
      ],
    );
  }

  Widget _buildButtonAction(BuildContext context) {
    /*return paymentMethod?.paymentMethod == PaymentMethodOptions.WECHAT_PAY
        ? const SizedBox()
        : */
    return Container(
        margin: EdgeInsets.only(
            top: Utils.isDesktopWeb(context) ||
                    (optionsType == OptionsType.TOP_UP &&
                        paymentMethod?.paymentMethod ==
                            PaymentMethodOptions.VISA)
                ? 12
                : 20),
        child: /*Utils.isDesktopWeb(context)
             ? SingleTapDetector(
                    child: Text(
                      R.string.proceed_to_payment.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .normal16Style
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  )
                  : */

            Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Column(children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                if (!Utils.isDesktopWeb(context))
                  TextSpan(
                      text: "\n",
                      style: Theme.of(context)
                          .textTheme
                          .textDescription3(context)),
                TextSpan(
                    text: "${R.string.redirect_payment_gateway_note_1.tr()} ",
                    style: Theme.of(context)
                        .textTheme
                        .textDescription3(context)
                        .copyWith(
                            height: Utils.isDesktopWeb(context)
                                ? 22 / 16
                                : 18.15 / 15)),
                TextSpan(
                    text: "YedPay®",
                    style: Theme.of(context)
                        .textTheme
                        .textDescription3(context)
                        .copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Utils.launchURL(Const.YEDPAY_URL);
                      }),
                TextSpan(
                    text: " ${R.string.redirect_payment_gateway_note_2.tr()}",
                    style: Theme.of(context)
                        .textTheme
                        .textDescription3(context)
                        .copyWith(
                            height: Utils.isDesktopWeb(context)
                                ? 22 / 16
                                : 18.15 / 15)),
              ]),
            ),
            8.verticalSpace,
            ButtonWidget(
                title: R.string.proceed_to_payment.tr(),
                filledBackground: true,
                height: 52,
                //width: Utils.isDesktopWeb(context) ? 103 : null,
                width: null,
                onPressed: () {
                  NavigationUtils.popPage(context);
                  onTapConfirm?.call();
                }),
          ]),
        ));
  }
}
