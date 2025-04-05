import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/task_management/data/models/task_log_model.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

class ChangesTabView extends StatelessWidget {
  const ChangesTabView({
    super.key,
  });

  // Obtener icono para el tipo de cambio
  IconData _getIconForLogType(String? logType) {
    if (logType == null) return Icons.change_circle_outlined;

    if (logType.contains('انشاء') || logType.contains('إنشاء'))
      return Icons.add_circle_outline;
    if (logType.contains('تعديل')) return Icons.edit_outlined;
    if (logType.contains('حالة')) return Icons.swap_horiz_outlined;
    if (logType.contains('تعليق')) return Icons.comment_outlined;
    if (logType.contains('مرفق') || logType.contains('ملف'))
      return Icons.attach_file_outlined;
    if (logType.contains('حذف')) return Icons.delete_outline;
    if (logType.contains('تقييم')) return Icons.star_outline;

    return Icons.change_circle_outlined;
  }

  // Obtener color para el tipo de cambio
  Color _getColorForLogType(String? logType) {
    if (logType == null) return AppColors.primaryMain;

    if (logType.contains('انشاء') || logType.contains('إنشاء'))
      return Colors.green;
    if (logType.contains('تعديل')) return Colors.blue;
    if (logType.contains('حالة')) return Colors.orange;
    if (logType.contains('تعليق')) return Colors.purple;
    if (logType.contains('مرفق') || logType.contains('ملف')) return Colors.teal;
    if (logType.contains('حذف')) return Colors.red;
    if (logType.contains('تقييم')) return Colors.amber;

    return AppColors.primaryMain;
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TaskCubit, TaskState, BlocStatus<List<TaskLogModel>>>(
      selector: (state) => state.getTaskLog,
      builder: (context, state) {
        return state.when(
          success: (data) => data == null || data.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_outlined,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16),
                      AppText(
                        'لا توجد تغييرات',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final item = data[index];
                    final Color itemColor = _getColorForLogType(item.logType);
                    final IconData itemIcon = _getIconForLogType(item.logType);
                    final bool isLast = index == data.length - 1;

                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Timeline column
                          Column(
                            children: [
                              // Timeline circle
                              // Container(
                              //   width: 40,
                              //   height: 40,
                              //   decoration: BoxDecoration(
                              //     color: itemColor.withOpacity(0.1),
                              //     shape: BoxShape.circle,
                              //     border: Border.all(
                              //       color: itemColor,
                              //       width: 2,
                              //     ),
                              //   ),
                              //   child: Icon(
                              //     itemIcon,
                              //     color: itemColor,
                              //     size: 20,
                              //   ),
                              // ),
                              // Timeline line
                              if (!isLast)
                                Container(
                                  width: 2,
                                  height: 80,
                                  color: Colors.grey.shade300,
                                ),
                            ],
                          ),
                          SizedBox(width: 16),
                          // Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Date and user row
                                Row(
                                  children: [
                                    // User avatar
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: itemColor.withOpacity(0.5),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 3,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: item.imgImage != null
                                            ? NetworkImage(item.imgImage!)
                                            : null,
                                        backgroundColor:
                                            itemColor.withOpacity(0.2),
                                        child: ((item.imgImage == null) &&
                                                (item.updatedBy?.isNotEmpty ??
                                                    false))
                                            ? Center(
                                                child: AppText(
                                                  item.updatedBy!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  color: itemColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : null,
                                        radius: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    // Username and action
                                    Expanded(
                                      child: AppText(
                                        (item.logType ?? ''),
                                        color: itemColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                // Time
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6, bottom: 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.grey.shade600,
                                        size: 14,
                                      ),
                                      SizedBox(width: 4),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: AppText(
                                          Intl.DateFormat('dd MMM yyyy HH:mm')
                                              .format(item.date!),
                                          color: Colors.grey.shade600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Main content card
                                if ((item.value?.isNotEmpty ?? false))
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.grey.shade200,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.03),
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...(item.value ?? [])
                                            .map((change) => Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 4),
                                                        child: Container(
                                                          width: 6,
                                                          height: 6,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: itemColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Expanded(
                                                        child: AppText(
                                                          change,
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                            .toList(),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
          failure: (error, data) => AppErrorWidget(message: error),
        );
      },
    );
  }
}
