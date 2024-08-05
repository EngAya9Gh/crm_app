import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_loader.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../generated/assets.dart';
import '../bloc/app_manager_cubit.dart';
import 'update_app_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppManagerCubit appCubit;
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppManagerCubit>();
    userProvider = context.read<UserProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await appCubit.checkAppUpdate((hasUpdate) {
        if (hasUpdate) {
          return AppNavigator.pushAndRemoveUntil(UpdateAppPage());
        }
        appCubit.checkRedirections(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        message: 'لا يوجد اتصال بالإنترنت',
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLogoCrmLong),
                20.verticalSpace,
                BlocBuilder<AppManagerCubit, AppManagerState>(
                  builder: (context, state) {
                    if (state.updateState.isError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomErrorWidget(
                          message:
                              "Please check your connection and try again.",
                          onPressed: () async {
                            await appCubit.checkAppUpdate((hasUpdate) {
                              if (hasUpdate) {
                                return AppNavigator.pushAndRemoveUntil(
                                    UpdateAppPage());
                              }
                              appCubit.checkRedirections(context);
                            });
                          },
                        ),
                      );
                    } else if (state.checkRedirectionsState.isError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomErrorWidget(
                          message:
                              "Please check your connection and try again.",
                          onPressed: () {
                            appCubit.checkRedirections(context);
                          },
                        ),
                      );
                    }
                    return const AppLoader();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint("dispooooooooose splash screen");

    super.dispose();
  }
}
