part of 'client_dept_bloc.dart';

@immutable
class ClientDeptEvent {}

class GetClientDeptEvents extends ClientDeptEvent {
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool addNewFilter;
  GetClientDeptEvents({
    this.getInvoicesByPrivilegesParams,
    this.addNewFilter=false,
  });
}

class ReportPayoutClientDeptEvents extends ClientDeptEvent {
  final ReportClientParams params;
  final VoidCallback? onSuccess;

  ReportPayoutClientDeptEvents({required this.params, this.onSuccess});
}
class ResetFilterEvent extends ClientDeptEvent{}
