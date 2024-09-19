import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/theme/theme.dart';
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
            5.width,
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: status?.color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: status?.color,
                          child: Center(
                            child: AppText(
                              buffer.toString(),
                              color: context.colorScheme.white,
                            ),
                          ),
                          radius: 22.scaleIconsSize,
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              task.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                AppText(
                                  task.assignedByUser!.nameUser,
                                  color: context.colorScheme.grey500,
                                ),
                                if ((task.assignedByUser?.nameUser
                                            ?.isNotEmpty ??
                                        false) &&
                                    (task.assignedToUser?.nameUser
                                            ?.isNotEmpty ??
                                        false))
                                  AppText(' --> '),
                                AppText(
                                  task.assignedToUser!.nameUser.toString(),
                                  color: AppColors.primaryMain,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (task.description?.isNotEmpty ?? false) ...{
                      10.height,
                      Expanded(
                        child: AppText(
                          task.description ?? '',
                          color: context.colorScheme.grey600,
                        ),
                      ),
                    },
                    10.height,
                    Wrap(
                      children: [
                        Row(
                          children: [
                            AppText(
                              'من فرع: ',
                              color: context.colorScheme.grey500,
                            ),
                            AppText(
                              '${task.assignedByUser?.nameRegoin == '' ? task.assigendRegionFrom.toString() : task.assignedByUser?.nameRegoin}',
                              color: context.colorScheme.grey800,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppText(
                              'إلى فرع: ',
                              color: context.colorScheme.grey500,
                            ),
                            AppText(
                              '${task.assignedToUser?.nameRegoin == '' ? task.assigendRegionTo.toString() : task.assignedToUser?.nameRegoin}',
                              color: context.colorScheme.grey800,
                            ),
                          ],
                        ),
                      ],
                    ),
                    10.height,
                    Wrap(
                      children: [
                        Row(
                          children: [
                            AppText(
                              'من قسم: ',
                              color: context.colorScheme.grey500,
                            ),
                            AppText(
                              '${task.assignedByUser?.nameMange == '' ? task.assigendDepartmentFromName : task.assignedByUser?.nameMange}',
                              color: context.colorScheme.grey800,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppText(
                              'إلى قسم: ',
                              color: context.colorScheme.grey500,
                            ),
                            AppText(
                              '${task.assignedToUser?.nameMange == '' ? task.assigendDepartmentToName : task.assignedToUser?.nameMange}',
                              color: context.colorScheme.grey800,
                            ),
                          ],
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppIcon(Icons.date_range_rounded,
                            color: context.colorScheme.grey600),
                        5.width,
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: AppText(
                            Intl.DateFormat('dd MMM hh:mm a')
                                .format(task.startDate ?? DateTime.now()),
                            color: context.colorScheme.grey600,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    10.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
