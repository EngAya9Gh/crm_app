import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/home/presentation/pages/home_page.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_logo.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_loader.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../bloc/app_manager_cubit.dart';
import 'update_app_page.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      if (kIsWeb) {
        AppNavigator.go(
          HomePage(),
          name: AppRoutesNames.generalRoutes.home,
        );
        return;
      }
      await appCubit.checkAppUpdate((hasUpdate) {
        if (hasUpdate) {
          return AppRouter.goRouter.pushReplacementNamed(
            AppRoutesNames.generalRoutes.updateApp,
          );
        }
      appCubit.checkRedirections(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ConnectivityWidgetWrapper(
        disableInteraction: true,
        message: 'لا يوجد اتصال بالإنترنت',
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.56,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryMain,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            AppText(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 30.scaleFontSize,
                                color: AppColors.white70,
                              ),
                            ),
                            SizedBox(height: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  'SMARTLIFE',
                                  style: TextStyle(
                                    fontSize: 37.scaleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 146.scaleWidth),
                                    Transform.scale(
                                      scale: 1.3,
                                      child: AppStatusChip(
                                        status: 'CRM',
                                        color: AppColors.secondaryMain,
                                        fontSize: 18.scaleFontSize,
                                      ),
                                    ),
                                    SizedBox(width: 20.scaleWidth),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Rest of the content
                  Expanded(
                    child: Center(
                      child: BlocBuilder<AppManagerCubit, AppManagerState>(
                        builder: (context, state) {
                          if (state.updateState.isError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppErrorWidget(
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
                              child: AppErrorWidget(
                                message:
                                    "Please check your connection and try again.",
                                onPressed: () {
                                  appCubit.checkRedirections(context);
                                },
                              ),
                            );
                          }
                          return const AppLoader.flicker();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
