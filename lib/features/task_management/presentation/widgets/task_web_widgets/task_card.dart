import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:intl/intl.dart' as Intl;
import '../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../../../core/utils/app_colors.dart';
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
                            CircleAvatar(
                              backgroundColor: getColorForStatus(name: task.title),
                              child: Text(initials, style: TextStyle(color: Colors.white, fontSize: 12)),
                              radius: 14,
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
                                  SizedBox(height: 4),
                                  Text(
                                    task.assignTo?.nameUser ?? '',
                                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0),
                        Text(
                          task.description ?? '',
                          style: TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        _buildInfoRow(
                            (task.assignFromModel == 'region')
                                ? 'من فرع : '
                                : (task.assignFromModel == 'managements')
                                    ? "من قسم : "
                                    : "من مستخدم : ",
                            '${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser}'),
                        _buildInfoRow(
                            (task.assignToModel == 'region')
                                ? 'الى فرع : '
                                : (task.assignToModel == 'managements')
                                    ? "الى قسم : "
                                    : "الى مستخدم : ",
                            '${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser}'),
                        SizedBox(height: 4),
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
