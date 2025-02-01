part of 'verified_client_bloc.dart';

@immutable
class VerifiedClientState {
  final BlocStatus<List<VerifiedClientModel>> verifiedClientList;
  final BlocStatus changeStatusClient;
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool hasReachedMax;
  final int totalCount;

  const VerifiedClientState({
    this.verifiedClientList = const BlocStatus.initial(),
    this.changeStatusClient = const BlocStatus.initial(),
    this.getInvoicesByPrivilegesParams = const GetInvoicesByPrivilegesParams(),
    this.hasReachedMax = false,
    this.totalCount = 0,
  });

  VerifiedClientState copyWith({
    BlocStatus<List<VerifiedClientModel>>? verifiedClientList,
    BlocStatus? changeStatusClient,
    ValueGetter<GetInvoicesByPrivilegesParams?>? getInvoicesByPrivilegesParams,
    bool? hasReachedMax,
    int? totalCount,
  }) {
    return VerifiedClientState(
      verifiedClientList: verifiedClientList ?? this.verifiedClientList,
      totalCount: totalCount ?? this.totalCount,
      changeStatusClient: changeStatusClient ?? this.changeStatusClient,
      getInvoicesByPrivilegesParams: getInvoicesByPrivilegesParams != null ? getInvoicesByPrivilegesParams() : this.getInvoicesByPrivilegesParams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
