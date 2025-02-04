import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:intl/intl.dart' as Intl;
import '../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../data/models/task_model.dart';
import '../../manager/task_cubit.dart';

class TaskCard {
  static DragAndDropItem build(TaskModel task) {
    final assignToUserName = task.assignTo!.nameUser;
    final initials = getInitials(assignToUserName);

    return DragAndDropItem(
      child: Card(
        elevation: 1,
        child: Row(
          children: [
            SizedBox(width: 30), // Space for drag handle
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    if (task.status?.name == TaskStatusType.Open.name || task.status?.name == TaskStatusType.receive.name)
                      PositionedDirectional(
                        child: Icon(
                          task.overDeadline == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 40,
                          color: task.overDeadline == 0 ? AppColors.green : AppColors.statusErrorActive,
                        ),
                        bottom: 0,
                        end: 5,
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all(width: 2, color: getColorForStatus(name: task.status?.name ?? ''))),
                              child: CircleAvatar(
                                backgroundImage:
                                    task.assignTo?.image != null ? NetworkImage(EndPoints.baseUrls.laravelFilesUrl + task.assignTo!.image!) : null,
                                child:task.assignTo?.image==null? Center(
                                  child: AppText(initials, color: Colors.white, fontSize: 12),
                                ):null  ,
                                radius: 14,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task.title ?? "",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  8.height,
                                  if (((task.assignFrom?.nameRegion?.isEmpty ?? true) &&
                                          (task.assignFrom?.nameMange?.isEmpty ?? true) &&
                                          (task.assignFrom?.nameUser?.isEmpty ?? true)) &&
                                      ((task.assignTo?.nameRegion?.isEmpty ?? true) &&
                                          (task.assignTo?.nameMange?.isEmpty ?? true) &&
                                          (task.assignTo?.nameUser?.isEmpty ?? true)))
                                    Row(
                                      children: [
                                        AppText(
                                          (task.assignFromModel == 'region')
                                              ? 'فرع'
                                              : (task.assignFromModel == 'managements')
                                                  ? "قسم"
                                                  : "مستخدم",
                                          color: AppColors.grey.shade500,
                                        ),
                                        AppText(' --> '),
                                        // if ((task.assignFrom?.nameUser?.isNotEmpty ?? false) && (task.assignTo?.nameUser?.isNotEmpty ?? false))
                                        AppText(
                                          (task.assignFromModel == 'region')
                                              ? 'فرع'
                                              : (task.assignFromModel == 'managements')
                                                  ? "قسم"
                                                  : "مستخدم",
                                          color: AppColors.primaryMain,
                                        ),
                                      ],
                                    ),
                                  _buildInfoRow("${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser}",
                                      ' --> ${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (task.client != null) ...{
                          AppText(
                            task.client?.nameEnterprise ?? '',
                            color: AppColors.primaryMain,
                          ),
                          SizedBox(height: 8),
                        },
                        AppText(
                          task.description ?? '',
                          fontSize: 15.scaleFontSize,
                          color: AppColors.grey.shade500,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: (task.collaborators ?? [])
                                .map((e) => Tooltip(
                                      message: e.nameUser,
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: AppColors.primaryAltLight,
                                          child: AppText(e.nameUser?.substring(0, 2).toUpperCase())),
                                    ))
                                .toList()),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 12, color: Colors.grey[600]),
                                SizedBox(width: 4),
                                Text(
                                  Intl.DateFormat('dd MMM hh:mm a').format(task.startDate ?? DateTime.now()),
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  static String getInitials(String? fullName) {
    if (fullName == null || fullName.isEmpty) return '';
    List<String> names = fullName.split(" ");
    String initials = "";
    int numWords = names.length > 2 ? 2 : names.length;
    for (int i = 0; i < numWords; i++) {
      initials += names[i][0];
    }
    return initials.toUpperCase();
  }
}
