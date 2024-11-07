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
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import 'package:intl/intl.dart' as intl;

import '../pages/add_activity_page.dart';

class WebCrudActivityListItem extends StatelessWidget {
  final ClientActivityModel activity;

  const WebCrudActivityListItem({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () async {
        AppNavigator.go(AddActivityPage(activity: activity,), isNew: false,);
      },
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              activity.nameEnterprise,
              color: AppColors.primaryMain,
              maxLines: 2,
            ),
          ),
          25.width,
          Expanded(
            flex: 1,
            child: AppText(
              activity.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  activity.startDate == null ? "" : intl.DateFormat("MMMM dd, hh:mm a").format(activity.startDate!),
                  overflow: TextOverflow.ellipsis,
                  fontSize: kIsWeb ? null : 10.sp,
                ),
                SizedBox(width: 8),
                AppText(
                  activity.endDate == null ? "" : intl.DateFormat("MMMM dd, hh:mm a").format(activity.endDate!),
                  fontSize: kIsWeb ? null : 10.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppStatusChip(
                  status: ActivityStateExtension.fromValue(activity.state).name,
                  color: ActivityStateExtension.fromValue(activity.state).color,
                ),
                30.width,
                AppIcon(
                  Icons.flag,
                  color: ActivityPriorityExtension.fromValue(activity.priority).color,
                ),
              ],
            ),
          )
    
        ],
      ),
    );
  }
}