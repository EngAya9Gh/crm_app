import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import '../../../../../../features/task_management/data/models/task_model.dart';

class TaskCardNew extends StatelessWidget {
  final TaskModel task;

  const TaskCardNew(
      {Key? key, required this.task, required bool showEnterpriseName})
      : super(key: key);

  Color _getTaskStatusColor(num? percentage) {
    if (percentage == null) return Colors.grey;
    if (percentage >= 100) return Colors.green;
    if (percentage >= 50) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                task.completionPercentage == 100
                    ? Icons.check_circle
                    : Icons.schedule,
                color: task.completionPercentage == 100
                    ? Colors.green
                    : Colors.orange,
              ),
              8.width,
              Expanded(
                flex: 1,
                child: AppText(
                  task.title ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              8.width,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: _getTaskStatusColor(task.completionPercentage)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppText(
                  '${task.completionPercentage?.toInt() ?? 0}%',
                  fontSize: 12,
                  color: _getTaskStatusColor(task.completionPercentage),
                ),
              ),
            ],
          ),
          if (task.description != null && task.description!.isNotEmpty) ...[
            4.height,
            AppText(
              task.description!,
              fontSize: 14,
              color: Colors.grey[600],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          8.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                4.width,
                AppText(
                  task.startDate?.toString() ?? '',
                  fontSize: 12,
                  color: Colors.grey,
                ),
                if (task.deadline != null) ...[
                  8.width,
                  Icon(Icons.timer, size: 16, color: Colors.grey),
                  4.width,
                  AppText(
                    task.deadline.toString(),
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
