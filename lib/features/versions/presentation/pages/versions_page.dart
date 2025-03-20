import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/pages/incomming_versions_page.dart';
import 'package:crm_smart/features/versions/presentation/pages/version_demand_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../widgets/custome_time_line_widget.dart';

class VersionsPage extends StatefulWidget {
  const VersionsPage({super.key});

  @override
  State<VersionsPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionsPage> {
  late final VersionsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<VersionsBloc>();
    _bloc.add(GetAllVersionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '', showBackButton: true, actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: AppTextButton(
              text: "الطلبات",
              onPressed: () {
                AppNavigator.go(
                  VersionOrderPage(),
                  name: AppRoutesNames.generalRoutes.versionOrder,
                );
              },
              textStyle: AppStyles.textStyle.copyWith(
                fontSize: (16.0).scaleFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.fontFamily1,
                color: AppColors.white,
              ),
              appButtonStyle: AppButtonStyle.secondary,
            ),
          ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: AppTextButton(
            text: "التحديثات\nالقادمة",
            onPressed: () {
              AppNavigator.go(
                IncommingVersionsPage(),
                name: AppRoutesNames.generalRoutes.showIncommingUpdate,
              );
            },
            textStyle: AppStyles.textStyle.copyWith(
              fontSize: (16.0).scaleFontSize,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.fontFamily1,
              color: AppColors.white,
            ),
            appButtonStyle: AppButtonStyle.secondary,
          ),
        ),
      ]),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return state.getAllVersionsStatus.when(
              loading: () => AppLoader(),
              success: (data) => ListView.builder(
                itemCount: (data?.length ?? 0) + 1, // Increment item count by 1
                padding: EdgeInsets.only(top: 10.h),
                itemBuilder: (context, index) {
                  if (index == 0 && (context.read<PrivilegesCubit>().checkPrivilege('310') == true)) {
                    // العقدة الاولى في البداية للاضافة
                    return CustomTimeLineVersionWidget(
                      index: -1,
                      isFirst: true,
                      isLast: false,
                      isPast: false,
                    );
                  } else {
                    // باقي العناصر (تحويل الفهرس بسبب العقدة الجديدة)
                    final adjustedIndex = (context.read<PrivilegesCubit>().checkPrivilege('310') == false) ? index : (index - 1); // تعويض الفهرس
                    print(adjustedIndex);
                    return CustomTimeLineVersionWidget(
                      index: adjustedIndex,
                      isFirst: false,
                      isLast: adjustedIndex == (data!.length - 1),
                      isPast: true,
                      versionModel: data[adjustedIndex],
                    );
                  }
                },
              ),
              empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
              failure: (error, data) => AppErrorWidget(
                message: error,
                onPressed: () => _bloc.add(GetAllVersionsEvent()),
              ),
            );
          },
        ),
      ),
    );
  }
}
