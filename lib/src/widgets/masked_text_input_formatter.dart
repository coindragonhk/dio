import 'package:flutter/services.dart';
import '../utils/logger.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!newValue.text.contains(separator) &&
        newValue.text.length - 1 > oldValue.text.length) {
      // Support case copy/paste value to textfield
      String newValueString = newValue.text;
      for (int i = 0; i < mask.length; i++) {
        if (mask[i] == separator) {
          newValueString = newValue.text.substring(0, i) +
              separator +
              newValue.text.substring(i, newValue.text.length);
        }
      }
      if (newValueString.length > mask.length) {
        newValueString = newValueString.substring(0, mask.length);
      }
      newValue = newValue.copyWith(text: newValueString);
      return newValue;
    }
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
