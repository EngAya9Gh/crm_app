import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';

class TaskStatusInfo {
  final List<TaskModel> tasks;
  final bool hasReachedEnd;
  final BlocStatus loadingStatus;
  final int totalCount;

  TaskStatusInfo({
    this.tasks = const [],
    this.hasReachedEnd = false,
    this.loadingStatus = const BlocStatus.initial(),
    this.totalCount = 0
  });

  TaskStatusInfo copyWith({
    List<TaskModel>? tasks,
    bool? hasReachedEnd,
    BlocStatus? loadingStatus,
    int? count,
  }) {
    return TaskStatusInfo(
      tasks: tasks ?? this.tasks,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      totalCount: count ?? this.totalCount,
    );
  }
}