import 'package:flutter/services.dart';

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      TextEditingValue newEditingValue = const TextEditingValue()
          .copyWith(text: min.toString(), selection: TextSelection.collapsed(offset: newValue.text.length));
      return newEditingValue;
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
