import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../res/R.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(0.3),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: R.color.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
