part of 'verified_invoice_bloc.dart';

@immutable
class VerifiedInvoiceState {
  final BlocStatus<List<InvoiceModel>> verifiedInvoiceList;
  final BlocStatus changeStatusInvoice;
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool hasReachedMax;

  const VerifiedInvoiceState({
    this.verifiedInvoiceList = const BlocStatus.initial(),
    this.changeStatusInvoice = const BlocStatus.initial(),
    this.getInvoicesByPrivilegesParams = const GetInvoicesByPrivilegesParams(),
    this.hasReachedMax = false,
  });

  VerifiedInvoiceState copyWith({
    BlocStatus<List<InvoiceModel>>? verifiedInvoiceList,
    BlocStatus<List<InvoiceModel>>? changeStatusInvoice,
    ValueGetter<GetInvoicesByPrivilegesParams?>? getInvoicesByPrivilegesParams,
    bool? hasReachedMax,
  }) {
    return VerifiedInvoiceState(
      verifiedInvoiceList: verifiedInvoiceList ?? this.verifiedInvoiceList,
      changeStatusInvoice: changeStatusInvoice ?? this.changeStatusInvoice,
      getInvoicesByPrivilegesParams: getInvoicesByPrivilegesParams != null ? getInvoicesByPrivilegesParams() : this.getInvoicesByPrivilegesParams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
