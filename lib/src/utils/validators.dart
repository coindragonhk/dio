import 'package:dtg_web_admin/src/utils/string_ext.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../res/R.dart';
import 'utils.dart';

mixin Validators {
  static final RegExp rtrwRegex = RegExp(r'[0-9/]');
  static final RegExp numberRegex = RegExp(r'[0-9]');
  static final RegExp digitRegex = RegExp(r'[a-zA-Z]');
  static final RegExp upperRegex = RegExp(r'[A-Z]');
  static final RegExp lowerRegex = RegExp(r'[a-z]');
  static final RegExp nameRegex = RegExp("[a-z A-Z á-ú Á-Ú]");
  static final RegExp alphanumericRegex = RegExp("[a-zA-Z0-9]");
  static final RegExp specialCharacterRegex =
      RegExp(r'([!@#$%^&*(),.?":{}|<>/])');
  static final RegExp phoneRegex = RegExp(r'(^(?:[+0])?[0-9]{10,12}$)');
  static final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  bool isContainNumber(String? text) {
    if (Utils.isEmpty(text)) return false;
    return numberRegex.firstMatch(text!) != null;
  }

  bool isContainUpper(String? text) {
    if (Utils.isEmpty(text)) return false;
    return upperRegex.firstMatch(text!) != null;
  }

  bool isContainLower(String? text) {
    if (Utils.isEmpty(text)) return false;
    return lowerRegex.firstMatch(text!) != null;
  }

  bool isAlphabet(String? text) {
    if (Utils.isEmpty(text)) return false;
    return digitRegex.hasMatch(text!);
  }

  bool isSpecialCharacter(String? text) {
    if (Utils.isEmpty(text)) return false;
    return specialCharacterRegex.hasMatch(text!);
  }

  String? checkPhoneNumber(String? phoneNumber,
      {String? errorEmpty, String? errorInvalid}) {
    phoneNumber = phoneNumber?.trim();
    if (Utils.isEmpty(phoneNumber)) {
      return errorEmpty ?? R.string.msg_invalid_phone.tr();
    } else {
      return null;
    }
  }

  String? checkEmail(String? email) {
    email = email?.trim();
    if (Utils.isEmpty(email) || !emailRegex.hasMatch(email!)) {
      return R.string.msg_invalid_email.tr();
    } else {
      return null;
    }
  }

  String? checkPhoneNumberSpecific(String? phoneNumber,
      {String? errorEmpty, String? errorInvalid}) {
    phoneNumber = (phoneNumber ?? "").getPhoneNumberWithoutPrefix();
    if (Utils.isEmpty(phoneNumber) ||
        digitRegex.hasMatch(phoneNumber!) ||
        phoneNumber.length < 8 ||
        phoneNumber.length > 9) {
      return errorEmpty ?? R.string.msg_invalid_phone.tr();
    } else {
      return null;
    }
  }
}
