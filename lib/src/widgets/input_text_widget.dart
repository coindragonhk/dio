import 'package:flutter/material.dart';
import 'package:dtg_web_admin/res/R.dart';
import 'package:easy_localization/easy_localization.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const InputTextWidget({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.keyboardType,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = R.string;

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 15.0),
          child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              obscureText: obscureText,
              autofocus: false,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                icon: Icon(
                  icon,
                  color: Colors.black,
                  size: 32.0, /*Color(0xff224597)*/
                ),
                labelText: labelText,
                labelStyle:
                    const TextStyle(color: Colors.black54, fontSize: 18.0),
                hintText: '',
                enabledBorder: InputBorder.none,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                border: InputBorder.none,
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return t.emptytext.tr();
                }
                return null;
              }),
        ),
      ),
    );
  }
}
