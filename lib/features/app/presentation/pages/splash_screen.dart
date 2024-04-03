import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../generated/assets.dart';
import '../../../../ui/screen/home/home.dart';
import '../../../auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../../auth/login/presentation/pages/login_page.dart';
import '../bloc/app_manager_cubit.dart';
import '../widgets/app_loader_widget/app_loader.dart';
import 'update_app_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Future<void> checkLogin(BuildContext context) async {
    final tokenCubit = context.read<LoginCubit>();
    final token = await tokenCubit.getToken();
    if (token == null || !(await tokenCubit.validateToken() ?? false)) {
      AppNavigator.pushAndRemoveUntil(LoginPage());
    } else {
      AppNavigator.pushAndRemoveUntil(Home());
    }
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getIt<AppManagerCubit>().checkAppUpdate((hasUpdate) {
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
            Image.asset(Assets.imagesLogoCrmLong),
            20.verticalSpace,
            AppLoader(),
          ],
        ),
      ),
    );
  }
}
