import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../res/R.dart';

class ErrorDialog extends Dialog {
  const ErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = R.string;

    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // Row is a horizontal, linear layout.
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Image.asset(
                  R.drawable.img_otp,
                  fit: BoxFit.cover,
                  //width: 268,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  t.loginrequiredplstryagain.tr(),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: MaterialButton(
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              )
            ],
          ),
        ));
  }
}
