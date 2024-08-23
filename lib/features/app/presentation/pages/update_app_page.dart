import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/extensions/build_context.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../bloc/app_manager_cubit.dart';
import '../widgets/app_text.dart';

class UpdateAppPage extends StatefulWidget {
  const UpdateAppPage({super.key});

  @override
  State<UpdateAppPage> createState() => _UpdateAppPageState();
}

class _UpdateAppPageState extends State<UpdateAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppManagerCubit, AppManagerState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset('assest/images/update_app.jpg'),
                Transform.translate(
                  offset: Offset(0, -50),
                  child: Column(
                    children: [
                      AppText(
                        'هناك أخبار جديدة!!',
                        style: context.textTheme.headlineMedium,
                        textDirection: TextDirection.rtl,
                      ),
                      5.verticalSpace,
                      AppText(
                        'لديك اصدار جديد من التطبيق',
                        style: context.textTheme.titleMedium
                            .withColor(AppColors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: HWEdgeInsets.symmetric(horizontal: 30.0),
                  child: AppElevatedButton(
                    text: "تحديث الآن",
                    onPressed: () async {
                      await StoreRedirect.redirect(
                          androidAppId: "com.mpluse.crmsmart",
                          iOSAppId: "id6451082072");
                    },
                  ),
                ),
                if (state.isUpdateMandatory != true) ...[
                  BlocBuilder<AppManagerCubit, AppManagerState>(
                    builder: (context, state) {
                      if (state.updateState.isError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomErrorWidget(
                            message:
                                "Please check your connection and try again.",
                          ),
                        );
                      }
                      return Padding(
                        padding: HWEdgeInsets.symmetric(horizontal: 30.0),
                        child: AppElevatedButton(
                          isLoading: state.checkRedirectionsState.isLoading,
                          appButtonStyle: AppButtonStyle.secondary,
                          text: "تخطي",
                          onPressed: () {
                            BlocProvider.of<AppManagerCubit>(context,
                                    listen: false)
                                .checkRedirections(context);
                          },
                        ),
                      );
                    },
                  ),
                ],
                20.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
