part of 'task_cubit.dart';

@immutable
class TaskState {
  const TaskState( {
    this.selectedAssignTo,
    this.selectedParticipant,
    this.startDate,
    this.deadLineDate,
    this.attachmentFile,
    this.selectedRecurringType,
    this.isRecurring,
    this.selectedStatus,
    this.filterToDate,
    this.filterFromDate,
    this.filterAssignFrom,
    this.filterAssignTo,
    this.tasksList = const [],
    this.tasksState = const PageState.init(),
    this.addTaskStatus = const BlocStatus.initial(),
  });

  final UserModel? selectedAssignTo;
  final List<UserModel>? selectedParticipant;
  final DateTime? startDate;
  final DateTime? deadLineDate;
  final File? attachmentFile;
  final RecurringType? selectedRecurringType;
  final bool? isRecurring;
  final BlocStatus addTaskStatus;
  final PageState<List<TaskModel>> tasksState;
  final List<TaskModel> tasksList;
  final TaskStatus? selectedStatus;
  final UserModel? filterAssignFrom;
  final UserModel? filterAssignTo;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;

  TaskState copyWith({
    UserModel? selectedAssignTo,
    List<UserModel>? selectedParticipant,
    DateTime? startDate,
    DateTime? deadLineDate,
    File? attachmentFile,
    RecurringType? selectedRecurringType,
    bool? isRecurring,
    BlocStatus? addTaskStatus,
    bool isResetAddTask = false,
    PageState<List<TaskModel>>? tasksState,
    List<TaskModel>? tasksList,
    Nullable<TaskStatus?>? selectedStatus,
    Nullable<UserModel?>? filterAssignFrom,
    Nullable<UserModel?>? filterAssignTo,
    Nullable<DateTime?>? filterFromDate,
    Nullable<DateTime?>? filterToDate,
  }) {
    return TaskState(
      selectedAssignTo: isResetAddTask ? null : selectedAssignTo ?? this.selectedAssignTo,
      selectedParticipant: isResetAddTask ? null : selectedParticipant ?? this.selectedParticipant,
      startDate: isResetAddTask ? null : startDate ?? this.startDate,
      deadLineDate: isResetAddTask ? null : deadLineDate ?? this.deadLineDate,
      attachmentFile: isResetAddTask ? null : attachmentFile ?? this.attachmentFile,
      selectedRecurringType: isResetAddTask ? null : selectedRecurringType ?? this.selectedRecurringType,
      isRecurring: isResetAddTask ? null : isRecurring ?? this.isRecurring,
      addTaskStatus: isResetAddTask ? const BlocStatus.initial() : addTaskStatus ?? this.addTaskStatus,
      tasksState: tasksState ?? this.tasksState,
      tasksList: tasksList ?? this.tasksList,
      selectedStatus: selectedStatus != null ? selectedStatus.value : this.selectedStatus,
      filterAssignTo: filterAssignTo != null ? filterAssignTo.value : this.filterAssignTo,
      filterFromDate: filterFromDate != null ? filterFromDate.value : this.filterFromDate,
      filterAssignFrom: filterAssignFrom != null ? filterAssignFrom.value : this.filterAssignFrom,
      filterToDate: filterToDate != null ? filterToDate.value : this.filterToDate,
    );
  }
}
