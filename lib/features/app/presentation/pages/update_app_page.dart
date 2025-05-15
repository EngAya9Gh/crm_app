import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_asset_image.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/generated/assets.dart';
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
import '../../../versions/presentation/pages/incomming_versions_page.dart';

class UpdateAppPage extends StatefulWidget {
  const UpdateAppPage({super.key});

  @override
  State<UpdateAppPage> createState() => _UpdateAppPageState();
}

class _UpdateAppPageState extends State<UpdateAppPage> {
  late final VersionsBloc _bloc;
  @override
  void initState() {
    _bloc = context.read<VersionsBloc>();
    _bloc.add(GetIncommingUpdateInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, managerState) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  AppText(
                    'لديك إصدار جديد من التطبيق',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryMain,
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: BlocBuilder<VersionsBloc, VersionsState>(
                      builder: (context, state) {
                        return state.incommingUpdateInfo.when(
                          success: (data) => Column(
                            children: [
                              // Update image
                              Container(
                                width: double.infinity,
                                height: 150.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: AppAssetImage(
                                    imagePath: Assets.imagesLogoCrmLong,
                                  ),
                                ),
                              ),
                              SizedBox(height: 18.h),
                              // Update info card
                              Expanded(
                                  child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(24.r),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Version header
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (data?.title != null)
                                                AppText(
                                                  data?.title ?? '',
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primaryMain,
                                                ),
                                              SizedBox(height: 4.h),
                                              AppText(
                                                data?.management ?? 'عام',
                                                fontSize: 16.sp,
                                                color: Colors.grey[700],
                                              ),
                                            ],
                                          ),
                                          if (data?.versionNo != null)
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.r,
                                                vertical: 6.r,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryMain
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                              child: AppText(
                                                data?.versionNo ?? '',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryMain,
                                              ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(height: 24.h),
                                      // Section title
                                      AppText(
                                        'الميزات الجديدة',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      SizedBox(height: 12.h),
                                      // Description with scroll
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: AppText(
                                            data?.description ?? '',
                                            fontSize: 16.sp,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      // Buttons
                                      Row(
                                        children: [
                                          Expanded(
                                            child: AppElevatedButton(
                                              height: 50.h,
                                              isLoading: managerState
                                                  .checkRedirectionsState
                                                  .isLoading,
                                              text: "تحديث الآن",
                                              textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              onPressed: () async {
                                                await StoreRedirect.redirect(
                                                  androidAppId:
                                                      "com.mpluse.crmsmart",
                                                  iOSAppId: "id6451082072",
                                                );
                                              },
                                            ),
                                          ),
                                          if (managerState.isUpdateMandatory !=
                                              true) ...[
                                            SizedBox(width: 16.w),
                                            Expanded(
                                              child: AppElevatedButton(
                                                height: 50.h,
                                                isLoading: managerState
                                                    .checkRedirectionsState
                                                    .isLoading,
                                                text: "تخطي",
                                                textStyle: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                backgroundColor:
                                                    Colors.grey[300],
                                                textColor: Colors.black87,
                                                onPressed: () => context
                                                    .read<AppManagerCubit>()
                                                    .checkRedirections(context),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                          failure: (error, data) {
                            return AppErrorWidget(message: error);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
