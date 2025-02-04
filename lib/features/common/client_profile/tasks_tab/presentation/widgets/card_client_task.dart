import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../task_management/data/models/task_model.dart';
import '../../../../../task_management/presentation/manager/task_cubit.dart';

class ClientTaskCard extends StatelessWidget {
  final TaskModel task;

  const ClientTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: getColorForStatus(name: task.status?.name ?? ''))),
                  child: CircleAvatar(
                    backgroundImage:
                    task.assignTo?.image != null ? NetworkImage(EndPoints.baseUrls.laravelFilesUrl + task.assignTo!.image!) : null,
                    child:task.assignTo?.image==null? Center(
                      child: AppText(
                        task.assignTo?.nameUser?.substring(0,2).toUpperCase(),
                        color: AppColors.white,
                      ),
                    ):null,
                    radius: 22.scaleIconsSize,
                  ),
                ),
                10.width,
                AppText(
                  task.title ?? '',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            if (task.client?.nameEnterprise != null)
              AppText(
                task.client?.nameEnterprise ?? '',
                color: AppColors.primaryMain,
              ),
            if (task.description != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: AppText(
                  task.description!,
                ),
              ),
            Wrap(
                spacing: 5,
                runSpacing: 5,
                children: (task.collaborators ?? [])
                    .map((e) => Tooltip(
                          message: e.nameUser,
                          child: CircleAvatar(
                              radius: 16, backgroundColor: AppColors.primaryAltLight, child: AppText(e.nameUser?.substring(0, 2).toUpperCase())),
                        ))
                    .toList()),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        if (task.status != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: TaskStatusType.values.firstWhere((element) => element.name == task.status!.name).color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: AppText(
                              task.status?.name ?? "",
                              color: AppColors.white,
                            ),
                          ),
                        8.width,
                        Expanded(
                          child: AppText(
                            DateFormat('yyyy MMM dd HH:mm a').format(task.createdAt!),
                            color: AppColors.statusErrorActive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(task.overDeadline == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 40, color: task.overDeadline == 0 ? AppColors.green : AppColors.statusErrorActive)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
