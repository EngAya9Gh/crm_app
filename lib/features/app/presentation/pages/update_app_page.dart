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
      backgroundColor: AppColors.white,
      body: BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                40.height,
                AppText('لديك اصدار جديد من التطبيق'),
                Spacer(),
                BlocBuilder<VersionsBloc, VersionsState>(
                  builder: (context, state) {
                    return state.incommingUpdateInfo.when(
                      success: (data) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                5)),
                                    child: AppAssetImage(
                                      imagePath: Assets.imagesLogoCrmLong,
                                      // height: 30.37,
                                      // width: 137.59,
                                    ),
                                  ),
                                  10.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (data?.title != null)
                                          AppText(
                                            data?.title ?? '',
                                            fontSize: (25.0).scaleFontSize,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        8.height,
                                        AppText(
                                          data?.management ?? 'عام',
                                          fontSize: (20.0).scaleFontSize,
                                        ),
                                        8.height,
                                        if (data?.versionNo != null)
                                          AppText(
                                            data?.versionNo ?? '',
                                            fontSize: (18.0).scaleFontSize,
                                          ),
                                        16.height,
                                        AppText(
                                          (data?.description ?? ''),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      failure: (error, data) {
                        return AppErrorWidget(message: error);
                      },
                    );
                  },
                ),
                //IncommingVersionsPage(),
                //Image.asset('assest/images/update_app.jpg'),
                Spacer(),
               
                AppElevatedButton(
                  width: 165.w,
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
                if (state.isUpdateMandatory != true    ) ...[
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
                        width: 165.w,
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
