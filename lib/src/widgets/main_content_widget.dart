import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/R.dart';

class MainContentWidget extends StatelessWidget {
  final Widget leftPanelWidget;
  final Widget rightPanelWidget;

  const MainContentWidget(
      {Key? key, required this.leftPanelWidget, required this.rightPanelWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 263.w, child: leftPanelWidget),
        30.horizontalSpace,
        Container(
          height: double.infinity,
          width: 2,
          color: R.color.white.withOpacity(0.3),
        ),
        30.horizontalSpace,
        Expanded(child: rightPanelWidget)
      ],
    );
  }
}
