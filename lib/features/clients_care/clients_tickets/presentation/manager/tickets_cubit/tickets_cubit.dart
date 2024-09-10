import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../data/models/ticket_category_model.dart';
import '../../../data/models/ticket_model.dart';
import '../../../data/models/ticket_sub_category_model.dart';
import '../../../domain/entities/filter_tickets_entity.dart';
import '../../../domain/entities/tickets_page_variables_entity.dart';
import '../../../domain/use_cases/get_client_ticket_usecase.dart';
import '../../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../../domain/use_cases/get_tickets_usecase.dart';

part 'tickets_state.dart';

@injectable
class TicketsCubit extends Cubit<TicketsState> {
  final GetTicketsUseCase _getTicketsUseCase;
  final GetTicketByIdUseCase _getTicketByIdUseCase;
  final GetClientTicketsUseCase _getClientTicketsUseCase;

  TicketsCubit(
    this._getTicketsUseCase,
    this._getTicketByIdUseCase,
    this._getClientTicketsUseCase,
  ) : super(TicketsInitial());

  List<TicketModel> clientTicketsList = [];
  TicketsPageVariablesEntity pageVariables = TicketsPageVariablesEntity();
  FilterTicketsEntity filterEntity = FilterTicketsEntity();

  void init() {
    pageVariables = TicketsPageVariablesEntity();
    filterEntity = FilterTicketsEntity();
  }

  Future<void> getTickets({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state is GetTicketsLoading) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(GetTicketsLoading());
        filterEntity.savePreviousState();
        final result = await _getTicketsUseCase(GetTicketsParams(
          skip: pageVariables.allList.length,
          ticketType: filterEntity.ticketTypeNotifier.value,
          user: filterEntity.userNotifier.value,
          ticketSource: filterEntity.ticketSourceListNotifier.value,
          ticketCategory: filterEntity.ticketCategoryNotifier.value,
          filter: pageVariables.searchController.text,
          rate: filterEntity.rateNotifier.value,
          dateFrom: filterEntity.dateFromController.text,
          dateTo: filterEntity.dateToController.text,
        ));
        result.fold(
          (error) {
            if (AppConstants.shouldReturnEarly(error)) return;
            emit(GetTicketsError(error));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            emit(GetTicketsLoaded());
          },
        );
      },
      tag: 'search_delay_install_reports',
      isDebounced: isDebounced,
    );
  }

  Future<void> getClientTicket(String clientId) async {
    emit(ClientsTicketsLoading());
    clientTicketsList.clear();
    final result =
        await _getClientTicketsUseCase(GetClientTicketParams(clientId));
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(ClientsTicketsError(error));
      },
      (ticket) {
        if (ticket == null) {
          emit(ClientsTicketsError('لا يوجد تذاكر لهذا العميل'));
          return;
        }
        clientTicketsList.add(ticket);
        emit(ClientsTicketsLoaded());
      },
    );
  }

  Future<void> getTicketById(GetTicketByIdParams params) async {
    emit(GetTicketByIdLoading());
    final result = await _getTicketByIdUseCase(params);
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(GetTicketByIdError(error));
      },
      (ticket) => emit(GetTicketByIdLoaded(ticket)),
    );
  }

  // categories methods
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getCategoriesTicket,
      );
      final data = apiDataHandler(response);

      pageVariables.allCategoriesList = data
          .map<TicketCategoryModel>((e) => TicketCategoryModel.fromMap(e))
          .clientsSubsectionsNamesList();
      emit(CategoriesLoaded());
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> getSubCategories() async {
    emit(SubCategoriesLoading());
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getSubCategoriesTicket,
      );
      final data = apiDataHandler(response);

      pageVariables.allSubCategoriesList = data
          .map<TicketSubCategoryModel>((e) => TicketSubCategoryModel.fromMap(e))
          .clientsSubsectionsNamesList();

      filterSubCategories();
    } catch (e) {
      emit(SubCategoriesError(e.toString()));
    }
  }

  void filterSubCategories() {
    pageVariables.filteredSubCategoriesByCategories = pageVariables
        .allSubCategoriesList
        .where((sub) => pageVariables.selectedCategoriesList
            .any((category) => sub.classification == category.categoryAr))
        .toList();

    emit(SubCategoriesLoaded());
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
