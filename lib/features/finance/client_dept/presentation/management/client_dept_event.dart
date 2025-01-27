part of 'client_dept_bloc.dart';

@immutable
class ClientDeptEvent {}

class GetClientDeptEvents extends ClientDeptEvent {}

class ReportPayoutClientDeptEvents extends ClientDeptEvent {
  final ReportClientParams params;
  final VoidCallback? onSuccess;

  ReportPayoutClientDeptEvents({required this.params, this.onSuccess});
}
