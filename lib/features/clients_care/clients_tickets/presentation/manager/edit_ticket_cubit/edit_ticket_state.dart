part of 'edit_ticket_cubit.dart';

@immutable
abstract class EditTicketState {}

class EditTicketInitial extends EditTicketState {}

class EditTicketLoading extends EditTicketState {}

class EditTicketSuccess extends EditTicketState {}

class EditTicketError extends EditTicketState {
  final String message;

  EditTicketError(this.message);
}
