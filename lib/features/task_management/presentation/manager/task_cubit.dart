import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_task_page.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/managmodel.dart';
import '../../../../model/regoin_model.dart';
import '../../data/models/task_model.dart';
import '../../data/models/user_region_department.dart';
import '../../domain/use_cases/add_task_usecase.dart';
import '../../domain/use_cases/change_status_usecase.dart';
import '../../domain/use_cases/filter_tasks_usecase.dart';

part 'task_state.dart';

enum TaskStatusType {
  Open,
  receive,
  Completed,
  Evaluated,
  // Testing,
  // InProgress,
  // InReview,
  // Rejected,
  // Blocked,
  // Closed,
}

extension TaskStatusExt on TaskStatusType {
  String get text {
    switch (this) {
      case TaskStatusType.Open:
        return "مفتوحة";
      case TaskStatusType.Evaluated:
        return "تم التقييم";
      case TaskStatusType.Completed:
        return "مكتملة";
      case TaskStatusType.receive:
        return "مستلمة";
    }
  }

  Color get color {
    switch (this) {
      case TaskStatusType.Open:
        return Colors.grey;
      case TaskStatusType.receive:
        return Colors.orange;
      case TaskStatusType.Evaluated:
        return Colors.green;
      case TaskStatusType.Completed:
        return Colors.indigoAccent;
    }
  }

  TaskStatusType get next {
    switch (this) {
      case TaskStatusType.Open:
        return TaskStatusType.receive;
      case TaskStatusType.receive:
        return TaskStatusType.Completed;
      case TaskStatusType.Completed:
        return TaskStatusType.Evaluated;
      case TaskStatusType.Evaluated:
        return TaskStatusType.Evaluated;
    }
  }
}

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
    required String taskName,
    String? regionId,
    String? departmentId,
    String? numberOfRecurring,
  }) async {
    emit(state.copyWith(addTaskStatus: const BlocStatus.loading()));

    final result = await _addTaskUsecase(AddTaskParams(
      title: taskName,
      file: state.attachmentFile!,
      assignTo: state.selectedAssignedToType == AssignedToType.employee ? state.selectedAssignTo! : null,
      deadLineDate: state.deadLineDate!,
      participants: state.selectedParticipant!,
      startDate: state.startDate!,
      numberOfRecurring: numberOfRecurring,
      isRecurring: state.isRecurring,
      recurringType: state.selectedRecurringType?.name,
      regionId: state.selectedAssignedToType == AssignedToType.region ? regionId : null,
      departmentId: state.selectedAssignedToType == AssignedToType.department ? departmentId : null,
    ));

    result.fold(
      (exception, message) => emit(state.copyWith(addTaskStatus: BlocStatus.fail(error: message))),
      (value) {
        onSuccess();
        emit(state.copyWith(addTaskStatus: const BlocStatus.success(), isResetAddTask: true));
      },
    );
  }

  getTasks({VoidCallback? onSuccess}) async {
    emit(state.copyWith(tasksState: const PageState.loading()));

    final result = await _filterTaskUsecase(FilterTaskParams(
      assignedTo: state.filterAssignTo?.idUser,
      assignedBy: state.filterAssignFrom?.idUser,
      startDateFrom: state.filterFromDate,
      startDateTo: state.filterToDate,
      departmentFrom: state.departmentFrom?.idmange,
      departmentTo: state.departmentTo?.idmange,
      regionFrom: state.regionFrom?.regionId,
      regionTo: state.regionTo?.regionId,
    ));

    result.fold(
      (exception, message) => emit(state.copyWith(tasksState: const PageState.error())),
      (value) {
        List<TaskModel> list = value.data ?? [];
        if (state.selectedStatus != null) {
          list = list.where((element) => element.name == state.selectedStatus?.name).toList();
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

  onChangeFilterAssignFrom(UserModel? user) {
    emit(state.copyWith(filterAssignFrom: Nullable.value(user)));
  }

  onChangeFilterAssignTo(UserModel? user) {
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

  resetFilter(VoidCallback onSuccess) {
    emit(state.copyWith(isResetTasksState: true));
    getTasks(onSuccess: onSuccess);
  }

  onChangeTaskStatusStage(TaskModel taskModel, TaskStatusType taskStatusType, VoidCallback onSuccess) async {
    emit(state.copyWith(changeTaskStatus: const BlocStatus.loading()));
    final response = await _changeStatusTaskUsecase(
        ChangeStatusTaskParams(taskModel.id.toString(), taskModel.taskStatuseId.toString()));

    response.fold(
      (exception, message) => emit(state.copyWith(changeTaskStatus: BlocStatus.fail(error: message))),
      (value) {
        List<TaskModel> taskList = state.tasksList;
        if (state.selectedStatus != null) {
          taskList.removeWhere((element) => element.id == element.id);
        } else {
          taskList = taskList
              .map((e) => e.id == taskModel.id
                  ? e.copyWith(
                      name: taskStatusType.next.name,
                      taskStatuseId:
                          e.taskStatuseId is int ? e.taskStatuseId + 1 : ((int.tryParse(e.taskStatuseId) ?? 0) + 1),
                    )
                  : e)
              .toList();
        }
        List<TaskModel> allTasks = state.tasksState.getDataWhenSuccess ?? [];

        allTasks = allTasks
            .map((e) => e.id == taskModel.id
                ? e.copyWith(
                    name: taskStatusType.next.name,
                    taskStatuseId:
                        e.taskStatuseId is int ? e.taskStatuseId + 1 : ((int.tryParse(e.taskStatuseId) ?? 0) + 1),
                  )
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
    emit(state.copyWith(selectedAssignedToType: Nullable.value(assignedToType)));
  }

  @override
  Future<void> close() {
    GetIt.I.resetLazySingleton<TaskCubit>();
    return super.close();
  }
}
