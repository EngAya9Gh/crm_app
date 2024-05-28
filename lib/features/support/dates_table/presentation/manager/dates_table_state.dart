part of 'dates_table_cubit.dart';

class DatesTableState extends Equatable {
  final int refreshUi;
  final BlocStatus getDateInstallationStatus;
  final BlocStatus rescheduleDateStatus;
  final BlocStatus changeDateToDoneStatus;

  const DatesTableState({
    this.refreshUi = 0,
    this.getDateInstallationStatus = const BlocStatus.initial(),
    this.rescheduleDateStatus = const BlocStatus.initial(),
    this.changeDateToDoneStatus = const BlocStatus.initial(),
  });

  DatesTableState copyWith({
    int? refreshUi,
    BlocStatus? getDateInstallationStatus,
    BlocStatus? rescheduleDateStatus,
    BlocStatus? changeDateToDoneStatus,
  }) {
    return DatesTableState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
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
        getDateInstallationStatus,
        rescheduleDateStatus,
        changeDateToDoneStatus,
      ];
}
