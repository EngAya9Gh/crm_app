part of 'invoices_section_cubit.dart';

class InvoicesSectionState extends Equatable {
  final StateStatus getInvoicesStatus;
  final String getInvoicesMessage;
  final BlocStatus<List<UserEntity>?> getUsersState;

  const InvoicesSectionState({
    this.getInvoicesStatus = StateStatus.initial,
    this.getInvoicesMessage = '',
    this.getUsersState = const BlocStatus.initial(),
  });

  InvoicesSectionState copyWith({
    StateStatus? getInvoicesStatus,
    String? getInvoicesMessage,
    BlocStatus<List<UserEntity>>? getUsersState,
  }) {
    return InvoicesSectionState(
      getInvoicesStatus: getInvoicesStatus ?? this.getInvoicesStatus,
      getInvoicesMessage: getInvoicesMessage ?? this.getInvoicesMessage,
      getUsersState: getUsersState ?? this.getUsersState,
    );
  }

  @override
  List<Object> get props => [
        getInvoicesStatus,
        getInvoicesMessage,
        getUsersState,
      ];
}
