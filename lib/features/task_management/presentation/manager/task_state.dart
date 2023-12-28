part of 'task_cubit.dart';

@immutable
class TaskState {
  const TaskState({
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
    this.departmentFrom,
    this.departmentTo,
    this.regionFrom,
    this.regionTo,
    this.tasksList = const [],
    this.tasksState = const PageState.init(),
    this.addTaskStatus = const BlocStatus.initial(),
    this.changeTaskStatus = const BlocStatus.initial(),
    this.selectedAssignedToType,
  });

  final UserRegionDepartment? selectedAssignTo;
  final List<UserModel>? selectedParticipant;
  final DateTime? startDate;
  final DateTime? deadLineDate;
  final File? attachmentFile;
  final RecurringType? selectedRecurringType;
  final bool? isRecurring;
  final BlocStatus addTaskStatus;
  final PageState<List<TaskModel>> tasksState;
  final List<TaskModel> tasksList;
  final TaskStatusType? selectedStatus;
  final UserRegionDepartment? filterAssignFrom;
  final UserRegionDepartment? filterAssignTo;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;
  final ManageModel? departmentFrom;
  final ManageModel? departmentTo;
  final RegionModel? regionFrom;
  final RegionModel? regionTo;
  final BlocStatus changeTaskStatus;
  final AssignedToType? selectedAssignedToType;

  TaskState copyWith({
    UserRegionDepartment? selectedAssignTo,
    List<UserModel>? selectedParticipant,
    DateTime? startDate,
    DateTime? deadLineDate,
    File? attachmentFile,
    RecurringType? selectedRecurringType,
    bool? isRecurring,
    BlocStatus? addTaskStatus,
    BlocStatus? changeTaskStatus,
    bool isResetAddTask = false,
    PageState<List<TaskModel>>? tasksState,
    List<TaskModel>? tasksList,
    Nullable<TaskStatusType?>? selectedStatus,
    Nullable<UserRegionDepartment?>? filterAssignFrom,
    Nullable<UserRegionDepartment?>? filterAssignTo,
    Nullable<DateTime?>? filterFromDate,
    Nullable<DateTime?>? filterToDate,
    final Nullable<ManageModel?>? departmentFrom,
    final Nullable<ManageModel?>? departmentTo,
    final Nullable<RegionModel?>? regionFrom,
    final Nullable<RegionModel?>? regionTo,
    final Nullable<AssignedToType?>? selectedAssignedToType,
    bool isResetTasksState = false,
  }) {
    return TaskState(
      selectedAssignTo: isResetAddTask ? null : selectedAssignTo ?? this.selectedAssignTo,
      selectedParticipant: isResetAddTask ? null : selectedParticipant ?? this.selectedParticipant,
      selectedAssignedToType: isResetAddTask
          ? null
          : selectedAssignedToType?.value != null
              ? selectedAssignedToType?.value
              : this.selectedAssignedToType,
      startDate: isResetAddTask ? null : startDate ?? this.startDate,
      deadLineDate: isResetAddTask ? null : deadLineDate ?? this.deadLineDate,
      attachmentFile: isResetAddTask ? null : attachmentFile ?? this.attachmentFile,
      selectedRecurringType: isResetAddTask ? null : selectedRecurringType ?? this.selectedRecurringType,
      isRecurring: isResetAddTask ? null : isRecurring ?? this.isRecurring,
      addTaskStatus: isResetAddTask ? const BlocStatus.initial() : addTaskStatus ?? this.addTaskStatus,
      tasksState: tasksState ?? this.tasksState,
      tasksList: tasksList ?? this.tasksList,
      changeTaskStatus: changeTaskStatus ?? this.changeTaskStatus,
      selectedStatus: selectedStatus != null ? selectedStatus.value : this.selectedStatus,
      filterAssignTo: isResetTasksState
          ? null
          : filterAssignTo != null
              ? filterAssignTo.value
              : this.filterAssignTo,
      filterFromDate: isResetTasksState
          ? null
          : filterFromDate != null
              ? filterFromDate.value
              : this.filterFromDate,
      filterAssignFrom: isResetTasksState
          ? null
          : filterAssignFrom != null
              ? filterAssignFrom.value
              : this.filterAssignFrom,
      filterToDate: isResetTasksState
          ? null
          : filterToDate != null
              ? filterToDate.value
              : this.filterToDate,
      regionFrom: isResetTasksState
          ? null
          : regionFrom != null
              ? regionFrom.value
              : this.regionFrom,
      regionTo: isResetTasksState
          ? null
          : regionTo != null
              ? regionTo.value
              : this.regionTo,
      departmentFrom: isResetTasksState
          ? null
          : departmentFrom != null
              ? departmentFrom.value
              : this.departmentFrom,
      departmentTo: isResetTasksState
          ? null
          : departmentTo != null
              ? departmentTo.value
              : this.departmentTo,
    );
  }
}
