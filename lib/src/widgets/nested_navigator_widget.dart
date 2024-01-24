import 'package:flutter/material.dart';

class NestedNavigatorWidget extends StatelessWidget {
  final Widget child;
  const NestedNavigatorWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: key,
        onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings, builder: (BuildContext context) => child));
  }
}
