import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:intl/intl.dart' as Intl;
import '../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../data/models/task_model.dart';

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
                child: Column(
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
                    _buildInfoRow('من فرع:', '${task.assignFrom?.nameRegion == '' ? task.assignFromModel.toString() : task.assignFrom?.nameRegion}'),
                    _buildInfoRow('إلى فرع:', '${task.assignFrom?.nameRegion == '' ? task.assignToModel.toString() : task.assignFrom?.nameRegion}'),
                    _buildInfoRow('من قسم:', '${task.assignFrom?.nameMange == '' ? task.assignFromModel : task.assignFrom?.nameMange}'),
                    _buildInfoRow('إلى قسم:', '${task.assignTo?.nameMange == '' ? task.assignToModel : task.assignTo?.nameMange}'),
                    SizedBox(height: 4),
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