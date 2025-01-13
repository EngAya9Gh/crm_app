import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/widgets/version_detail_widget.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'add_new_entry_version_page.dart';
import 'new_entry_version_widget.dart';

class CustomTimeLineVersionWidget extends StatelessWidget {
  final int index;
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final VersionModel? versionModel;

  CustomTimeLineVersionWidget({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.index,
    this.versionModel,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // color: Colors.red,
        // height: 120.h,
        width: 950.w,
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          alignment: TimelineAlign.center,
          indicatorStyle: IndicatorStyle(
            width: 50,
            // color: Colors.blue,
            height: 100.h,
            iconStyle: IconStyle(
              iconData: isPast ? Icons.check : Icons.circle,
              color: Colors.black,
            ),
            indicator: Container(
              // color: Colors.blue,
              height: 150,
              width: 400,
              child: GestureDetector(
                onTap: isFirst
                    //add
                    ? () {
                        context.read<VersionsBloc>().add(ResetListAddedEvent());
                        AppNavigator.push(
                          AddVersionPage(),
                          name: AppRoutesNames.generalRoutes.addVersions,
                        );
                      }
                    //edit
                    :(context.read<PrivilegesCubit>().checkPrivilege('311') == true)? () {
                          context.read<VersionsBloc>().add(ResetListAddedEvent());
                          context.read<VersionsBloc>().add(AddOrUpdateNewVersionItemEvent(
                              oneItemVersionEntity: OneItemVersionEntity(
                                  index: 0,
                                  management: versionModel?.managementId.toString(),
                                  title: versionModel?.title,
                                  description: versionModel?.description)));
                          AppNavigator.go(
                            AddVersionPage(
                              versionModel: versionModel,
                            ),
                            name: AppRoutesNames.generalRoutes.addVersions,
                          );
                      }:null,
                child: Container(
                  height: 45.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 1),
                    // borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: !isFirst
                      ? FittedBox(
                          child: Text(
                            '${versionModel?.versionNo}',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10.sp),
                          ),
                        )
                      : Icon(Icons.add),
                ),
              ),
            ),
          ),
          beforeLineStyle: LineStyle(
            color: Colors.grey,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Colors.grey,
            thickness: 2,
          ),
          startChild: !isFirst && (index % 2 != 0) && versionModel != null ? VersionDetailWidget(versionModel: versionModel!) : null,
          endChild: !isFirst && (index % 2 == 0) && versionModel != null ? VersionDetailWidget(versionModel: versionModel!) : null,
        ),
      ),
    );
  }
}
