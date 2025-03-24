import 'dart:math';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/location/branch_model.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/change_task_assign_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/get_task_by_id_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_task_page.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

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

ValueNotifier<AssignedTypeNew?> selectedTypeAssign = ValueNotifier(null);
ValueNotifier assign = ValueNotifier(null);

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

  GlobalKey<FormState> _formKey = GlobalKey();
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
                  builder: (context) => DialogTaskDetail(task: task, status: status, cubit: _cubit),
                  // builder: (context) => BlocProvider.value(
                  // value: _cubit,
                  // child: ChangeStatusTaskDialog(
                  // status: status,
                  // taskModel: task,
                  // tasksCubit: _cubit,
                  // ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PopupMenuButton(
                                offset: Offset(0, 10),
                                constraints: BoxConstraints(
                                    // Set the width to match screen width
                                    minWidth: 420.scaleWidth,
                                    maxWidth: 520.scaleWidth,
                                    maxHeight: 600.scaleHeight),
                                position: PopupMenuPosition.under,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      enabled: false,
                                      padding: EdgeInsets.all(10),
                                      child: AssignTOAnotherWidget(
                                        task: task,
                                        taskCubit: _cubit,
                                      )),
                                ],
                                child: Container(
                                  decoration: (status?.color != null)
                                      ? BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: status!.color))
                                      : null,
                                  child: CircleAvatar(
                                    backgroundImage: task.assignTo?.image != null
                                        ? NetworkImage(EndPoints.baseUrls.laravelFilesUrl + task.assignTo!.image!)
                                        : null,
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
                              ),
                              if (context.read<PrivilegesCubit>().checkPrivilege('339') &&
                                  ([task.assignFrom?.idUser.toString(), task.assignFrom?.idRegion.toString(), task.assignFrom?.idMange.toString()]
                                      .contains(context.read<UserProvider>().currentUser.idUser)))
                                IconButton(
                                    onPressed: () {
                                      context.read<TaskCubit>().getTaskById(
                                          onSuccess: (value) {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => AddTaskPage(
                                                  task: value,
                                                ),
                                              ),
                                            );
                                          },
                                          params: GetTaskByIdParams(idTask: task.id!));
                                    },
                                    icon: Icon(
                                      Icons.edit_square,
                                      color: AppColors.primaryMain,
                                    ))
                            ],
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

Widget assignToEmployeeWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.users)
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) => CustomSearchableDropDown<UserModel>(
            hint: 'الموظف',
            items: state.getUserSelected.data ?? [],
            itemAsString: (u) => u!.nameUser!,
            onChanged: (p0) {
              assigned.value = p0;
            },
            selectedItem: value,
            compareFn: (item, selectedItem) => item.id == selectedItem.id,
            filterFn: (user, filter) => user.nameUser!.contains(filter),
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.users) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget assignToDepartmentWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.managements)
    return Consumer<manage_provider>(
      builder: (context, manageList, child) {
        final userDepartment = context.read<UserProvider>().currentUser.typeAdministration;
        final list = getIt<PrivilegesCubit>().checkPrivilege('169')
            ? manageList.listMangTask
            : getIt<PrivilegesCubit>().checkPrivilege('168') || getIt<PrivilegesCubit>().checkPrivilege('174')
                ? manageList.listMangTask.where((element) => element.idMange == userDepartment).toList()
                : manageList.listMangTask;

        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) => CustomDropDown<ManageModel>(
            hint: 'القسم',
            items: list,
            compareFn: (item, selectedItem) => item.idMange == selectedItem.idMange,
            itemAsString: (item) => item!.name_mange,
            selectedItem: value,
            onChanged: (data) {
              assigned.value = data;
            },
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.managements) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget assignToRegionWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.regoin)
    return Consumer<RegionProvider>(
      builder: (context, cart, child) {
        final user = context.read<UserProvider>().currentUser;
        final list = context.read<PrivilegesCubit>().checkPrivilege('169')
            ? cart.listRegionTaskFilter
            : context.read<PrivilegesCubit>().checkPrivilege('167')
                ? cart.listRegionTaskFilter.where((element) => element.branchId == user.fkRegoin).toList()
                : cart.listRegionTaskFilter;
        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) => CustomDropDown<BranchModel>(
            hint: 'الفرع',
            items: list,
            compareFn: (item, selectedItem) => item.branchId == selectedItem.branchId,
            itemAsString: (branch) => branch!.branchName,
            selectedItem: value,
            onChanged: (data) {
              assigned.value = data as BranchModel;
            },
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.regoin) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget AssignTOAnotherWidget({required TaskModel task, required TaskCubit taskCubit}) {
  ValueNotifier<AssignedTypeNew?> selectedTypeAssign = ValueNotifier(null);
  ValueNotifier assign = ValueNotifier(null);
  GlobalKey<FormState> _formKey = GlobalKey();

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText('اسناد إلى'),
        5.height,
        ValueListenableBuilder(
          valueListenable: selectedTypeAssign,
          builder: (context, typeAssinged, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                CustomDropDown<AssignedTypeNew>(
                  hint: 'موظف / قسم/ فرع',
                  items: AssignedTypeNew.values,
                  itemAsString: (item) => item!.text,
                  selectedItem: typeAssinged,
                  compareFn: (item, selectedItem) => item.index == selectedItem.index,
                  onChanged: (value) {
                    assign.value = null;
                    selectedTypeAssign.value = value;
                  },
                  height: (135.0).scaleHeight,
                ),
                10.height,
                assignToEmployeeWidget(typeAssinged, assign),
                assignToRegionWidget(typeAssinged, assign),
                assignToDepartmentWidget(typeAssinged, assign),
              ],
            ),
          ),
        ),
        40.height,
        SizedBox(
            width: double.infinity,
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.changeTaskAssignStatus.isLoading(),
                  text: 'تاكيد العملية',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var id = selectedTypeAssign.value == AssignedTypeNew.users
                          ? ((assign.value as UserModel).id)
                          : selectedTypeAssign.value == AssignedTypeNew.managements
                              ? ((assign.value as ManageModel).idMange)
                              : ((assign.value as BranchModel).branchId);
                      taskCubit.changeTaskAssign(
                          onSuccess: () {
                            Navigator.pop(context);
                          },
                          changeTaskAssignParams: ChangeTaskAssignParams(
                            taskId: task.id!,
                            assignTo: selectedTypeAssign.value!.name.toString(),
                            assignToId: id,
                          ));
                    }
                  },
                );
              },
            )),
      ],
    ),
  );
}
