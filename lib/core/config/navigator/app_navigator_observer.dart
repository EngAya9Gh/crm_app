import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../services/di/di_container.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    getIt<Logger>().d('didPush ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    getIt<Logger>().d('didPop ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    getIt<Logger>().d('didReplace ${newRoute!.settings.name}');
  }
}
