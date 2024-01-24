import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/R.dart';
import '../utils/navigation_utils.dart';
import 'button_widget.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String msg_top_up_1;
  final String msg_top_up_2;
  final String? buttonText;
  final VoidCallback? onPressButton;

  const ErrorDialog(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.msg_top_up_1,
      required this.msg_top_up_2,
      this.buttonText,
      this.onPressButton});

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
              bottom: kIsWeb ? (Utils.isDesktopWeb(context) ? 60 : 16) : 12.w),
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
                Text(title,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.boldTitle(context)
                        : Theme.of(context).textTheme.semiBold18StyleAdaptive),
                SizedBox(
                  height: kIsWeb ? 40 : 28.w,
                ),
                Center(
                  child: Text(subTitle,
                      style: Theme.of(context).textTheme.textNormal6(context)),
                ),
                SizedBox(
                  height: kIsWeb ? 28 : 28.w,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    msg_top_up_1,
                    style: kIsWeb
                        ? Theme.of(context).textTheme.textDescription3(context)
                        : Theme.of(context).textTheme.normal14StyleAdaptive,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 5 : 16) : 24.w,
                ),
                Center(
                  child: Text(msg_top_up_2,
                      style: kIsWeb
                          ? Theme.of(context)
                              .textTheme
                              .textDescription3(context)
                          : Theme.of(context).textTheme.normal14StyleAdaptive),
                ),
                SizedBox(
                  height:
                      kIsWeb ? (Utils.isDesktopWeb(context) ? 40 : 32) : 20.w,
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
                                title: buttonText ?? "",
                                height: 52,
                                width: 242,
                                filledBackground: true,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                  onPressButton?.call();
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              ButtonWidget(
                                title: buttonText ?? "",
                                height: kIsWeb ? 52 : 52.w,
                                filledBackground: true,
                                onPressed: () {
                                  NavigationUtils.popPage(context);
                                  onPressButton?.call();
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
