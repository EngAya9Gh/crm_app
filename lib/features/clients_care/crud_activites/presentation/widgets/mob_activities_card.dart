import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import 'package:intl/intl.dart' as intl;

import '../../../client_communications/presentation/widgets/care_activity_update_dialog.dart';
import '../pages/add_activity_page.dart';

class MobActivityListItem extends StatelessWidget {
  final ClientActivityModel activity;
  final bool isCare ;
  final bool isClient;
  const MobActivityListItem({Key? key, required this.activity, this.isCare = false, this.isClient= false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () async{
        if(isClient){
          return;
        }else if(isCare){
          if(context.read<PrivilegesCubit>().checkPrivilege("304")){
            await AppConstants.showAppDialog(child: UpdateActivityDialog(activity: activity,));
          }
        }else{
          AppNavigator.go(AddActivityPage(activity: activity,), isNew: false,);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: AppText(
                activity.nameEnterprise,
                color: AppColors.primaryMain,
                maxLines: 2,
              ),),
              10.width,
              AppIcon(
                Icons.flag,
                color:  ActivityPriorityExtension.fromValue(activity.priority).color,
              ),
            ],
          ),
          10.height,
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child:AppText(
              activity.name,
              maxLines: 2,
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          10.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                activity.startDate==null?"":intl.DateFormat("MMMM dd, hh:mm a").format(activity.startDate!),
                overflow: TextOverflow.ellipsis,
                fontSize: kIsWeb?null:10.sp,
              ),
              Spacer(),
              AppText(
                activity.endDate==null?"":intl.DateFormat("MMMM dd, hh:mm a").format(activity.endDate!),
                fontSize: kIsWeb?null:10.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          10.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppStatusChip(status: ActivityStateExtension.fromValue(activity.state).name,color: ActivityStateExtension.fromValue(activity.state).color,),
              Spacer(),
              AppStatusChip(status: activity.type, color: AppColors.primaryMain,)
            ],
          ),

          ],
      ),
    );

  }
}