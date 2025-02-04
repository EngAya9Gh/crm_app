part of 'client_task_bloc.dart';

@immutable
class ClientTaskEvent {}

class GetClientTasksEvent extends ClientTaskEvent{
  final GetClientTasksParams params;

  GetClientTasksEvent({required this.params});
}