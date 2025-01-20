part of 'verified_invoice_bloc.dart';

@immutable
class VerifiedInvoiceEvent {}

class GetVerifiedInvoiceEvent extends VerifiedInvoiceEvent {
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool addNewFilter;
  GetVerifiedInvoiceEvent({
    this.getInvoicesByPrivilegesParams,
    this.addNewFilter=false,
  });

}
class ChangeStatusVerifiedInvoiceEvent extends VerifiedInvoiceEvent {
  final InvoiceModel invoiceModel;
   ChangeStatusVerifiedInvoiceEvent({
    required this.invoiceModel,
  });
}