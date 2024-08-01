part of 'finance_pending_cubit.dart';

class FinancePendingState extends Equatable {
  final BlocStatus<bool> getFinancePendingStatus;
  final BlocStatus filterFinancePendingStatus;

  FinancePendingState({
    this.getFinancePendingStatus = const BlocStatus<bool>.initial(),
    this.filterFinancePendingStatus = const BlocStatus<bool>.initial(),
  });

  FinancePendingState copyWith({
    BlocStatus<bool>? getFinancePendingStatus,
    BlocStatus? filterFinancePendingStatus,
  }) {
    return FinancePendingState(
      getFinancePendingStatus:
          getFinancePendingStatus ?? this.getFinancePendingStatus,
      filterFinancePendingStatus:
          filterFinancePendingStatus ?? this.filterFinancePendingStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getFinancePendingStatus,
      filterFinancePendingStatus,
    ];
  }
}
