part of 'verified_client_bloc.dart';

@immutable
class VerifiedClientEvent {}

class GetVerifiedClientEvent extends VerifiedClientEvent {
  final GetInvoicesByPrivilegesParams? getInvoicesByPrivilegesParams;
  final bool addNewFilter;
  GetVerifiedClientEvent({
    this.getInvoicesByPrivilegesParams,
    this.addNewFilter=false,
  });

}
class ChangeStatusVerifiedClientEvent extends VerifiedClientEvent {
  final VerifiedClientModel clientModel;
   ChangeStatusVerifiedClientEvent({
    required this.clientModel,
  });
}