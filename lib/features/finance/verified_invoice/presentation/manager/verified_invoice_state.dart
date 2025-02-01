part of 'verified_invoice_bloc.dart';

@immutable
class VerifiedInvoiceState {
  final BlocStatus<List<InvoiceModel>> verifiedInvoiceList;
  final BlocStatus changeStatusInvoice;
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool hasReachedMax;
  final int totalCount;

  const VerifiedInvoiceState({
    this.verifiedInvoiceList = const BlocStatus.initial(),
    this.changeStatusInvoice = const BlocStatus.initial(),
    this.getInvoicesByPrivilegesParams = const GetInvoicesByPrivilegesParams(),
    this.hasReachedMax = false,
    this.totalCount = 0,
  });

  VerifiedInvoiceState copyWith({
    BlocStatus<List<InvoiceModel>>? verifiedInvoiceList,
    BlocStatus<List<InvoiceModel>>? changeStatusInvoice,
    ValueGetter<GetInvoicesByPrivilegesParams?>? getInvoicesByPrivilegesParams,
    bool? hasReachedMax,
    int? totalCount,
  }) {
    return VerifiedInvoiceState(
      verifiedInvoiceList: verifiedInvoiceList ?? this.verifiedInvoiceList,
      totalCount: totalCount ?? this.totalCount,
      changeStatusInvoice: changeStatusInvoice ?? this.changeStatusInvoice,
      getInvoicesByPrivilegesParams: getInvoicesByPrivilegesParams != null ? getInvoicesByPrivilegesParams() : this.getInvoicesByPrivilegesParams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
