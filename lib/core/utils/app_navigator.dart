import 'package:flutter/cupertino.dart';

abstract class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // use this navigatorKey to navigate to any page from anywhere in the app
  // in main file, use this navigatorKey to set the navigatorKey of MaterialApp
  // like this:
  // MaterialApp(
  //   navigatorKey: AppNavigator.navigatorKey,

  static Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static removeAllAndPushNamed(String routeName) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!.pushNamed(routeName);
  }

  //     Navigator.of(context).push(CupertinoPageRoute(
  //   builder: (context) => AgentAndDistributorsAction(
  //     agentDistributorModel: agentModel,
  //   ),
  // )),
  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!
        .push(CupertinoPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushReplacement(Widget page) {
    return navigatorKey.currentState!
        .pushReplacement(CupertinoPageRoute(builder: (context) => page));
  }

  static Future<dynamic> pushAndRemoveUntil(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  // back with parameter
  static void pop({dynamic result}) {
    return navigatorKey.currentState!.pop();
  }

  static removeAllAndPush(Widget page) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!
        .push(CupertinoPageRoute(builder: (context) => page));
  }
}
