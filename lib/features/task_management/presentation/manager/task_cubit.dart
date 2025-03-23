import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/change_task_assign_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/get_list_clients_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/update_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/models/nullable.dart';
import '../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../model/commentmodel.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../data/models/task_model.dart';
import '../../data/models/task_status_info.dart';
import '../../data/models/user_region_department.dart';
import '../../data/models/users_report_model.dart';
import '../../domain/entities/tasks_page_variables_entity.dart';
import '../../domain/use_cases/add_comment_task_usecase.dart';
import '../../domain/use_cases/add_task_usecase.dart';
import '../../domain/use_cases/add_users_report_usecase.dart';
import '../../domain/use_cases/change_status_usecase.dart';
import '../../domain/use_cases/get_comments_task_usecase.dart';
import '../../domain/use_cases/get_tasks_usecase.dart';
import '../../../mangement/manage_users/domain/use_cases/get_user_select_task_management_usecase.dart';
import '../pages/add_task_page.dart';

part 'task_state.dart';

@lazySingleton
class TaskCubit extends Cubit<TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final GetTasksUsecase _getTasksUsecase;
  final ChangeStatusTaskUsecase _changeStatusTaskUsecase;
  final AddCommentTaskUsecase _addCommentTaskUsecase;
  final GetCommentsTaskUsecase _getCommentsTaskUsecase;
  final GetUsersReportsTaskUsecase _getUsersReportsTaskUsecase;
  final GetListClientsUsecase _getListClientUsecase;
  final ChangeTaskAssignUsecase _changeTaskAssignUsecase;
  final UpdateTaskUsecase _updateTaskUsecase;

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
    this._addCommentTaskUsecase,
    this._getCommentsTaskUsecase,
    this._getUsersReportsTaskUsecase,
    this._getListClientUsecase,
    this._changeTaskAssignUsecase,
    this._updateTaskUsecase,
  ) : super(TaskState());

  TasksPageVariablesEntity pageVariables = TasksPageVariablesEntity();

  void init() {
    pageVariables = TasksPageVariablesEntity();
  }

  onChangeAssignTo(UserModel? userModel) {
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
        statusName: status.id,
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
            count: value.count ?? 0);
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

  resetAddUpdate() {
    emit(state.copyWith(isResetAddTask: true));
  }

  addTaskAction({
    required VoidCallback onSuccess,
    required AddOrUpdateTaskParams addTaskParams,
  }) async {
    emit(state.copyWith(addTaskStatus: const BlocStatus.loading()));

    final result = await _addTaskUsecase(
        addTaskParams /*AddTaskParams(
      title: taskName,
      clientId: clientId,
      invoiceId: invoiceId,
      mainTypeTask: mainTypeTask,
      publicType: publicType?.value,
      file: state.attachmentFile,
      assignTo: ,
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
    )*/
        );

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addTaskStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        onSuccess();
        emit(state.copyWith(addTaskStatus: const BlocStatus.success(), isResetAddTask: true));
      },
    );
  }

  updateTask({
    required VoidCallback onSuccess,
    required AddOrUpdateTaskParams addTaskParams,
  }) async {
    emit(state.copyWith(addTaskStatus: const BlocStatus.loading()));

    final result = await _updateTaskUsecase(addTaskParams);

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addTaskStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        onSuccess();
        emit(state.copyWith(addTaskStatus: const BlocStatus.success(), isResetAddTask: true));
        pageVariables.allList = pageVariables.allList.map((e) => e.id == addTaskParams.taskId ? value.message! : e).toList();
      },
    );
  }

  changeTaskAssign({
    required VoidCallback onSuccess,
    required ChangeTaskAssignParams changeTaskAssignParams,
  }) async {
    emit(state.copyWith(changeTaskAssignStatus: const BlocStatus.loading()));

    final result = await _changeTaskAssignUsecase(changeTaskAssignParams);

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(changeTaskAssignStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        onSuccess();
        emit(state.copyWith(changeTaskAssignStatus: const BlocStatus.success(), isResetAddTask: true));
        pageVariables.allList = pageVariables.allList.map((e) => e.id == changeTaskAssignParams.taskId ? value.message! : e).toList();
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
            statusName: ((state.selectedStatus?.id ?? 1)),
            assignedTo: state.filterAssignTo?.idUser?.toString(),
            assignedBy: state.filterAssignFrom?.idUser.toString(),
            startDateFrom: state.filterFromDate,
            startDateTo: state.filterToDate,
            departmentFrom: state.departmentFrom?.idMange,
            departmentTo: state.departmentTo?.idMange,
            regionFrom: state.regionFrom?.branchId,
            regionTo: state.regionTo?.branchId,
            myTasks: state.myTasks,
            myDepartment: state.myDepartment,
            myBranch: pageVariables.selectedBranchModel.value?.branchId,
            userId: pageVariables.selectedUserModel.value?.idUser,
            managerId: pageVariables.selectedManagerModel.value?.idMange,
            atTime: pageVariables.atTime.value,
            afterTime: pageVariables.afterTime.value,
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
            pageVariables.hasReachedEnd = value.data.length < AppConstants.kPerPage;
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

  onChangeFilterAssignFrom(UserModel? user) {
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

  onChangeTaskStatusStage(TaskModel taskModel, TaskStatusType taskStatusType, VoidCallback onSuccess, String userId, bool fromDialog,
      [double? rate]) async {
    emit(state.copyWith(changeTaskStatus: const BlocStatus.loading()));
    final response = await _changeStatusTaskUsecase(ChangeStatusTaskParams(
      fromDialog ? taskStatusType.next.id.toString() : taskStatusType.id.toString(),
      taskModel.id.toString(),
      userId,
      rate,
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
              .map((e) =>
                  e.id == taskModel.id ? e.copyWith(status: e.status?.copyWith(name: taskStatusType.next.name, id: taskStatusType.next.id)) : e)
              .toList();
        }
        List<TaskModel> allTasks = List.from(pageVariables.allList);

        allTasks = allTasks
            .map((e) => e.id == taskModel.id ? e.copyWith(status: e.status?.copyWith(name: taskStatusType.next.name, id: taskStatusType.next.id)) : e)
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

  onChangeSelectedAssignedToType(AssignedTypeNew? assignedType) {
    emit(state.copyWith(selectedAssignedToType: Nullable.value(assignedType)));
  }

  onGetTaskComments(int taskId) async {
    emit(state.copyWith(getTaskComment: BlocStatus.loading()));
    final result = await _getCommentsTaskUsecase(AddTaskCommentParams(taskId: taskId, content: ''));
    result.extract(
      (exception, message) => emit(
        state.copyWith(getTaskComment: BlocStatus.fail(error: message)),
      ),
      (value) {
        if (value.message?.isEmpty ?? true) {
          emit(
            state.copyWith(getTaskComment: BlocStatus.empty()),
          );
          return;
        }
        emit(
          state.copyWith(getTaskComment: BlocStatus.success(data: value.message ?? [])),
        );
      },
    );
  }

  onAddTaskComment(AddTaskCommentParams params, VoidCallback? onSuccess) async {
    emit(state.copyWith(addComment: BlocStatus.loading()));
    final result = await _addCommentTaskUsecase(params);
    result.extract(
      (exception, message) => emit(
        state.copyWith(addComment: BlocStatus.fail(error: message)),
      ),
      (value) {
        onGetTaskComments(params.taskId);
        emit(
          state.copyWith(addComment: BlocStatus.success(data: value.message ?? [])),
        );
        onSuccess?.call();
      },
    );
  }

  getUserTaskReports(GetUsersReportsParams params, [VoidCallback? onSuccess]) async {
    if (state.getUsersTaskReportsStatus.isLoading()) {
      return;
    }
    emit(state.copyWith(getUsersTaskReportsStatus: BlocStatus.loading()));
    if (params.page == 1) {
      emit(state.copyWith(getUsersTaskReports: BlocStatus.loading()));
    }
    final result = await _getUsersReportsTaskUsecase(params);
    result.extract(
      (exception, message) => emit(
        state.copyWith(getUsersTaskReports: BlocStatus.fail(error: message), getUsersTaskReportsStatus: BlocStatus.fail(error: message)),
      ),
      (value) {
        onSuccess?.call();
        emit(state.copyWith(hasGetAllReports: (value.message?.isEmpty ?? false)));
        if (params.page > 1) {
          emit(
            state.copyWith(
                totalUserReportCount: value.count,
                getUsersTaskReports: BlocStatus.success(data: List.of(state.getUsersTaskReports.data ?? [])..addAll(value.message ?? [])),
                getUsersTaskReportsStatus: BlocStatus.success()),
          );
          return;
        }
        emit(
          state.copyWith(
              totalUserReportCount: value.count,
              getUsersTaskReports: BlocStatus.success(data: value.message ?? []),
              getUsersTaskReportsStatus: BlocStatus.success()),
        );
      },
    );
  }

  getListClient() async {
    emit(state.copyWith(getListClients: BlocStatus.loading()));
    final result = await _getListClientUsecase();
    result.extract(
      (exception, message) => emit(
        state.copyWith(getListClients: BlocStatus.fail(error: message)),
      ),
      (value) {
        emit(state.copyWith(getListClients: BlocStatus.success(data: value.message ?? [])));
      },
    );
  }

  @override
  Future<void> close() {
    getIt.resetLazySingleton<TaskCubit>();
    return super.close();
  }
}
