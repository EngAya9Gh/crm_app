import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/config/theme/theme.dart';

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
            return MaterialApp.router(
              routerConfig: AppRouter.goRouter,
              localizationsDelegates: [
                DefaultMaterialLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              builder: FToastBuilder(),
              debugShowCheckedModeBanner: EndPoints.appMode.isDevelopment,
              title: 'Smart CRM',
              theme: AppTheme.getAppTheme(context),
            );
          },
        ),
      ),
    );
  }
}
