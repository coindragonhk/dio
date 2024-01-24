import 'package:dtg_web_admin/constants/constants.dart';
import 'package:dtg_web_admin/res/R.dart';
import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/logger.dart';
import 'package:dtg_web_admin/src/utils/navigation_utils.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:dtg_web_admin/src/widgets/single_tap_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsDialog extends StatefulWidget {
  final double height;
  final double? widthDesktop;
  final String title;
  final String description;
  final VoidCallback? onTapClose;

  const TermsDialog(
      {super.key,
      this.onTapClose,
      required this.widthDesktop,
      required this.height,
      required this.title,
      required this.description});

  @override
  State<TermsDialog> createState() => _TermsDialogState();
}

class _TermsDialogState extends State<TermsDialog> {
  String localTerms = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Utils.isEmpty(widget.description)) {
        loadLocalStringTerms(context);
      }
    });
  }

  void loadLocalStringTerms(BuildContext context) async {
    localTerms = await Utils.loadStringTranslations(Globals.REGION == "HK"
        ? R.tr(
            en: "terms_conditions_top_up_en.txt",
            ch: "terms_conditions_top_up_ch.txt",
            sch: "terms_conditions_top_up_ch.txt",
            th: "terms_conditions_top_up_en.txt",
          )
        : Globals.REGION == "SG"
            ? R.tr(
                en: "terms_conditions_top_up_en_sg.txt",
                ch: "terms_conditions_top_up_ch_sg.txt",
                th: "terms_conditions_top_up_en_sg.txt",
                sch: "terms_conditions_top_up_sch_sg.txt",
              )
            : R.tr(
                en: "terms_conditions_top_up_en_th.txt",
                ch: "terms_conditions_top_up_ch_th.txt",
                sch: "terms_conditions_top_up_ch_th.txt",
                th: "terms_conditions_top_up_th_th.txt",
              ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: Utils.isDesktopWeb(context)
              ? widget.widthDesktop
              : double.infinity,
          constraints: BoxConstraints(
            maxHeight: widget.height,
          ),
          padding: EdgeInsets.symmetric(
              vertical: Utils.isDesktopWeb(context) ? 40 : 30,
              horizontal: Utils.isDesktopWeb(context) ? 30 : 24),
          decoration: BoxDecoration(
              color: R.color.colorVoucherBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: R.color.darkRed, width: 4)),
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
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.boldTitle(context),
                    ),
                  ),
                  SingleTapDetector(
                    onTap: () {
                      widget.onTapClose?.call();
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
              const SizedBox(
                height: 20,
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: widget.height -
                        (Utils.isDesktopWeb(context) ? 120 : 100) -
                        20),
                child: SingleChildScrollView(
                  child: !Utils.isEmpty(widget.description)
                      ? Text(
                          widget.description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .textDescription3(context),
                        )
                      : Html(
                          data: localTerms,
                          shrinkWrap: true,
                          style: {
                            "body": Style(
                                color: R.color.white,
                                fontSize: FontSize(
                                    Utils.isDesktopWeb(context) ? 16 : 16),
                                fontWeight: FontWeight.w500,
                                margin: Margins.zero,
                                lineHeight: LineHeight(
                                    Utils.isDesktopWeb(context)
                                        ? 19.36 / 16
                                        : 18.15 / 15))
                          },
                          onLinkTap: (url, _, __) {
                            if (!Utils.isEmpty(url)) {
                              Utils.launchURL(url!);
                            }
                          }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
