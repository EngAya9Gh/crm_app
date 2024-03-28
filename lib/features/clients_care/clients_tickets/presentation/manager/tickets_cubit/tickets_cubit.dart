import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_services.dart';
import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/di/di_container.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../data/models/ticket_category_model.dart';
import '../../../data/models/ticket_model.dart';
import '../../../data/models/ticket_sub_category_model.dart';
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
    filterTicketsByType();
  }

  // tickets
  List<TicketModel> allTickets = [];
  List<TicketModel> filteredTicketsByType = [];
  List<TicketModel> searchResultTickets = [];

  // todo: refactor this and use dependency injection

  List<TicketCategoryModel> allCategoriesList = [];
  List<TicketCategoryModel> selectedCategoriesList = [];

  List<TicketSubCategoryModel> allSubCategoriesList = [];
  List<TicketSubCategoryModel> filteredSubCategoriesByCategories = [];
  List<TicketSubCategoryModel> selectedSubCategoriesList = [];

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getCategoriesTicket,
      );
      final data = apiDataHandler(response);

      allCategoriesList = data
          .map<TicketCategoryModel>((e) => TicketCategoryModel.fromMap(e))
          .toList();
      emit(CategoriesLoaded());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> getSubCategories() async {
    emit(SubCategoriesLoading());
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getSubCategoriesTicket,
      );
      final data = apiDataHandler(response);

      allSubCategoriesList = data
          .map<TicketSubCategoryModel>((e) => TicketSubCategoryModel.fromMap(e))
          .toList();

      filterSubCategories();
    } catch (e) {
      emit(SubCategoriesError(e.toString()));
    }
  }

  void filterSubCategories() {
    filteredSubCategoriesByCategories = allSubCategoriesList
        .where((sub) => selectedCategoriesList
            .any((category) => sub.classification == category.categoryAr))
        .toList();

    emit(SubCategoriesLoaded());
  }

  //

  Future<void> getTickets() async {
    emit(GetTicketsLoading());
    final result = await _getTicketsUseCase(GetTicketsParams());
    result.fold(
      (error) => emit(GetTicketsError(error)),
      (tickets) {
        allTickets = tickets;
        filteredTicketsByType = tickets;
        filterTicketsByType();
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

  Future<void> filterTicketsByType() async {
    if (allTickets.isEmpty) {
      log('allTickets is empty, fetching tickets...');
      await getTickets();
    }
    filteredTicketsByType = allTickets
        .where((ticket) => ticket.typeTicket == _filters[currentFilterIdx])
        .toList();
    searchResultTickets = filteredTicketsByType;
    if (searchController.text.isNotEmpty) {
      searchTickets(searchController.text);
    } else {
      emit(TicketsFiltered());
    }
  }

  void searchTickets(String query) {
    searchController.text = query;
    if (query.isEmpty) {
      searchResultTickets = filteredTicketsByType;
      emit(TicketsFiltered());
      return;
    }

    searchResultTickets = filteredTicketsByType.where((ticket) {
      final nameEnterprise = ticket.nameEnterprise ?? '';
      final nameClient = ticket.nameClient ?? '';
      final idTicket = ticket.idTicket;
      return nameEnterprise.contains(query) ||
          nameClient.contains(query) ||
          idTicket.contains(query);
    }).toList();
    emit(TicketsFiltered());
  }
}
