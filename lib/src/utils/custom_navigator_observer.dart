import 'package:flutter/material.dart';
import 'logger.dart';

class CustomNavigatorObserver extends NavigatorObserver {

  List<String> routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.i("didPush: ${route.settings.name}");
      routeStack.add(route.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.i("didPop: ${route.settings.name}");
      routeStack.removeLast();
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      logger.i("didRemove: ${route.settings.name}");
      routeStack.removeLast();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute?.settings.name != null) {
      logger.i("didRemove: ${newRoute?.settings.name}");
      routeStack.removeLast();
      routeStack.add(newRoute!.settings.name!);
    }
  }
}
