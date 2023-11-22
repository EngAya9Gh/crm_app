import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:crm_smart/features/app/presentation/pages/splash_screen.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../core/utils/responsive_padding.dart';

class UpdateAppPage extends StatefulWidget {
  const UpdateAppPage({Key? key}) : super(key: key);

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
                        style: context.textTheme.titleMedium.withColor(AppColors.grey),
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
                      await StoreRedirect.redirect(androidAppId: "com.mpluse.crmsmart", iOSAppId: "id6451082072");
                    },
                  ),
                ),
                if (state.isUpdateMandatory != true)
                  Padding(
                    padding: HWEdgeInsets.symmetric(horizontal: 30.0),
                    child: AppElevatedButton(
                      appButtonStyle: AppButtonStyle.secondary,
                      text: "تخطي",
                      onPressed: () {
                        SplashScreen.checkLogin(context);
                      },
                    ),
                  ),
                20.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}
