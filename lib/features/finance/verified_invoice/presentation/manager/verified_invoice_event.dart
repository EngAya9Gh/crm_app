part of 'verified_invoice_bloc.dart';

@immutable
class VerifiedInvoiceEvent {}

class GetVerifiedInvoiceEvent extends VerifiedInvoiceEvent {}
class ChangeStatusVerifiedInvoiceEvent extends VerifiedInvoiceEvent {
  final InvoiceModel invoiceModel;

   ChangeStatusVerifiedInvoiceEvent({
    required this.invoiceModel,
  });
}
