import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/models/nullable.dart';
import '../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/task_model.dart';
import '../../data/models/task_status_info.dart';
import '../../data/models/user_region_department.dart';
import '../../domain/entities/tasks_page_variables_entity.dart';
import '../../domain/use_cases/add_task_usecase.dart';
import '../../domain/use_cases/change_status_usecase.dart';
import '../../domain/use_cases/get_tasks_usecase.dart';
import '../pages/add_task_page.dart';

part 'task_state.dart';

@lazySingleton
class TaskCubit extends Cubit<TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final GetTasksUsecase _getTasksUsecase;
  final ChangeStatusTaskUsecase _changeStatusTaskUsecase;

  Map<TaskStatusType, TaskStatusInfo> taskStatusInfo = {
    TaskStatusType.Open: TaskStatusInfo(),
    TaskStatusType.receive: TaskStatusInfo(),
    TaskStatusType.Completed: TaskStatusInfo(),
    TaskStatusType.Evaluated: TaskStatusInfo(),
  };

  TaskCubit(
    this._addTaskUsecase,
    this._getTasksUsecase,
    this._changeStatusTaskUsecase,
  ) : super(TaskState());

  TasksPageVariablesEntity pageVariables = TasksPageVariablesEntity();

  void init() {
    pageVariables = TasksPageVariablesEntity();
  }

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

  onChangeStatus(TaskStatusType? status) {
    emit(state.copyWith(selectedStatus: Nullable.value(status)));
  }

  Future<void> getTasksForStatus(TaskStatusType status, {bool isLoadMore = false}) async {
    if (!isLoadMore) {
      taskStatusInfo[status] = TaskStatusInfo();
    }

    if (taskStatusInfo[status]?.hasReachedEnd ?? false) return;

    taskStatusInfo[status] = taskStatusInfo[status]!.copyWith(
      loadingStatus: const BlocStatus.loading(),
    );
    emit(state.copyWith()); // Trigger a state update

    final result = await _getTasksUsecase(
      GetTaskParams(
        skip: taskStatusInfo[status]?.tasks.length ?? 0,
        statusName: status.name,
        // ... other parameters ...
      ),
    );

    result.fold(
          (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        taskStatusInfo[status] = taskStatusInfo[status]!.copyWith(
          loadingStatus: BlocStatus.fail(error: e),
        );
        emit(state.copyWith());
      },
          (value) {
        final currentTasks = taskStatusInfo[status]?.tasks ?? [];
        taskStatusInfo[status] = taskStatusInfo[status]!.copyWith(
          tasks: [...currentTasks, ...value.data],
          hasReachedEnd: value.data.length < AppConstants.kPerPage,
          loadingStatus: const BlocStatus.success(),
          count: value.count??0
        );
        emit(state.copyWith());
      },
    );
  }

  Future<void> loadMoreTasksForStatus(TaskStatusType status) async {
    await getTasksForStatus(status, isLoadMore: true);
  }

  void loadInitialData() {
    TaskStatusType.values.forEach((status) {
      getTasksForStatus(status);
    });
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

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addTaskStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        onSuccess();
        emit(state.copyWith(
            addTaskStatus: const BlocStatus.success(), isResetAddTask: true));
      },
    );
  }


  Future<void> getTasks({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getTasksStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getTasksStatus: BlocStatus.loading()));
        final result = await _getTasksUsecase(
          GetTaskParams(
            skip: pageVariables.allList.length,
            filter: pageVariables.searchController.text,
            statusName: state.selectedStatus?.name,
            assignedTo: state.filterAssignTo?.idUser?.toString(),
            assignedBy: state.filterAssignFrom?.idUser?.toString(),
            startDateFrom: state.filterFromDate,
            startDateTo: state.filterToDate,
            departmentFrom: state.departmentFrom?.idMange,
            departmentTo: state.departmentTo?.idMange,
            regionFrom: state.regionFrom?.branchId,
            regionTo: state.regionTo?.branchId,
            myTasks: state.myTasks,
            myDepartment: state.myDepartment,
            myBranch: state.myBranch,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getTasksStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd =
                value.data.length < AppConstants.kPerPage;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getTasksStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getTasksStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_tickets',
      isDebounced: isDebounced,
    );
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

  onChangeRegionFrom(BranchModel? region) {
    emit(state.copyWith(regionFrom: Nullable.value(region)));
  }

  onChangeRegionTo(BranchModel? region) {
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

  resetFilter({VoidCallback? onSuccess}) {
    emit(state.copyWith(isResetTasksState: true));
    getTasks();
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

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(changeTaskStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        List<TaskModel> taskList = List.from(pageVariables.allList);
        if (state.selectedStatus != null) {
          taskList.removeWhere((element) => element.id == taskModel.id);
        } else {
          taskList = taskList
              .map((e) => e.id == taskModel.id
                  ? e.copyWith(
                      status: e.status?.copyWith(name: taskStatusType.next.name,id: taskStatusType.next.id))
                  : e)
              .toList();
        }
        List<TaskModel> allTasks = List.from(pageVariables.allList);

        allTasks = allTasks
            .map((e) => e.id == taskModel.id
                ? e.copyWith(
            status: e.status?.copyWith(name: taskStatusType.next.name,id: taskStatusType.next.id))
            : e)
            .toList();

        onSuccess();

        pageVariables.allList = List.from(allTasks);
        emit(state.copyWith(
          changeTaskStatus: const BlocStatus.success(),
          getTasksStatus: BlocStatus.success(),
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
