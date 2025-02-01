import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:crm_smart/features/clients_care/special_clients/domain/entities/special_clients_page_vars_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/models/nullable.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../data/models/distinctive_client.dart';
import '../../domain/entities/filter_special_clients_entity.dart';
import '../../domain/use_cases/get_special_clients_usecase.dart';

part 'special_clients_event.dart';

part 'special_clients_state.dart';

@injectable
class SpecialClientsBloc extends Bloc<SpecialClientsEvent, SpecialClientsState> {
  final GetSpecialClientsUsecase _getCommunicationListUsecase;

  SpecialClientsBloc(this._getCommunicationListUsecase) : super(SpecialClientsState()) {
    on<GetSpecialClientsEvent>(_onGetCommunicationListEvent, transformer: droppable());
    on<SearchEvent>(_onSearchEvent);
  }

  SpecialClientsPageVarsEntity pageVariables = SpecialClientsPageVarsEntity();
  FilterSpecialClientsEntity filterEntity = FilterSpecialClientsEntity();

  void init() {
    pageVariables = SpecialClientsPageVarsEntity();
    filterEntity = FilterSpecialClientsEntity();
  }

  FutureOr<void> _onGetCommunicationListEvent(
    GetSpecialClientsEvent event,
    Emitter<SpecialClientsState> emit,
  ) async {
    if ((event.page ?? filterEntity.currentPage.value) == 1) {
      emit(state.copyWith(communicationListState: PageState.loading()));
    }
    filterEntity.currentPage.value = event.page ?? filterEntity.currentPage.value;
    final response = await _getCommunicationListUsecase(GetSpecialClientsParams(
      country: AppConstants.currentCountry,
      city: filterEntity.cityNotifier.value,
      page: event.page ?? filterEntity.currentPage.value,
    ));

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(communicationListState: PageState.error()));
      },
      (value) {
        emit(state.copyWith(hasReachedMax: value.message?.isEmpty));
        if ((event.page ?? filterEntity.currentPage.value) > 1 ) {
          emit(
            state.copyWith(
              total: value.count,
              communicationListState: PageState.loaded(data: List.of(state.communicationListState.data)..addAll(value.message ?? [])),
              allCommunicationsState: value.message,
            ),
          );
          return;
        }
        emit(state.copyWith(total: value.count, communicationListState: PageState.loaded(data: value.message ?? [])));
      },
    );
  }

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter<SpecialClientsState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loaded(data: filterList(pageVariables.searchController.text))));
  }

  List<DistinctiveClient> filterList(String query, [List<DistinctiveClient>? l]) {
    List<DistinctiveClient> list = List<DistinctiveClient>.from(l ?? state.allCommunicationsState);
    list = list
        .where((element) =>
            (element.nameClient?.toLowerCase().contains(query) ?? false) ||
            (element.nameEnterprise?.toLowerCase().contains(query) ?? false) ||
            (element.nameRegoin?.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
