part of 'client_task_bloc.dart';

@immutable
class ClientTaskState {
  final BlocStatus<List<TaskModel>> listClientTasks;
  final int totalCount;

  const ClientTaskState({
    this.listClientTasks = const BlocStatus.initial(),
    this.totalCount = 0,
  });

  ClientTaskState copyWith({
    BlocStatus<List<TaskModel>>? listClientTasks,
    int? totalCount,
  }) {
    return ClientTaskState(
      listClientTasks: listClientTasks ?? this.listClientTasks,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
