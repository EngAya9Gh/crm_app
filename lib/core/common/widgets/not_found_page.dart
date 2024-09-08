import 'package:flutter/material.dart';

import '../../config/navigator/app_navigator.dart';
import 'app_scaffold.dart';
import 'custom_error_widget.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppErrorWidget(
        message: 'Page not found',
        onPressed: () => AppNavigator.pop(),
      ),
    );
  }
}
