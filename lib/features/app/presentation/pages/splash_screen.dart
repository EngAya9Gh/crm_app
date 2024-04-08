import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_navigator.dart';
import '../../../../generated/assets.dart';
import '../bloc/app_manager_cubit.dart';
import '../widgets/app_loader_widget/app_loader.dart';
import 'update_app_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppManagerCubit appCubit;

  @override
  void initState() {
    appCubit = context.read<AppManagerCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await appCubit.checkAppUpdate((hasUpdate) {
        if (hasUpdate) {
          AppNavigator.pushAndRemoveUntil(UpdateAppPage());
        } else {
          appCubit.checkRedirections(context);
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
