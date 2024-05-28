part of 'support_tab_cubit.dart';

class SupportTabState extends Equatable {
  final int refreshUi;
  final StateStatus getInvoiceByClientStatus;
  final String getInvoiceByClientMessage;

  final StateStatus addDateInstallStatus;

  final String addDateInstallMessage;

  final StateStatus setDateDoneStatus;
  final String setDateDoneMessage;

  final StateStatus setReadyInstallStatus;
  final String setReadyInstallMessage;

  final BlocStatus getDateInstallationStatus;
  final BlocStatus rescheduleDateStatus;
  final BlocStatus changeDateToDoneStatus;

  const SupportTabState({
    this.refreshUi = 0,
    this.getInvoiceByClientStatus = StateStatus.success,
    this.getInvoiceByClientMessage = '',
    this.addDateInstallStatus = StateStatus.success,
    this.addDateInstallMessage = '',
    this.setDateDoneStatus = StateStatus.success,
    this.setDateDoneMessage = '',
    this.setReadyInstallStatus = StateStatus.success,
    this.setReadyInstallMessage = '',
    this.getDateInstallationStatus = const BlocStatus.initial(),
    this.rescheduleDateStatus = const BlocStatus.initial(),
    this.changeDateToDoneStatus = const BlocStatus.initial(),
  });

  SupportTabState copyWith({
    int? refreshUi,
    StateStatus? getInvoiceByClientStatus,
    String? getInvoiceByClientMessage,
    StateStatus? addDateInstallStatus,
    String? addDateInstallMessage,
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
      addDateInstallMessage:
          addDateInstallMessage ?? this.addDateInstallMessage,
      setDateDoneStatus: setDateDoneStatus ?? this.setDateDoneStatus,
      setDateDoneMessage: setDateDoneMessage ?? this.setDateDoneMessage,
      setReadyInstallStatus:
          setReadyInstallStatus ?? this.setReadyInstallStatus,
      setReadyInstallMessage:
          setReadyInstallMessage ?? this.setReadyInstallMessage,
      getDateInstallationStatus:
          getDateInstallationStatus ?? this.getDateInstallationStatus,
      rescheduleDateStatus: rescheduleDateStatus ?? this.rescheduleDateStatus,
      changeDateToDoneStatus:
          changeDateToDoneStatus ?? this.changeDateToDoneStatus,
    );
  }

  @override
  List<Object> get props => [
        refreshUi,
        getInvoiceByClientStatus,
        getInvoiceByClientMessage,
        addDateInstallStatus,
        addDateInstallMessage,
        setDateDoneStatus,
        setDateDoneMessage,
        setReadyInstallStatus,
        setReadyInstallMessage,
        getDateInstallationStatus,
        rescheduleDateStatus,
        changeDateToDoneStatus,
      ];
}
