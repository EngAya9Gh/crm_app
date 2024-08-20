import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/models/nullable.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../data/models/distinctive_client.dart';
import '../../domain/use_cases/get_special_clients_usecase.dart';

part 'special_clients_event.dart';
part 'special_clients_state.dart';

@injectable
class SpecialClientsBloc
    extends Bloc<SpecialClientsEvent, SpecialClientsState> {
  SpecialClientsBloc(this._getCommunicationListUsecase)
      : super(SpecialClientsState()) {
    on<GetCommunicationListEvent>(_onGetCommunicationListEvent);
    on<SearchEvent>(_onSearchEvent);
    on<OnChangeRegionEvent>(_onOnChangeRegionEvent);
  }

  final GetSpecialClientsUsecase _getCommunicationListUsecase;

  FutureOr<void> _onGetCommunicationListEvent(GetCommunicationListEvent event,
      Emitter<SpecialClientsState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loading()));

    final response = await _getCommunicationListUsecase(GetSpecialClientsParams(
        country: event.fkCountry, citId: state.selectedCityId));

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(communicationListState: PageState.error()));
      },
      (value) {
        final filterData = filterList(event.query);
        final lists = [filterData, (value.message ?? [])];
        final commonElements =
            event.query.isNotEmpty && state.selectedCityId == null
                ? filterList(event.query, value.message)
                : HelperFunctions.instance.intersection(lists);

        emit(
          state.copyWith(
            communicationListState: event.query.isNotEmpty
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
        communicationListState:
            PageState.loaded(data: filterList(event.query))));
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

  FutureOr<void> _onOnChangeRegionEvent(
      OnChangeRegionEvent event, Emitter<SpecialClientsState> emit) {
    emit(state.copyWith(
        selectedCityId1: Nullable.value(event.selectedRegionId)));

    add(GetCommunicationListEvent(event.fkCountry, query: event.query));
  }
}
