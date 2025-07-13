import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
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
  ) : super(TicketsState());

  List<TicketModel> clientTicketsList = [];
  TicketsPageVariablesEntity pageVariables = TicketsPageVariablesEntity();
  FilterTicketsEntity filterEntity = FilterTicketsEntity();
  void init() {
    pageVariables = TicketsPageVariablesEntity();
    filterEntity = FilterTicketsEntity();
    selectTicketType(TicketTypesEnum.values.first); // Select the first tab by default
  }

  void selectTicketType(TicketTypesEnum type) {
    filterEntity.ticketTypeNotifier.value = type;
    emit(state.copyWith(selectedTicketType: type));
    getTickets();
  }

  Future<void> getTickets({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getTicketsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getTicketsStatus: BlocStatus.loading()));
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
          ticketTypeDist: filterEntity.ticketDestinationNotifier.value,
        ));
        result.fold(
          (error) {
            if (AppConstants.shouldReturnEarly(error)) return;
            emit(state.copyWith(getTicketsStatus: BlocStatus.fail(error: error)));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty || value.data.length < AppConstants.kPerPage;
            if (value.data.isEmpty) {
              return emit(state.copyWith(
                getTicketsStatus: BlocStatus.success(),
              ));
            }
            emit(state.copyWith(
              getTicketsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_tickets',
      isDebounced: isDebounced,
    );
  }

  Future<void> getClientTicket(String clientId) async {
    emit(state.copyWith(getClientsTicketsStatus: BlocStatus.loading()));
    clientTicketsList.clear();
    final result = await _getClientTicketsUseCase(GetClientTicketParams(clientId));
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(
          getClientsTicketsStatus: BlocStatus.fail(error: error),
        ));
      },
      (ticket) {
        if (ticket == null) {
          return emit(state.copyWith(
            getClientsTicketsStatus: BlocStatus.empty(),
          ));
        }
        clientTicketsList.add(ticket);
        emit(state.copyWith(
          getClientsTicketsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  Future<void> getTicketById(GetTicketByIdParams params, ValueChanged<TicketModel> onGettingData) async {
    emit(state.copyWith(getTicketByIdStatus: BlocStatus.loading()));
    final result = await _getTicketByIdUseCase(params);
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(
          getTicketByIdStatus: BlocStatus.fail(error: error),
        ));
      },
      (ticket) {
        emit(state.copyWith(
          getTicketByIdStatus: BlocStatus.success(),
        ));
        onGettingData.call(ticket);
      },
    );
  }

  // categories methods
  Future<void> getCategories() async {
    emit(state.copyWith(categoriesStatus: BlocStatus.loading()));
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getCategoriesTicket,
      );
      final data = apiDataHandler(response);

      pageVariables.allCategoriesList = data.map<TicketCategoryModel>((e) {
        return TicketCategoryModel.fromMap(e);
      }).toList();
      emit(state.copyWith(categoriesStatus: BlocStatus.success()));
    } catch (e) {
      emit(state.copyWith(categoriesStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  Future<void> getSubCategories() async {
    emit(state.copyWith(subCategoriesStatus: BlocStatus.loading()));
    try {
      final ApiServices apiServices = getIt();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.tickets.getSubCategoriesTicket,
      );
      final data = apiDataHandler(response);

      pageVariables.allSubCategoriesList = data.map<TicketSubCategoryModel>((e) => TicketSubCategoryModel.fromMap(e)).toList();
      emit(state.copyWith(
          SubCategoriesSystem: pageVariables.allSubCategoriesList.isEmpty
              ? BlocStatus.empty()
              : BlocStatus.success(data: pageVariables.allSubCategoriesList.where((element) => element.classification == 'النظام').toList())));
      filterSubCategories();
    } catch (e) {
      emit(state.copyWith(subCategoriesStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  void filterSubCategories() {
    pageVariables.filteredSubCategoriesByCategories = pageVariables.allSubCategoriesList
        .where((sub) => pageVariables.selectedCategoriesList.any((category) =>
        sub.classification == category.categoryAr))
        .toList();

    emit(state.copyWith(subCategoriesStatus: BlocStatus.success()));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
