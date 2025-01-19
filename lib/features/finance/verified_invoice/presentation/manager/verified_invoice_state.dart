part of 'verified_invoice_bloc.dart';

@immutable
class VerifiedInvoiceState {
  final BlocStatus<List<InvoiceModel>> verifiedInvoiceList;
  final BlocStatus changeStatusInvoice;

  const VerifiedInvoiceState({
    this.verifiedInvoiceList = const BlocStatus.initial(),
    this.changeStatusInvoice = const BlocStatus.initial(),
  });

  VerifiedInvoiceState copyWith({
    BlocStatus<List<InvoiceModel>>? verifiedInvoiceList,
    BlocStatus<List<InvoiceModel>>? changeStatusInvoice,
  }) {
    return VerifiedInvoiceState(
      verifiedInvoiceList: verifiedInvoiceList ?? this.verifiedInvoiceList,
      changeStatusInvoice: changeStatusInvoice ?? this.changeStatusInvoice,
    );
  }
}
