part of 'invoices_section_cubit.dart';

class InvoicesSectionState extends Equatable {
  final StateStatus getInvoicesStatus;
  final String getInvoicesMessage;
  final BlocStatus<List<UserEntity>?> getUsersState;
  final BlocStatus getInvoiceByIdStatus;
  final BlocStatus exportInvoicesToExcelStatus;
  final BlocStatus exportInvoicesToPdfStatus;

  const InvoicesSectionState({
    this.getInvoicesStatus = StateStatus.initial,
    this.getInvoicesMessage = '',
    this.getUsersState = const BlocStatus.initial(),
    this.getInvoiceByIdStatus = const BlocStatus.initial(),
    this.exportInvoicesToExcelStatus = const BlocStatus.initial(),
    this.exportInvoicesToPdfStatus = const BlocStatus.initial(),
  });

  InvoicesSectionState copyWith({
    StateStatus? getInvoicesStatus,
    String? getInvoicesMessage,
    BlocStatus<List<UserEntity>>? getUsersState,
    BlocStatus? getInvoiceByIdStatus,
    BlocStatus? exportInvoicesToExcelStatus,
    BlocStatus? exportInvoicesToPdfStatus,
  }) {
    return InvoicesSectionState(
      getInvoicesStatus: getInvoicesStatus ?? this.getInvoicesStatus,
      getInvoicesMessage: getInvoicesMessage ?? this.getInvoicesMessage,
      getUsersState: getUsersState ?? this.getUsersState,
      getInvoiceByIdStatus: getInvoiceByIdStatus ?? this.getInvoiceByIdStatus,
      exportInvoicesToExcelStatus: exportInvoicesToExcelStatus ?? this.exportInvoicesToExcelStatus,
      exportInvoicesToPdfStatus: exportInvoicesToPdfStatus ?? this.exportInvoicesToPdfStatus,
    );
  }

  @override
  List get props {
    return [
      getInvoicesStatus,
      getInvoicesMessage,
      getUsersState,
      getInvoiceByIdStatus,
      exportInvoicesToExcelStatus,
      exportInvoicesToPdfStatus,
    ];
  }
}
