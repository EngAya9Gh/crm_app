import 'dart:async';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/count_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/tasks_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../clients_care/accept_clients/presentation/widgets/filter_client_accept_sheet.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/task_cubit.dart';
import 'add_task_page.dart';

class TaskManagementListPage extends StatefulWidget {
  const TaskManagementListPage({super.key});

  @override
  State<TaskManagementListPage> createState() => _TaskManagementListPageState();
}

class _TaskManagementListPageState extends State<TaskManagementListPage> {
  late TaskCubit _taskCubit;
  late PrivilegesCubit _privilegesCubit;
  String? regionId;
  String? departmentId;
  String? userId;

  @override
  void initState() {
    super.initState();
    _privilegesCubit = context.read<PrivilegesCubit>();
    _taskCubit = getIt<TaskCubit>()..init();
    final currentUser = AppConstants.currentUser;
    departmentId = _privilegesCubit.checkPrivilege('161')
        ? '2'
        : _privilegesCubit.checkPrivilege('160')
            ? null
            : _privilegesCubit.checkPrivilege('159')
                ? currentUser.typeAdministration
                : null;
    regionId = _privilegesCubit.checkPrivilege('161')
        ? null
        : _privilegesCubit.checkPrivilege('162')
            ? currentUser.fkRegoin
            : null;

    userId = _privilegesCubit.checkPrivilege('163') ? currentUser.idUser : null;

    scheduleMicrotask(() {
      _taskCubit
        ..onChangeMyDepartment(departmentId)
        ..onChangeMyBranch(regionId)
        ..onChangeMyTasks(userId);

      _taskCubit.getTasks();
    });
  }

  @override
  void deactivate() {
    _taskCubit.resetAll();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'إدارة المهام',
        actions: [
          BlocBuilder<PrivilegesCubit, PrivilegesState>(
            builder: (context, state) {
              if (!_privilegesCubit.checkPrivilege('158')) {
                return SizedBox.shrink();
              }
              return AppTextButton(
                text: "إضافة\nمهمة",
                onPressed: () async {
                  final result = await AppNavigator.go(
                    AddTaskPage(),
                    isNew: false,
                  );
                  if (result == true) _taskCubit.getTasks();
                },
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: 16.scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                  color: AppColors.white,
                ),
                appButtonStyle: AppButtonStyle.secondary,
              );
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Padding(
              padding:
                  const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchWidget(
                      searchController:
                          _taskCubit.pageVariables.searchController,
                      onChanged: (value) {
                        _taskCubit.getTasks(isDebounced: true);
                      },
                    ),
                  ),
                  CustomFilterIcon(
                    onTap: () async {
                      final value = await AppBottomSheet.show(
                        context: context,
                        child: FilterClientAcceptSheet(),
                      );
                      if (value != true) {
                        // _taskCubit.returnToPreviousState();
                      }
                    },
                  ),
                  8.width,
                ],
              ),
            ),
            10.height,
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.grey100.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 50.scaleHeight,
                    child: Center(
                      child: AppPaginatedList(
                        scrollDirection: Axis.horizontal,
                        items: TaskStatusType.values,
                        itemBuilder: (context, index) => stageChip(
                          TaskStatusType.values[index],
                          state.selectedStatus == TaskStatusType.values[index],
                        ),
                        separatorBuilder: (context, index) => 10.width,
                      ),
                    ),
                  );
                },
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<TaskCubit, TaskState>(
                label: 'عدد المهام',
                countSelector: (state) =>
                    _taskCubit.pageVariables.allList.length,
                totalCount: (state) => _taskCubit.pageVariables.totalCount,
              ),
            ),
            BlocBuilder<TaskCubit, TaskState>(
              buildWhen: (previous, current) =>
                  previous.getTasksStatus != current.getTasksStatus &&
                  _taskCubit.pageVariables.isNewFilter,
              builder: (context, state) {
                return state.getTasksStatus.when(
                  success: (data) {
                    return Expanded(
                      child: TasksPaginatedList(),
                    );
                  },
                  failure: (error, data) => AppErrorWidget(
                    message: error,
                    onPressed: _taskCubit.getTasks,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  stageChip(
    TaskStatusType status,
    bool isActive,
  ) {
    return InkWell(
      onTap: () {
        _taskCubit.onChangeStatus(status);
        _taskCubit.getTasks();
      },
      child: AnimatedContainer(
        width: AppDimensions.currentWidth() / TaskStatusType.values.length,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive ? status.color : context.colorScheme.white,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        duration: const Duration(milliseconds: 300),
        child: AppText(
          status.text,
          color:
              isActive ? context.colorScheme.white : context.colorScheme.black,
        ),
      ),
    );
  }
}
