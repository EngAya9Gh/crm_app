import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import 'splash_screen.dart';

// this widget is the root of the application
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: ScreenUtilInit(
        useInheritedMediaQuery: true,
        child: Builder(
          builder: (context) {
            return MaterialApp(
              builder: FToastBuilder(),
              navigatorKey: AppNavigator.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Smart CRM',
              theme: AppTheme.getAppTheme(context),
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
