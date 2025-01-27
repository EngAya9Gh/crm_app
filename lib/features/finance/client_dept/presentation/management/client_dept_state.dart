part of 'client_dept_bloc.dart';

@immutable
class ClientDeptState {
  final BlocStatus<List<ClientDeptModel>> getClientDeptList;
  final int totalCount;
  final BlocStatus reportPayoutClientStatus;

  const ClientDeptState({
    this.getClientDeptList = const BlocStatus.initial(),
    this.reportPayoutClientStatus = const BlocStatus.initial(),
    this.totalCount = 0,
  });

  ClientDeptState copyWith({
    BlocStatus<List<ClientDeptModel>>? getClientDeptList,
    BlocStatus? reportPayoutClientStatus,
    int? totalCount,
  }) {
    return ClientDeptState(
      getClientDeptList: getClientDeptList ?? this.getClientDeptList,
      reportPayoutClientStatus: reportPayoutClientStatus ?? this.reportPayoutClientStatus,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
