import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';


class ClientActivitiesCard extends StatelessWidget {
  final ClientActivityModel activity;
  const ClientActivitiesCard({Key? key, required this.activity, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                activity.nameUser,
                fontSize: kIsWeb?null:14.sp,
                overflow: TextOverflow.ellipsis,
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
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child:AppText(
                  activity.name,
                  maxLines: 2,
                  color: AppColors.primaryMain,
                  fontSize: kIsWeb?null:13,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              AppIcon(
                Icons.flag,
                color:  ActivityPriorityExtension.fromValue(activity.priority).color,
              ),
            ],
          ),
          10.height,
          AppText(
            activity.description,
            maxLines: 2,
            fontSize: kIsWeb?null:13.sp,
            overflow: TextOverflow.ellipsis,
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