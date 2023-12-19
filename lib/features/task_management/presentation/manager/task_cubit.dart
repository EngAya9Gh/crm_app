import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_task_page.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/models/task_model.dart';
import '../../domain/use_cases/add_task_usecase.dart';
import '../../domain/use_cases/filter_tasks_usecase.dart';

part 'task_state.dart';

enum TaskStatus {
  Open,
  Pending,
  Completed,
  Testing,
  InProgress,
  InReview,
  Accepted,
  Rejected,
  Blocked,
  Closed,
}

@lazySingleton
class TaskCubit extends Cubit<TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final FilterTaskUsecase _filterTaskUsecase;

  TaskCubit(
    this._addTaskUsecase,
    this._filterTaskUsecase,
  ) : super(TaskState());

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

  addTaskAction({
    required VoidCallback onSuccess,
    required String taskName,
    required String regionId,
    required String departmentId,
    String? numberOfRecurring,
  }) async {
    emit(state.copyWith(addTaskStatus: const BlocStatus.loading()));

    final result = await _addTaskUsecase(AddTaskParams(
      title: taskName,
      file: state.attachmentFile!,
      assignTo: state.selectedAssignTo!,
      deadLineDate: state.deadLineDate!,
      participants: state.selectedParticipant!,
      startDate: state.startDate!,
      numberOfRecurring: numberOfRecurring,
      isRecurring: state.isRecurring,
      recurringType: state.selectedRecurringType?.name,
      regionId: regionId,
      departmentId: departmentId,
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

  onChangeTaskStatus(TaskStatus? status) {
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

  @override
  Future<void> close() {
    GetIt.I.resetLazySingleton<TaskCubit>();
    return super.close();
  }
}
