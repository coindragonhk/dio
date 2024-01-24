import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../res/R.dart';
import '../data/network/response/options_data.dart';
import '../utils/navigation_utils.dart';
import 'button_widget.dart';

class TopUpSuccessDialog extends StatelessWidget {
  final String transactionId;
  final num points;
  final VoidCallback onTapDone;

  const TopUpSuccessDialog(
      {super.key,
      required this.onTapDone,
      required this.points,
      required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: Utils.isDesktopWeb(context) ? 844 : double.infinity,
          padding: EdgeInsets.only(
              left: Utils.isDesktopWeb(context) ? 86 : 20,
              right: Utils.isDesktopWeb(context) ? 86 : 20,
              top: Utils.isDesktopWeb(context) ? 60 : 30,
              bottom: Utils.isDesktopWeb(context) ? 30 : 16),
          decoration: BoxDecoration(
              color: R.color.colorVoucherBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: R.color.darkRed, width: 4)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(R.string.top_up_success.tr(),
                    style: Theme.of(context).textTheme.boldTitle(context)),
                const SizedBox(
                  height: 60,
                ),
                Container(
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
                        R.string.sub_title_dragon_rewards_account.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .boldTitle2(context)
                            .copyWith(color: R.color.black),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
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
                            "$points ${R.string.points.tr()}",
                            style: Theme.of(context)
                                .textTheme
                                .boldTitle2(context)
                                .copyWith(color: R.color.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      R.string.label_transaction_ref.tr(),
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.textDescription3(context),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      transactionId,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.valueStyle2(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: Utils.isDesktopWeb(context) ? 75 : 60,
                ),
                Center(
                  child: Text(
                    R.string.msg_top_up_point_success_1.tr(),
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.textDescription3(context),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    R.string.msg_top_up_point_success_2.tr(),
                    style:
                        Theme.of(context).textTheme.textDescription3(context),
                  ),
                ),
                SizedBox(
                  height: Utils.isDesktopWeb(context) ? 70 : 60,
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
                                title: R.string.done_confirm.tr(),
                                height: 52,
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
