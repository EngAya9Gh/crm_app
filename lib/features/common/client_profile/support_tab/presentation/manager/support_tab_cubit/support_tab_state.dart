part of 'support_tab_cubit.dart';

class SupportTabState extends Equatable {
  final int refreshUi;
  final BlocStatus getInvoiceByClientStatus;

  final BlocStatus addDateInstallStatus;
  final StateStatus setDateDoneStatus;
  final String setDateDoneMessage;

  final StateStatus setReadyInstallStatus;
  final String setReadyInstallMessage;

  final BlocStatus cancelDateInstallStatus;

  const SupportTabState({
    this.refreshUi = 0,
    this.getInvoiceByClientStatus = const BlocStatus.initial(),
    this.addDateInstallStatus = const BlocStatus.initial(),
    this.setDateDoneStatus = StateStatus.success,
    this.setDateDoneMessage = '',
    this.setReadyInstallStatus = StateStatus.success,
    this.setReadyInstallMessage = '',
    this.cancelDateInstallStatus = const BlocStatus.initial(),
  });

  SupportTabState copyWith({
    int? refreshUi,
    BlocStatus? getInvoiceByClientStatus,
    BlocStatus? addDateInstallStatus,
    StateStatus? setDateDoneStatus,
    String? setDateDoneMessage,
    StateStatus? setReadyInstallStatus,
    String? setReadyInstallMessage,
    BlocStatus? getDateInstallationStatus,
    BlocStatus? rescheduleDateStatus,
    BlocStatus? changeDateToDoneStatus,
    BlocStatus? cancelDateInstallStatus,
  }) {
    return SupportTabState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      getInvoiceByClientStatus:
          getInvoiceByClientStatus ?? this.getInvoiceByClientStatus,
      addDateInstallStatus: addDateInstallStatus ?? this.addDateInstallStatus,
      setDateDoneStatus: setDateDoneStatus ?? this.setDateDoneStatus,
      setDateDoneMessage: setDateDoneMessage ?? this.setDateDoneMessage,
      setReadyInstallStatus:
          setReadyInstallStatus ?? this.setReadyInstallStatus,
      setReadyInstallMessage:
          setReadyInstallMessage ?? this.setReadyInstallMessage,
      cancelDateInstallStatus:
          cancelDateInstallStatus ?? this.cancelDateInstallStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      refreshUi,
      getInvoiceByClientStatus,
      addDateInstallStatus,
      setDateDoneStatus,
      setDateDoneMessage,
      setReadyInstallStatus,
      setReadyInstallMessage,
      cancelDateInstallStatus,
    ];
  }
}
