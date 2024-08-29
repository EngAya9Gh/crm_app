import 'dart:async';

import 'package:bloc/bloc.dart';
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
class SpecialClientsBloc
    extends Bloc<SpecialClientsEvent, SpecialClientsState> {
  final GetSpecialClientsUsecase _getCommunicationListUsecase;

  SpecialClientsBloc(this._getCommunicationListUsecase)
      : super(SpecialClientsState()) {
    on<GetSpecialClientsEvent>(_onGetCommunicationListEvent);
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
    emit(state.copyWith(communicationListState: PageState.loading()));

    final response = await _getCommunicationListUsecase(GetSpecialClientsParams(
      country: AppConstants.currentCountry,
      city: filterEntity.cityNotifier.value,
    ));

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(communicationListState: PageState.error()));
      },
      (value) {
        final filterData = filterList(pageVariables.searchController.text);
        final lists = [filterData, (value.message ?? [])];
        final commonElements = pageVariables.searchController.text.isNotEmpty &&
                state.selectedCityId == null
            ? filterList(pageVariables.searchController.text, value.message)
            : HelperFunctions.instance.intersection(lists);

        emit(
          state.copyWith(
            communicationListState:
                pageVariables.searchController.text.isNotEmpty
                    ? PageState.loaded(data: commonElements)
                    : PageState.loaded(data: value.message ?? []),
            allCommunicationsState: value.message,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSearchEvent(
      SearchEvent event, Emitter<SpecialClientsState> emit) async {
    emit(state.copyWith(
        communicationListState: PageState.loaded(
            data: filterList(pageVariables.searchController.text))));
  }

  List<DistinctiveClient> filterList(String query,
      [List<DistinctiveClient>? l]) {
    List<DistinctiveClient> list =
        List<DistinctiveClient>.from(l ?? state.allCommunicationsState);
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
