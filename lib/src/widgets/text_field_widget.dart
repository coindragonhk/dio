import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../res/R.dart';
import '../utils/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      this.height,
      this.width,
      this.textInputAction = TextInputAction.next,
      this.isEnable = true,
      this.autoFocus = false,
      this.onChanged,
      this.isPassword = false,
      this.icon,
      this.errorText,
      this.labelText,
      this.hintText,
      this.inputFormatters,
      this.maxLines,
      this.keyboardType = TextInputType.text,
      this.focusNode,
      this.readOnly = false,
      this.onTap,
      this.fillColor,
      this.onSubmitted,
      this.maxLength,
      this.isCounterText = false,
      this.suffixIcon,
      this.onPressDelete,
      this.titleText,
      this.require = false,
      this.suffix,
      this.textStyle,
      this.hintStyle,
      this.borderSide,
      this.contentPadding})
      : super(key: key);

  final TextEditingController controller;
  final bool isEnable;
  final bool autoFocus;
  final bool require;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  final FormFieldSetter<String>? onChanged;
  final bool isPassword;
  final String? titleText;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final FormFieldSetter<String>? onSubmitted;
  final dynamic icon;
  final bool readOnly;
  final Function()? onTap;
  final Color? fillColor;
  final int? maxLength;
  final bool? isCounterText;
  final String? suffixIcon;
  final VoidCallback? onPressDelete;
  final double? width;
  final double? height;
  final Widget? suffix;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final BorderSide? borderSide;
  final EdgeInsets? contentPadding;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscureText;
  bool _reachMaxLength = false;

  @override
  void initState() {
    super.initState();

    if (widget.maxLength != null) {
      _reachMaxLength = widget.controller.text.length >= widget.maxLength!;
    }
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: !Utils.isEmpty(widget.titleText),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RichText(
                text: TextSpan(
                  text: widget.titleText ?? "",
                  style: Theme.of(context).textTheme.semiBold18Style.copyWith(color: R.color.white),
                ),
              ),
            )),
        SizedBox(
          width: widget.width,
          height: kIsWeb ? widget.height : null,
          child: TextField(
            enabled: widget.isEnable,
            autofocus: widget.autoFocus,
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: _obscureText,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            cursorColor: R.color.primaryColor,
            decoration: InputDecoration(
              counterText: widget.isCounterText! ? null : '',
              filled: widget.fillColor != null,
              fillColor: widget.fillColor,
              prefixIcon: widget.icon == null
                  ? null
                  : (widget.icon is Widget
                      ? widget.icon
                      : (widget.icon is String
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                widget.icon,
                                fit: BoxFit.fitHeight,
                                height: 5,
                                color: R.color.black,
                              ),
                            )
                          : Icon(
                              widget.icon,
                              size: 20,
                              color: R.color.black,
                            ))),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: widget.borderSide ?? BorderSide(width: 4, color: R.color.primaryColor),
              ),
              suffixIcon: widget.suffix,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: kIsWeb ? 16 : 12.w, vertical: kIsWeb ? 12 : 18.h),
              hintText: widget.hintText,
              errorText: widget.errorText,
              hintStyle: widget.hintStyle ??
                  Theme.of(context).textTheme.textFieldStyle(context).copyWith(color: R.color.white),
              errorMaxLines: 1000,
            ),
            keyboardType: widget.keyboardType,
            onChanged: (value) {
              if (widget.maxLength != null) {
                setState(() {
                  _reachMaxLength = value.length >= widget.maxLength!;
                });
              }
              widget.onChanged?.call(value);
            },
            onSubmitted: widget.onSubmitted,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style:
                widget.textStyle ?? Theme.of(context).textTheme.textFieldStyle(context).copyWith(color: R.color.white),
          ),
        ),
      ],
    );
  }
}
