part of 'agents_distributors_profile_bloc.dart';

class AgentsDistributorsProfileState extends Equatable {
  final StateStatus dialogProgressState;
  final List<ClientModel> clientsList;
  final StateStatus clientsStatus;
  final String? clientsError;

  final List<ProfileInvoiceModel> invoicesList;
  final StateStatus invoicesStatus;
  final String? invoicesError;

  final InvoiceModel? currentInvoice;

  AgentsDistributorsProfileState({
    this.clientsList = const [],
    this.clientsStatus = StateStatus.initial,
    this.clientsError,
    this.invoicesList = const [],
    this.invoicesStatus = StateStatus.initial,
    this.invoicesError,
    this.currentInvoice,
    this.dialogProgressState = StateStatus.initial,
  });

  AgentsDistributorsProfileState copyWith({
    List<ClientModel>? clientsList,
    StateStatus? clientsStatus,
    String? clientsError,
    List<ProfileInvoiceModel>? invoicesList,
    StateStatus? invoicesStatus,
    String? invoicesError,
    InvoiceModel? currentInvoice,
    StateStatus? dialogProgressState,
  }) {
    return AgentsDistributorsProfileState(
      clientsList: clientsList ?? this.clientsList,
      clientsStatus: clientsStatus ?? this.clientsStatus,
      clientsError: clientsError,
      invoicesList: invoicesList ?? this.invoicesList,
      invoicesStatus: invoicesStatus ?? this.invoicesStatus,
      invoicesError: invoicesError,
      currentInvoice: currentInvoice ?? this.currentInvoice,
      dialogProgressState: dialogProgressState ?? this.dialogProgressState,
    );
  }

  @override
  List<Object?> get props => [
        clientsList,
        clientsStatus,
        clientsError,
        invoicesList,
        invoicesStatus,
        invoicesError,
        currentInvoice,
        dialogProgressState,
      ];
}
