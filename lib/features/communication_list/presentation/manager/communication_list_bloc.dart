import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/nullable.dart';
import '../../data/models/distinctive_client.dart';
import '../../domain/use_cases/get_communication_list_usecase.dart';

part 'communication_list_event.dart';

part 'communication_list_state.dart';

@injectable
class CommunicationListBloc extends Bloc<CommunicationListEvent, CommunicationListState> {
  CommunicationListBloc(this._getCommunicationListUsecase) : super(CommunicationListState()) {
    on<GetCommunicationListEvent>(_onGetCommunicationListEvent);
    on<SearchEvent>(_onSearchEvent);
    on<OnChangeRegionEvent>(_onOnChangeRegionEvent);
  }

  final GetCommunicationListUsecase _getCommunicationListUsecase;

  FutureOr<void> _onGetCommunicationListEvent(
      GetCommunicationListEvent event, Emitter<CommunicationListState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loading()));

    final response = await _getCommunicationListUsecase(
        GetCommunicationListParams(country: event.fkCountry, citId: state.selectedCityId));

    response.fold(
      (exception, message) => emit(state.copyWith(communicationListState: PageState.error())),
      (value) {
        final filterData = filterList(event.query);
        final lists = [filterData, (value.message ?? [])];
        final commonElements = event.query.isNotEmpty && state.selectedCityId == null
            ? filterList(event.query,value.message)
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

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter<CommunicationListState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loaded(data: filterList(event.query))));
  }

  List<DistinctiveClient> filterList(String query , [List<DistinctiveClient>? l]) {
    List<DistinctiveClient> list = List<DistinctiveClient>.from(l ?? state.allCommunicationsState);
    list = list
        .where((element) =>
            (element.nameClient?.toLowerCase().contains(query) ?? false) ||
            (element.nameEnterprise?.toLowerCase().contains(query) ?? false) ||
            (element.nameRegoin?.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }

  FutureOr<void> _onOnChangeRegionEvent(OnChangeRegionEvent event, Emitter<CommunicationListState> emit) {
    emit(state.copyWith(selectedCityId: Nullable.value(event.selectedRegionId)));

    add(GetCommunicationListEvent(event.fkCountry, query: event.query));
  }
}
