import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
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
    return AppScaffold(
      body: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
          return Container(
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/images/update_app.jpg'),
              ),
            ),
            child: Column(
              children: [
                30.height,
                AppText(
                  'هناك أخبار جديدة !!',
                  fontWeight: FontWeight.bold,
                  textDirection: TextDirection.rtl,
                ),
                10.height,
                AppText('لديك اصدار جديد من التطبيق'),
                Spacer(),
                AppElevatedButton(
                  isLoading: state.checkRedirectionsState.isLoading,
                  text: "تحديث الآن",
                  onPressed: () async {
                    await StoreRedirect.redirect(
                      androidAppId: "com.mpluse.crmsmart",
                      iOSAppId: "id6451082072",
                    );
                  },
                ),
                5.height,
                if (state.isUpdateMandatory != true) ...[
                  BlocBuilder<AppManagerCubit, AppManagerState>(
                    builder: (context, state) {
                      if (state.updateState.isError) {
                        return AppErrorWidget(
                          message:
                              "Please check your connection and try again.",
                        );
                      }
                      return AppElevatedButton(
                        isLoading: state.checkRedirectionsState.isLoading,
                        text: "تخطي",
                        backgroundColor: AppColors.grey,
                        onPressed: () => context
                            .read<AppManagerCubit>()
                            .checkRedirections(context),
                      );
                    },
                  ),
                ],
                20.height,
              ],
            ),
          );
        },
      ),
    );
  }
}
