part of 'client_dept_bloc.dart';

@immutable
class ClientDeptState {
  final BlocStatus<List<ClientDeptModel>> getClientDeptList;
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool hasReachedMax;
  final int totalCount;

  final BlocStatus reportPayoutClientStatus;

  const ClientDeptState({
    this.getClientDeptList = const BlocStatus.initial(),
    this.reportPayoutClientStatus = const BlocStatus.initial(),
    this.getInvoicesByPrivilegesParams = const GetInvoicesByPrivilegesParams(),
    this.hasReachedMax = false,
    this.totalCount = 0,
  });

  ClientDeptState copyWith({
    BlocStatus<List<ClientDeptModel>>? getClientDeptList,
    BlocStatus? reportPayoutClientStatus,
    ValueGetter<GetInvoicesByPrivilegesParams?>? getInvoicesByPrivilegesParams,
    bool? hasReachedMax,
    int? totalCount,
  }) {
    return ClientDeptState(
      getClientDeptList: getClientDeptList ?? this.getClientDeptList,
      reportPayoutClientStatus: reportPayoutClientStatus ?? this.reportPayoutClientStatus,
      totalCount: totalCount ?? this.totalCount,
      getInvoicesByPrivilegesParams: getInvoicesByPrivilegesParams != null ? getInvoicesByPrivilegesParams() : this.getInvoicesByPrivilegesParams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,

    );
  }
}
