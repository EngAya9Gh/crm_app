import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/TicketModel.dart';
import '../../../domain/use_cases/add_ticket_usecase.dart';
import '../../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../../domain/use_cases/get_tickets_usecase.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final GetTicketsUseCase _getTicketsUseCase;
  final GetTicketByIdUseCase _getTicketByIdUseCase;
  final AddTicketUseCase _addTicketUseCase;
  final EditTicketTypeUseCase _editTicketTypeUseCase;

  TicketsCubit(
    this._getTicketsUseCase,
    this._getTicketByIdUseCase,
    this._addTicketUseCase,
    this._editTicketTypeUseCase,
  ) : super(TicketsInitial());

  Future<void> getTickets() async {
    emit(GetTicketsLoading());
    final result = await _getTicketsUseCase(GetTicketsParams());
    result.fold(
      (error) => emit(GetTicketsError(error)),
      (tickets) => emit(GetTicketsLoaded(tickets)),
    );
  }

  Future<void> getTicketById(GetTicketByIdParams params) async {
    emit(GetTicketByIdLoading());
    final result = await _getTicketByIdUseCase(params);
    result.fold(
      (error) => emit(GetTicketByIdError(error)),
      (ticket) => emit(GetTicketByIdLoaded(ticket)),
    );
  }

  Future<void> addTicket(AddTicketParams params) async {
    emit(AddTicketLoading());
    final result = await _addTicketUseCase(params);
    result.fold(
      (error) => emit(AddTicketError(error)),
      (ticket) => emit(AddTicketLoaded(ticket)),
    );
  }

  Future<void> editTicketType(EditTicketTypeParams params) async {
    emit(EditTicketTypeLoading());
    final result = await _editTicketTypeUseCase(params);
    result.fold(
      (error) => emit(EditTicketTypeError(error)),
      (ticket) => emit(EditTicketTypeLoaded(ticket)),
    );
  }
}
