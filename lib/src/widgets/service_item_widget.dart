import 'package:dtg_web_admin/src/utils/custom_theme.dart';
import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../res/R.dart';
import 'single_tap_detector.dart';

class ServiceItemWidget extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  final VoidCallback? onTapService;

  const ServiceItemWidget(
      {Key? key, this.text, this.imageUrl, this.onTapService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = kIsWeb ? ((Utils.isDesktopWeb(context) ? 156 : 85)) : 52.h;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SingleTapDetector(
            onTap: onTapService,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  kIsWeb ? (Utils.isDesktopWeb(context) ? 30 : 16) : 8.r),
              child: imageUrl != null
                  ? Container(
                      height: size,
                      width: size,
                      color: R.color.white,
                      child: ExtendedImage.network(
                        imageUrl!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(
                      color: R.color.primaryColor,
                      height: size,
                      width: size,
                      alignment: Alignment.center,
                      child: Text(
                        R.string.view_all.tr().replaceFirst(" ", "\n"),
                        style: (Utils.isDesktopWeb(context)
                                ? Theme.of(context).textTheme.semiBold48Style
                                : Utils.isMobSmall(context)
                                    ? Theme.of(context)
                                        .textTheme
                                        .titleLarge30Style
                                        .copyWith(fontSize: 24.8)
                                    : Theme.of(context)
                                        .textTheme
                                        .titleLarge30Style)
                            .copyWith(fontSize: 28),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
            ),
          ),
        ),
        Visibility(
          visible: !Utils.isEmpty(text),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              text ?? "",
              style: Theme.of(context).textTheme.textNormal(context),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
