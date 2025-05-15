import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_asset_image.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';

class IncommingVersionsPage extends StatefulWidget {
  const IncommingVersionsPage({super.key});

  @override
  State<IncommingVersionsPage> createState() => _IncommingVersionsPageState();
}

class _IncommingVersionsPageState extends State<IncommingVersionsPage> {
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
      backgroundColor: AppColors.outlineBorder,
      appBar: CustomAppBar(title: 'التحديثات القادمة', showBackButton: true),
      body: 
      Expanded(child: Directionality(
        textDirection: TextDirection.rtl,
        child: 
        BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return state.incommingUpdateInfo.when(
              success: (data) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadiusDirectional.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadiusDirectional.circular(5)),
                            child: AppAssetImage(
                              imagePath: Assets.imagesLogoCrmLong,
                              // height: 30.37,
                              // width: 137.59,
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data?.title != null)
                                  AppText(
                                    data?.title ?? '',
                                    fontSize: (25.0).scaleFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                2.height,
                                AppText(
                                  data?.management ?? 'عام',
                                  fontSize: (20.0).scaleFontSize,
                                ),
                                2.height,
                                if (data?.versionNo != null)
                                  AppText(
                                    data?.versionNo ?? '',
                                    fontSize: (18.0).scaleFontSize,
                                  ),
                                8.height,
                               SingleChildScrollView(
                                          child: AppText(
                                            data?.description ?? '',
                                            fontSize: 16.scaleFontSize,
                                            color: Colors.black87,
                                          
                                          ),
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
      ),    
    )) 
          ;
      } 
    }
