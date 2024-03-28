part of 'add_ticket_cubit.dart';

@immutable
abstract class AddTicketState {}

class AddTicketInitial extends AddTicketState {}

class AddTicketLoading extends AddTicketState {}

class AddTicketSuccess extends AddTicketState {}

class AddTicketError extends AddTicketState {
  final String message;

  AddTicketError(this.message);
}
