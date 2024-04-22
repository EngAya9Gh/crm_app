part of 'support_tab_cubit.dart';

class SupportTabState extends Equatable {
  final StateStatus getInvoiceByClientStatus;
  final String getInvoiceByClientMessage;

  final StateStatus addDateInstallStatus;

  final String addDateInstallMessage;

  final StateStatus setDateDoneStatus;
  final String setDateDoneMessage;

  const SupportTabState({
    this.getInvoiceByClientStatus = StateStatus.success,
    this.getInvoiceByClientMessage = '',
    this.addDateInstallStatus = StateStatus.success,
    this.addDateInstallMessage = '',
    this.setDateDoneStatus = StateStatus.success,
    this.setDateDoneMessage = '',
  });

  SupportTabState copyWith({
    StateStatus? getInvoiceByClientStatus,
    String? getInvoiceByClientMessage,
    StateStatus? addDateInstallStatus,
    String? addDateInstallMessage,
    StateStatus? setDateDoneStatus,
    String? setDateDoneMessage,
  }) {
    return SupportTabState(
      getInvoiceByClientStatus:
          getInvoiceByClientStatus ?? this.getInvoiceByClientStatus,
      getInvoiceByClientMessage:
          getInvoiceByClientMessage ?? this.getInvoiceByClientMessage,
      addDateInstallStatus: addDateInstallStatus ?? this.addDateInstallStatus,
      addDateInstallMessage:
          addDateInstallMessage ?? this.addDateInstallMessage,
      setDateDoneStatus: setDateDoneStatus ?? this.setDateDoneStatus,
      setDateDoneMessage: setDateDoneMessage ?? this.setDateDoneMessage,
    );
  }

  @override
  List<Object> get props => [
        getInvoiceByClientStatus,
        getInvoiceByClientMessage,
        addDateInstallStatus,
        addDateInstallMessage,
        setDateDoneStatus,
        setDateDoneMessage,
      ];
}
