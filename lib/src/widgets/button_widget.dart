import 'package:dtg_web_admin/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/R.dart';
import 'single_tap_detector.dart';

class ButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final String title;
  final VoidCallback? onPressed;
  final double? radius;
  final Gradient? gradient;
  final Widget? child;
  final String? prefixIcon;
  final double? iconWidth;
  final double? iconHeight;
  final double? separateSpace;
  final TextAlign? textAlign;
  bool filledBackground = false;
  bool isDisable = false;
  EdgeInsetsGeometry? padding;

  ButtonWidget(
      {Key? key,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.textStyle,
      required this.title,
      required this.onPressed,
      this.radius,
      this.gradient,
      this.child,
      this.filledBackground = false,
      this.prefixIcon,
      this.iconHeight,
      this.iconWidth,
      this.textAlign,
      this.separateSpace,
      this.height,
      this.width,
      this.padding,
      this.isDisable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleTapDetector(
      onTap: isDisable
          ? null
          : () {
              onPressed?.call();
            },
      child: Stack(
        children: [
          Container(
            height: height ?? (Utils.isDesktopWeb(context) ? 68 : 52),
            width: (padding != null && width == null)
                ? null
                : (width ?? double.infinity),
            alignment: Alignment.center,
            padding: padding ?? EdgeInsets.zero,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  (filledBackground ? R.color.primaryColor : null),
              border: Border.all(
                  color: borderColor ?? R.color.primaryColor,
                  width: kIsWeb ? 4 : 3),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: child ??
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefixIcon != null
                        ? Image.asset(
                            prefixIcon!,
                            width: iconWidth ?? 60,
                            height: iconHeight ?? 60,
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: prefixIcon != null ? (separateSpace ?? 16) : 0,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          textAlign: textAlign,
                          style: textStyle ??
                              (kIsWeb
                                  ? Theme.of(context)
                                      .textTheme
                                      .textSemiBoldButton(context)
                                  : Theme.of(context)
                                      .textTheme
                                      .semiBold15Style),
                        ),
                      ),
                    ),
                  ],
                ),
          ),
          Visibility(
            visible: isDisable,
            child: Container(
              height: height ?? 68,
              width: (padding != null && width == null)
                  ? null
                  : width ?? double.infinity,
              decoration: BoxDecoration(
                color: R.color.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
