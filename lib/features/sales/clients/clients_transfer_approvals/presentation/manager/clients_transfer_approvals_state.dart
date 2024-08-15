part of 'clients_transfer_approvals_cubit.dart';

class ClientsTransferApprovalsState extends Equatable {
  final BlocStatus<bool> getClientsTransferApprovalsStatus;
  final BlocStatus filterClientsTransferApprovalsStatus;

  ClientsTransferApprovalsState({
    this.getClientsTransferApprovalsStatus = const BlocStatus<bool>.initial(),
    this.filterClientsTransferApprovalsStatus =
        const BlocStatus<bool>.initial(),
  });

  ClientsTransferApprovalsState copyWith({
    BlocStatus<bool>? getClientsTransferApprovalsStatus,
    BlocStatus? filterClientsTransferApprovalsStatus,
  }) {
    return ClientsTransferApprovalsState(
      getClientsTransferApprovalsStatus: getClientsTransferApprovalsStatus ??
          this.getClientsTransferApprovalsStatus,
      filterClientsTransferApprovalsStatus:
          filterClientsTransferApprovalsStatus ??
              this.filterClientsTransferApprovalsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getClientsTransferApprovalsStatus,
      filterClientsTransferApprovalsStatus,
    ];
  }
}
