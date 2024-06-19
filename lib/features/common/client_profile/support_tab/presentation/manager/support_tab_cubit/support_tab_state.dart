part of 'support_tab_cubit.dart';

class SupportTabState extends Equatable {
  final int refreshUi;
  final StateStatus getInvoiceByClientStatus;
  final String getInvoiceByClientMessage;

  final BlocStatus addDateInstallStatus;
  final StateStatus setDateDoneStatus;
  final String setDateDoneMessage;

  final StateStatus setReadyInstallStatus;
  final String setReadyInstallMessage;

  const SupportTabState({
    this.refreshUi = 0,
    this.getInvoiceByClientStatus = StateStatus.success,
    this.getInvoiceByClientMessage = '',
    this.addDateInstallStatus = const BlocStatus.initial(),
    this.setDateDoneStatus = StateStatus.success,
    this.setDateDoneMessage = '',
    this.setReadyInstallStatus = StateStatus.success,
    this.setReadyInstallMessage = '',
  });

  SupportTabState copyWith({
    int? refreshUi,
    StateStatus? getInvoiceByClientStatus,
    String? getInvoiceByClientMessage,
    BlocStatus? addDateInstallStatus,
    StateStatus? setDateDoneStatus,
    String? setDateDoneMessage,
    StateStatus? setReadyInstallStatus,
    String? setReadyInstallMessage,
    BlocStatus? getDateInstallationStatus,
    BlocStatus? rescheduleDateStatus,
    BlocStatus? changeDateToDoneStatus,
  }) {
    return SupportTabState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      getInvoiceByClientStatus:
          getInvoiceByClientStatus ?? this.getInvoiceByClientStatus,
      getInvoiceByClientMessage:
          getInvoiceByClientMessage ?? this.getInvoiceByClientMessage,
      addDateInstallStatus: addDateInstallStatus ?? this.addDateInstallStatus,
      setDateDoneStatus: setDateDoneStatus ?? this.setDateDoneStatus,
      setDateDoneMessage: setDateDoneMessage ?? this.setDateDoneMessage,
      setReadyInstallStatus:
          setReadyInstallStatus ?? this.setReadyInstallStatus,
      setReadyInstallMessage:
          setReadyInstallMessage ?? this.setReadyInstallMessage,
    );
  }

  @override
  List<Object> get props => [
        refreshUi,
        getInvoiceByClientStatus,
        getInvoiceByClientMessage,
        addDateInstallStatus,
        setDateDoneStatus,
        setDateDoneMessage,
        setReadyInstallStatus,
        setReadyInstallMessage,
      ];
}
