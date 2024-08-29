import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/task_cubit.dart';
import '../pages/change_status_dialog.dart';

class TasksPaginatedList extends StatefulWidget {
  const TasksPaginatedList({super.key});

  @override
  State<TasksPaginatedList> createState() => _TasksPaginatedListState();
}

class _TasksPaginatedListState extends State<TasksPaginatedList> {
  late final TaskCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<TaskCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      buildWhen: (previous, current) =>
          previous.getTasksStatus != current.getTasksStatus,
      builder: (context, state) {
        return AppPaginatedList(
          items: _cubit.pageVariables.allList,
          itemBuilder: (context, index) => _buildCard(index, context),
          isLoading: state.getTasksStatus.isLoading(),
          hasReachedEnd: _cubit.pageVariables.hasReachedEnd,
          onLoadMore: () => _cubit.getTasks(isNewFilter: false),
        );
      },
    );
  }

  InkWell _buildCard(int index, BuildContext context) {
    final task = _cubit.pageVariables.allList[index];
    final assignToUserName = task.assignedToUser!.nameUser;
    final firstList = assignToUserName?.split(' ').firstOrNull;
    final secondList = assignToUserName?.split(' ').lastOrNull;
    String? firstChar =
        (firstList?.isNotEmpty ?? false) ? firstList?.substring(0, 1) : '';
    String? secondChar =
        (secondList?.isNotEmpty ?? false) ? secondList?.substring(0, 1) : '';
    StringBuffer buffer = StringBuffer();

    if (firstChar == null) {
      firstChar = assignToUserName?.substring(0, 1);
    }
    if (secondChar == null) {
      secondChar = assignToUserName?.substring(1, 2);
    }

    buffer.writeAll([firstChar, secondChar], '.');

    final status = TaskStatusType.values
        .firstWhereOrNull((element) => element.name == task.name);
    return InkWell(
      onTap: status != null &&
              status != TaskStatusType.Evaluated &&
              context.read<PrivilegesCubit>().checkPrivilege('165')
          ? () {
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierLabel: task.id.toString(),
                builder: (context) => BlocProvider.value(
                  value: _cubit,
                  child: ChangeStatusTaskDialog(
                    status: status,
                    taskModel: task,
                  ),
                ),
              );
            }
          : null,
      child: IntrinsicHeight(
        child: Row(
          children: [
            5.horizontalSpace,
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: status?.color,
                borderRadius: BorderRadius.circular(5).r,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Row(
                    children: [
                      20.horizontalSpace,
                      CircleAvatar(
                        backgroundColor: status?.color,
                        child: Center(
                          child: AppText(
                            buffer.toString(),
                            style: context.textTheme.titleMedium!
                                .copyWith(color: context.colorScheme.white),
                          ),
                        ),
                        radius: 22,
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title ?? '',
                            style: context.textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Row(
                            children: [
                              Text(
                                task.assignedByUser!.nameUser.toString(),
                                style: context.textTheme.bodySmall!.copyWith(
                                    color: context.colorScheme.grey500),
                              ),
                              if ((task.assignedByUser?.nameUser?.isNotEmpty ??
                                      false) &&
                                  (task.assignedToUser?.nameUser?.isNotEmpty ??
                                      false))
                                Text(' --> '),
                              Text(
                                task.assignedToUser!.nameUser.toString(),
                                style: context.textTheme.bodySmall!.copyWith(
                                    color: context.colorScheme.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (task.description?.isNotEmpty ?? false) ...{
                    10.verticalSpace,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                        child: AppText(
                          task.description ?? '',
                          style: context.textTheme.labelSmall!
                              .copyWith(color: context.colorScheme.grey600),
                        ),
                      ),
                    ),
                  },
                  10.verticalSpace,
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(start: 20.0, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppText(
                              'من فرع: ',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey500),
                            ),
                            AppText(
                              '${task.assignedByUser?.nameRegoin == '' ? task.assigendRegionFrom.toString() : task.assignedByUser?.nameRegoin}',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey800),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppText(
                              'إلى فرع: ',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey500),
                            ),
                            AppText(
                              '${task.assignedToUser?.nameRegoin == '' ? task.assigendRegionTo.toString() : task.assignedToUser?.nameRegoin}',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  5.verticalSpace,
                  Padding(
                    padding: HWEdgeInsetsDirectional.only(start: 20.0, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppText(
                              'من قسم: ',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey500),
                            ),
                            AppText(
                              '${task.assignedByUser?.nameMange == '' ? task.assigendDepartmentFromName : task.assignedByUser?.nameMange}',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey800),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppText(
                              'إلى قسم: ',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey500),
                            ),
                            AppText(
                              '${task.assignedToUser?.nameMange == '' ? task.assigendDepartmentToName : task.assignedToUser?.nameMange}',
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.colorScheme.grey800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.horizontalSpace,
                      Icon(Icons.date_range_rounded,
                          size: 15, color: context.colorScheme.grey600),
                      5.horizontalSpace,
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: AppText(
                          Intl.DateFormat('dd MMM hh:mm a')
                              .format(task.startDate ?? DateTime.now()),
                          style: context.textTheme.labelSmall!
                              .copyWith(color: context.colorScheme.grey600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
