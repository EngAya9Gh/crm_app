import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import '../../../../../../features/clients_care/client_communications/data/models/client_activity_model.dart';

class ActivityCard extends StatelessWidget {
  final ClientActivityModel activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  Color _getPriorityColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.blue;
    }
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
                activity.state == "completed"
                    ? Icons.check_circle
                    : Icons.schedule,
                color: activity.state == "completed"
                    ? Colors.green
                    : Colors.orange,
              ),
              8.width,
              Expanded(
                child: AppText(
                  activity.name ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          if (activity.description != null) ...[
            4.height,
            AppText(
              activity.description!,
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ],
          8.height,
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              4.width,
              AppText(
                activity.startDate ?? '',
                fontSize: 12,
                color: Colors.grey,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: _getPriorityColor(activity.priority).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: AppText(
                  activity.priority ?? 'Normal',
                  fontSize: 12,
                  color: _getPriorityColor(activity.priority),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
