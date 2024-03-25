part of 'tickets_cubit.dart';

@immutable
abstract class TicketsState {}

class TicketsInitial extends TicketsState {}

// get all tickets

class GetTicketsLoading extends TicketsState {}

class GetTicketsLoaded extends TicketsState {
  final List<TicketModel> tickets;

  GetTicketsLoaded(this.tickets);
}

class GetTicketsError extends TicketsState {
  final String message;

  GetTicketsError(this.message);
}

// get ticket by id

class GetTicketByIdLoading extends TicketsState {}

class GetTicketByIdLoaded extends TicketsState {
  final TicketModel ticket;

  GetTicketByIdLoaded(this.ticket);
}

class GetTicketByIdError extends TicketsState {
  final String message;

  GetTicketByIdError(this.message);
}

// add ticket

class AddTicketLoading extends TicketsState {}

class AddTicketLoaded extends TicketsState {
  final TicketModel ticket;

  AddTicketLoaded(this.ticket);
}

class AddTicketError extends TicketsState {
  final String message;

  AddTicketError(this.message);
}

// edit ticket type

class EditTicketTypeLoading extends TicketsState {}

class EditTicketTypeLoaded extends TicketsState {
  final TicketModel ticket;

  EditTicketTypeLoaded(this.ticket);
}

class EditTicketTypeError extends TicketsState {
  final String message;

  EditTicketTypeError(this.message);
}
