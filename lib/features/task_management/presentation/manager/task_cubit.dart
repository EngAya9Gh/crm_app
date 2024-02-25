import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/nullable.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_task_page.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/regoin_model.dart';
import '../../data/models/task_model.dart';
import '../../data/models/user_region_department.dart';
import '../../domain/use_cases/add_task_usecase.dart';
import '../../domain/use_cases/change_status_usecase.dart';
import '../../domain/use_cases/filter_tasks_usecase.dart';

part 'task_state.dart';

@lazySingleton
class TaskCubit extends Cubit<TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final FilterTaskUsecase _filterTaskUsecase;
  final ChangeStatusTaskUsecase _changeStatusTaskUsecase;

  TaskCubit(
    this._addTaskUsecase,
    this._filterTaskUsecase,
    this._changeStatusTaskUsecase,
  ) : super(TaskState());

  onChangeAssignTo(UserRegionDepartment? userModel) {
    if (userModel == null) return;
    emit(state.copyWith(selectedAssignTo: userModel));
  }

  onChangeParticipants(List<UserModel> participants) {
    emit(state.copyWith(selectedParticipant: participants));
  }

  onChangeStartDate(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  onChangeDeadLineDate(DateTime deadLineDate) {
    emit(state.copyWith(deadLineDate: deadLineDate));
  }

  onChangeIsRecurring(bool isRecurring) {
    emit(state.copyWith(isRecurring: isRecurring));
  }

  onChangeRecurringType(RecurringType? type) {
    if (type == null) return;
    emit(state.copyWith(selectedRecurringType: type));
  }

  onChangeAttachmentFile(File file) {
    emit(state.copyWith(attachmentFile: file));
  }

  addTaskAction({
    required VoidCallback onSuccess,
    required String? taskName,
    required String description,
    required String userId,
    PublicType? publicType,
    String? mainTypeTask,
    String? clientId,
    String? invoiceId,
    String? regionId,
    String? departmentId,
    String? numberOfRecurring,
  }) async {
    emit(state.copyWith(addTaskStatus: const BlocStatus.loading()));

    final result = await _addTaskUsecase(AddTaskParams(
      title: taskName,
      clientId: clientId,
      invoiceId: invoiceId,
      mainTypeTask: mainTypeTask,
      publicType: publicType?.value,
      file: state.attachmentFile,
      assignTo: state.selectedAssignedToType == AssignedToType.employee
          ? state.selectedAssignTo
          : null,
      deadLineDate: state.deadLineDate,
      participants: state.selectedParticipant ?? [],
      startDate: state.startDate,
      numberOfRecurring: numberOfRecurring,
      isRecurring: state.isRecurring,
      recurringType: state.selectedRecurringType?.name,
      regionId: state.selectedAssignedToType == AssignedToType.region
          ? regionId
          : null,
      departmentId: state.selectedAssignedToType == AssignedToType.department
          ? departmentId
          : null,
      description: description,
      userId: userId,
    ));

    result.fold(
      (exception, message) =>
          emit(state.copyWith(addTaskStatus: BlocStatus.fail(error: message))),
      (value) {
        onSuccess();
        emit(state.copyWith(
            addTaskStatus: const BlocStatus.success(), isResetAddTask: true));
      },
    );
  }

  getTasks({VoidCallback? onSuccess}) async {
    emit(state.copyWith(tasksState: const PageState.loading()));

    final result = await _filterTaskUsecase(FilterTaskParams(
      assignedTo: state.filterAssignTo?.idUser?.toString(),
      assignedBy: state.filterAssignFrom?.idUser?.toString(),
      startDateFrom: state.filterFromDate,
      startDateTo: state.filterToDate,
      departmentFrom: state.departmentFrom?.idmange,
      departmentTo: state.departmentTo?.idmange,
      regionFrom: state.regionFrom?.regionId,
      regionTo: state.regionTo?.regionId,
      myTasks: state.myTasks,
      myDepartment: state.myDepartment,
      myBranch: state.myBranch,
    ));

    result.fold(
      (exception, message) =>
          emit(state.copyWith(tasksState: const PageState.error())),
      (value) {
        List<TaskModel> list = value.data ?? [];
        if (state.selectedStatus != null) {
          list = list
              .where((element) => element.name == state.selectedStatus?.name)
              .toList();
        }
        onSuccess?.call();

        emit(state.copyWith(
          tasksState: PageState.loaded(data: value.data ?? []),
          tasksList: list,
        ));
      },
    );
  }

  onChangeTaskStatus(TaskStatusType? status) {
    List<TaskModel> list = state.tasksState.getDataWhenSuccess ?? [];

    if (state.selectedStatus != status) {
      list = list.where((element) => element.name == status?.name).toList();
    } else {
      status = null;
    }
    emit(state.copyWith(
      selectedStatus: Nullable.value(status),
      tasksList: list,
    ));
  }

  onChangeFilterFromDate(DateTime? date) {
    emit(state.copyWith(filterFromDate: Nullable.value(date)));
  }

  onChangeToDate(DateTime? date) {
    emit(state.copyWith(filterToDate: Nullable.value(date)));
  }

  onChangeFilterAssignFrom(UserRegionDepartment? user) {
    emit(state.copyWith(filterAssignFrom: Nullable.value(user)));
  }

  onChangeFilterAssignTo(UserRegionDepartment? user) {
    emit(state.copyWith(filterAssignTo: Nullable.value(user)));
  }

  onChangeDepartmentFrom(ManageModel? department) {
    emit(state.copyWith(departmentFrom: Nullable.value(department)));
  }

  onChangeDepartmentTo(ManageModel? department) {
    emit(state.copyWith(departmentTo: Nullable.value(department)));
  }

  onChangeRegionFrom(RegionModel? region) {
    emit(state.copyWith(regionFrom: Nullable.value(region)));
  }

  onChangeRegionTo(RegionModel? region) {
    emit(state.copyWith(regionTo: Nullable.value(region)));
  }

  onChangeMyTasks(String? myTasks) {
    emit(state.copyWith(myTasks: Nullable.value(myTasks)));
  }

  onChangeMyDepartment(String? myDepartment) {
    emit(state.copyWith(myDepartment: Nullable.value(myDepartment)));
  }

  onChangeMyBranch(String? myBranch) {
    emit(state.copyWith(myBranch: Nullable.value(myBranch)));
  }

  resetFilter(VoidCallback onSuccess) {
    emit(state.copyWith(isResetTasksState: true));
    getTasks(onSuccess: onSuccess);
  }

  resetAll() {
    emit(state.copyWith(isResetTasksState: true));
  }

  onChangeTaskStatusStage(TaskModel taskModel, TaskStatusType taskStatusType,
      VoidCallback onSuccess, String userId) async {
    emit(state.copyWith(changeTaskStatus: const BlocStatus.loading()));
    final response = await _changeStatusTaskUsecase(ChangeStatusTaskParams(
      taskStatusType.next.id.toString(),
      taskModel.id.toString(),
      userId,
    ));

    response.fold(
      (exception, message) => emit(
          state.copyWith(changeTaskStatus: BlocStatus.fail(error: message))),
      (value) {
        List<TaskModel> taskList = state.tasksList;
        if (state.selectedStatus != null) {
          taskList.removeWhere((element) => element.id == taskModel.id);
        } else {
          taskList = taskList
              .map((e) => e.id == taskModel.id
                  ? e.copyWith(
                      name: taskStatusType.next.name,
                      taskStatuseId: taskStatusType.next.id)
                  : e)
              .toList();
        }
        List<TaskModel> allTasks = state.tasksState.getDataWhenSuccess ?? [];

        allTasks = allTasks
            .map((e) => e.id == taskModel.id
                ? e.copyWith(
                    name: taskStatusType.next.name,
                    taskStatuseId: taskStatusType.next.id)
                : e)
            .toList();

        onSuccess();

        emit(state.copyWith(
          changeTaskStatus: const BlocStatus.success(),
          tasksState: PageState.loaded(data: allTasks),
          tasksList: taskList,
        ));
      },
    );
  }

  onChangeSelectedAssignedToType(AssignedToType? assignedToType) {
    emit(
        state.copyWith(selectedAssignedToType: Nullable.value(assignedToType)));
  }

  @override
  Future<void> close() {
    getIt.resetLazySingleton<TaskCubit>();
    return super.close();
  }
}
