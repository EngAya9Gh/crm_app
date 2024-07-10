part of 'dates_table_cubit.dart';

class DatesTableState extends Equatable {
  final int refreshUi;
  final BlocStatus getDateInstallationStatus;
  final BlocStatus rescheduleDateStatus;
  final BlocStatus changeDateToDoneStatus;
  final BlocStatus cancelScheduleStatus;
  final BlocStatus reOpenEventStatus;
  final BlocStatus getSubscribedClientsStatus;
  final BlocStatus getInvoicesByClientForDateStatus;

  const DatesTableState({
    this.refreshUi = 0,
    this.getDateInstallationStatus = const BlocStatus.initial(),
    this.rescheduleDateStatus = const BlocStatus.initial(),
    this.changeDateToDoneStatus = const BlocStatus.initial(),
    this.cancelScheduleStatus = const BlocStatus.initial(),
    this.reOpenEventStatus = const BlocStatus.initial(),
    this.getSubscribedClientsStatus = const BlocStatus.initial(),
    this.getInvoicesByClientForDateStatus = const BlocStatus.initial(),
  });

  DatesTableState copyWith({
    int? refreshUi,
    BlocStatus? getDateInstallationStatus,
    BlocStatus? rescheduleDateStatus,
    BlocStatus? changeDateToDoneStatus,
    BlocStatus? cancelScheduleStatus,
    BlocStatus? reOpenEventStatus,
    BlocStatus? getSubscribedClientsStatus,
    BlocStatus? getInvoicesByClientForDateStatus,
  }) {
    return DatesTableState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      getDateInstallationStatus:
          getDateInstallationStatus ?? this.getDateInstallationStatus,
      rescheduleDateStatus: rescheduleDateStatus ?? this.rescheduleDateStatus,
      changeDateToDoneStatus:
          changeDateToDoneStatus ?? this.changeDateToDoneStatus,
      cancelScheduleStatus: cancelScheduleStatus ?? this.cancelScheduleStatus,
      reOpenEventStatus: reOpenEventStatus ?? this.reOpenEventStatus,
      getSubscribedClientsStatus:
          getSubscribedClientsStatus ?? this.getSubscribedClientsStatus,
      getInvoicesByClientForDateStatus: getInvoicesByClientForDateStatus ??
          this.getInvoicesByClientForDateStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      refreshUi,
      getDateInstallationStatus,
      rescheduleDateStatus,
      changeDateToDoneStatus,
      cancelScheduleStatus,
      reOpenEventStatus,
      getSubscribedClientsStatus,
      getInvoicesByClientForDateStatus,
    ];
  }
}
