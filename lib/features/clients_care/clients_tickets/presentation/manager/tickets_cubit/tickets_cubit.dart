import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/TicketModel.dart';
import '../../../domain/use_cases/add_ticket_usecase.dart';
import '../../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../../domain/use_cases/get_tickets_usecase.dart';

part 'tickets_state.dart';

@injectable
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

  // controllers
  final searchController = TextEditingController();

  // filter
  final List<String> _filters = ['جديدة', 'قيد التنفيذ', 'مغلقة', 'تم التقييم'];

  List<String> get filters => _filters;
  int _currentFilterIdx = 0;

  int get currentFilterIdx => _currentFilterIdx;

  set currentFilterIdx(int idx) {
    _currentFilterIdx = idx;
    filterTickets();
  }

  // tickets
  List<TicketModel> allTickets = [];
  List<TicketModel> filteredTickets = [];

  Future<void> getTickets() async {
    emit(GetTicketsLoading());
    final result = await _getTicketsUseCase(GetTicketsParams());
    result.fold(
      (error) => emit(GetTicketsError(error)),
      (tickets) {
        allTickets = tickets;
        filteredTickets = tickets;
        filterTickets();
      },
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

  Future<void> filterTickets() async {
    print("asdasdadas");
    if (allTickets.isEmpty) {
      log('allTickets is empty, fetching tickets...');
      await getTickets();
    }
    filteredTickets = allTickets
        .where((ticket) => ticket.typeTicket == _filters[currentFilterIdx])
        .toList();
    if (searchController.text.isNotEmpty) {
      searchTickets(searchController.text);
    } else {
      emit(TicketsFiltered());
    }
  }

  void searchTickets(String query) {
    searchController.text = query;
    if (query.isEmpty) {
      filterTickets();
    } else {
      filteredTickets = filteredTickets.where((ticket) {
        final nameEnterprise = ticket.nameEnterprise ?? '';
        final nameClient = ticket.nameClient ?? '';
        return nameEnterprise.contains(query) || nameClient.contains(query);
      }).toList();
    }
    emit(TicketsFiltered());
  }
}
