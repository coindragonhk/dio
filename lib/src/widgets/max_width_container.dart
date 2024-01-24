import 'package:dtg_web_admin/src/utils/const.dart';
import 'package:flutter/material.dart';

class MaxWidthContainer extends StatelessWidget {
  final Widget child;

  const MaxWidthContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: Const.MAX_WIDTH_SCREEN,
        ),
        child: child,
      ),
    );
  }
}
