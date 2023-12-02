import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:crm_smart/features/app/presentation/pages/update_app_page.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../ui/screen/home/home.dart';
import '../../../../ui/screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static checkLogin(BuildContext context) async {
    final sharedPref = await SharedPreferences.getInstance();
    final isLoggedIn = sharedPref.getBool(kKeepMeLoggedIn) ?? false;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => isLoggedIn ? Home() : login()),
      (route) => false,
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GetIt.I<AppManagerCubit>().checkAppUpdate((hasUpdate) {
        if (hasUpdate) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => UpdateAppPage()),
            (route) => false,
          );
        } else {
          SplashScreen.checkLogin(context);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assest/images/image3.png'),
            20.verticalSpace,
            AppLoader(),
          ],
        ),
      ),
    );
  }
}
