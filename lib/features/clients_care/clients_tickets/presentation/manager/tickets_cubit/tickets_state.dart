part of 'tickets_cubit.dart';

@immutable
abstract class TicketsState {}

class TicketsInitial extends TicketsState {}

// get all tickets

class GetTicketsLoading extends TicketsState {}

class GetTicketsLoaded extends TicketsState {}

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

// filter
class TicketsFiltered extends TicketsState {}

// categories

class CategoriesLoading extends TicketsState {}

class CategoriesLoaded extends TicketsState {}

class CategoriesError extends TicketsState {
  final String message;

  CategoriesError(this.message);
}

// subcategories

class SubCategoriesLoading extends TicketsState {}

class SubCategoriesLoaded extends TicketsState {}

class SubCategoriesError extends TicketsState {
  final String message;

  SubCategoriesError(this.message);
}
