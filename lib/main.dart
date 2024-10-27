import 'package:crm_smart/core/config/app_init.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/config/navigator/app_navigator.dart';
import 'services/service_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInit.initAll();
  AppNavigator.initializeWindowSize();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => ServiceProvider(),
  ));
}
