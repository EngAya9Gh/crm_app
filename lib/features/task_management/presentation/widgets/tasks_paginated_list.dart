import 'dart:math';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/end_points.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/task_cubit.dart';
import 'dialog_task_detail.dart';

class TasksPaginatedList extends StatefulWidget {
  const TasksPaginatedList({super.key});

  @override
  State<TasksPaginatedList> createState() => _TasksPaginatedListState();
}

class _TasksPaginatedListState extends State<TasksPaginatedList> {
  late final TaskCubit _cubit;
  final listColors = [
    AppColors.primaryMain,
    AppColors.primaryAltLight,
    AppColors.primaryAltDark,
    AppColors.secondaryMain,
    AppColors.secondaryAltLight,
    AppColors.secondaryAltDark,
    AppColors.green,
  ];

  @override
  void initState() {
    _cubit = context.read<TaskCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
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

  Widget _buildCard(int index, BuildContext context) {
    final task = _cubit.pageVariables.allList[index];
    final assignToUserName = task.assignTo!.nameUser;
    final firstList = assignToUserName?.split(' ').firstOrNull;
    final secondList = assignToUserName?.split(' ').lastOrNull;
    String? firstChar = (firstList?.isNotEmpty ?? false) ? firstList?.substring(0, 1) : '';
    String? secondChar = (secondList?.isNotEmpty ?? false) ? secondList?.substring(0, 1) : '';
    StringBuffer buffer = StringBuffer();

    if (firstChar == null) {
      firstChar = assignToUserName?.substring(0, 1);
    }
    if (secondChar == null) {
      secondChar = assignToUserName?.substring(1, 2);
    }

    buffer.writeAll([firstChar, secondChar], '.');

    final status = TaskStatusType.values.firstWhereOrNull((element) => element.name == task.status?.name);
    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadiusDirectional.circular(8)),
      child: InkWell(
        onTap: status != null && context.read<PrivilegesCubit>().checkPrivilege('165')
            ? () {
                _cubit.onGetTaskComments(task.id!);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: task.id.toString(),
                  builder: (context) => DialogTaskDetail(task: task, status: status, cubit: _cubit), // builder: (context) => BlocProvider.value(
                  //   value: _cubit,
                  //   child: ChangeStatusTaskDialog(
                  //     status: status,
                  //     taskModel: task,
                  //     tasksCubit: _cubit,
                  //   ),
                  // ),
                );
              }
            : null,
        child: IntrinsicHeight(
          child: Stack(
            children: [
              if (task.status?.name == TaskStatusType.Open.name || task.status?.name == TaskStatusType.receive.name)
                PositionedDirectional(
                  child: Icon(
                    task.overDeadline == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 35,
                    color: task.overDeadline == 0 ? AppColors.green : AppColors.statusErrorActive,
                  ),
                  bottom: 0,
                  end: 5,
                ),
              Row(
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
                              Container(
                                decoration: (status?.color != null)
                                    ? BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: status!.color))
                                    : null,
                                child: CircleAvatar(
                                  backgroundImage:
                                      task.assignTo?.image != null ? NetworkImage(EndPoints.baseUrls.laravelFilesUrl + task.assignTo!.image!) : null,
                                  child: task.assignTo?.image == null
                                      ? Center(
                                          child: AppText(
                                            buffer.toString(),
                                            color: context.colorScheme.white,
                                          ),
                                        )
                                      : null,
                                  radius: 22.scaleIconsSize,
                                ),
                              ),
                              10.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    task.title,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                                          color: context.colorScheme.grey500,
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
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppText(
                                '${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser}',
                                color: context.colorScheme.grey500,
                              ),
                              AppText(' --> '),
                              // if ((task.assignFrom?.nameUser?.isNotEmpty ?? false) && (task.assignTo?.nameUser?.isNotEmpty ?? false))
                              AppText(
                                '${task.assignTo?.nameRegion ?? task.assignTo?.nameMange ?? task.assignTo?.nameUser}',
                                color: AppColors.primaryMain,
                              ),
                            ],
                          ),
                          if (task.timeTaken != null)
                            Row(
                              children: [
                                AppText(
                                  'عدد الساعات ما بين استلام المهمة واكمالها',
                                  color: context.colorScheme.grey500,
                                  fontSize: 12,
                                ),
                                AppText(' --> '),
                                AppText(
                                  task.timeTaken.toString(),
                                  color: AppColors.primaryMain,
                                ),
                              ],
                            ),
                          if (task.client != null) ...{
                            InkWell(
                              onTap: () {
                                AppNavigator.go(
                                  ClientProfile(idClient: task.client!.idClients),
                                  name: AppRoutesNames.clientProfile.inClientsList,
                                  pathParameters: {'idClient': task.client!.idClients.toString()},
                                );
                              },
                              child: AppText(
                                task.client?.nameEnterprise ?? '',
                                color: AppColors.primaryMain,
                              ),
                            ),
                            10.height,
                          },
                          if (task.description?.isNotEmpty ?? false) ...{
                            Expanded(
                              child: AppText(
                                task.description ?? '',
                                fontSize: 15.scaleFontSize,
                                color: context.colorScheme.grey600,
                              ),
                            ),
                          },
                          10.height,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppIcon(Icons.date_range_rounded, color: context.colorScheme.grey600),
                              5.width,
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: AppText(
                                  Intl.DateFormat('dd MMM hh:mm a').format(task.startDate ?? DateTime.now()),
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
            ],
          ),
        ),
      ),
    );
  }
}
