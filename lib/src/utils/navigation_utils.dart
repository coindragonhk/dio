import 'package:flutter/material.dart';

import 'logger.dart';

class NavigationUtils {
  static Future pushAndRemoveUtilPage(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .pushAndRemoveUntil(FadeRoute(widget: widget), (Route<dynamic> route) => false);
  }

  static Future pushAndRemoveUtilKeepFirstPage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        FadeRoute(widget: widget), ModalRoute.withName(Navigator.defaultRouteName));
  }

  static void popToFirst(BuildContext context, {rootNavigator = true}) {
    return Navigator.of(context, rootNavigator: rootNavigator).popUntil((Route<dynamic> route) => route.isFirst);
  }

  static void popUntilScreen(BuildContext context, Type screen) {
    Navigator.popUntil(context, ModalRoute.withName(screen.toString()));
  }

  static void popUntilPage(BuildContext context, {String? pageName, dynamic data}) {
    if (pageName == null) {
      return popToFirst(context);
    }
    return Navigator.of(context).popUntil((route) {
      if (route.settings.name == pageName) {
        if (route.settings.arguments is Map) {
          (route.settings.arguments as Map)['data'] = data;
        }
        return true;
      }
      return false;
    });
  }

  static void popByTime(BuildContext context, int count, {dynamic result}) {
    for (int i = 0; i < count - 1; i++) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).pop(result);
  }

  static void popUtil(BuildContext context) {
    return Navigator.of(context).popUntil((Route<dynamic> route) => false);
  }

  static void popDialog(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  static Future navigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
        FadeRoute(settings: RouteSettings(name: widget.runtimeType.toString()), widget: widget));
  }

  static void popPage(BuildContext context, {dynamic result}) {
    return Navigator.of(context).pop(result);
  }

  static Future rootNavigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context, rootNavigator: true).push(
        FadeRoute(settings: RouteSettings(name: widget.runtimeType.toString()), widget: widget));
  }

  static Future rootNavigatePageWithName(
      BuildContext context, Widget widget, String pageName,
      {Object? argument}) {
    // logger.d(ModalRoute.of(context)?.settings.name);
    return Navigator.of(context, rootNavigator: true).push(FadeRoute(
        widget: widget,
        settings: RouteSettings(name: pageName, arguments: argument ?? {"widget": widget.runtimeType.toString()})));
  }

  // static Future rootNavigatePageWithName(BuildContext context, Widget widget, String pageName, {Object? argument}) {
  //   return Navigator.of(context, rootNavigator: true)
  //       .pushNamed(pageName, arguments: argument ?? {"widget": widget.runtimeType.toString()});
  // }

  static Future replacePage(BuildContext context, Widget widget) {
    return Navigator.of(context).pushReplacement(FadeRoute(widget: widget));
  }

  static Future replacePageWithName(BuildContext context, Widget widget, String pageName, {Object? argument}) {
    return Navigator.of(context).pushReplacement(FadeRoute(
        widget: widget,
        settings: RouteSettings(name: pageName, arguments: argument ?? {"widget": widget.runtimeType.toString()})));
  }

  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget widget;

  FadeRoute({required this.widget, settings})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
