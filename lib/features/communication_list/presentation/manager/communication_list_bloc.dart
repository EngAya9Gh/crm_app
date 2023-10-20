import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/communication_list_response.dart';
import '../../domain/use_cases/get_communication_list_usecase.dart';

part 'communication_list_event.dart';

part 'communication_list_state.dart';

@injectable
class CommunicationListBloc extends Bloc<CommunicationListEvent, CommunicationListState> {
  CommunicationListBloc(this._getCommunicationListUsecase) : super(CommunicationListState()) {
    on<GetCommunicationListEvent>(_onGetCommunicationListEvent);
    on<SearchEvent>(_onSearchEvent);
  }

  final GetCommunicationListUsecase _getCommunicationListUsecase;

  FutureOr<void> _onGetCommunicationListEvent(
      GetCommunicationListEvent event, Emitter<CommunicationListState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loading()));

    final response = await _getCommunicationListUsecase(
      GetCommunicationListParams(country: event.fkCountry, userId: event.userId),
    );

    response.fold(
      (exception, message) => emit(state.copyWith(communicationListState: PageState.error())),
      (value) => emit(
        state.copyWith(
          communicationListState: event.query.isNotEmpty
              ? PageState.loaded(data: filterList(event.query))
              : PageState.loaded(data: value.message ?? []),
          allCommunicationsState: value.message,
        ),
      ),
    );
  }

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter<CommunicationListState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loaded(data: filterList(event.query))));
  }

  List<Communication> filterList(String query) {
    List<Communication> list = List<Communication>.from(state.allCommunicationsState);
    list = list
        .where((element) =>
            (element.nameClient?.toLowerCase().contains(query) ?? false) ||
            (element.nameEnterprise?.toLowerCase().contains(query) ?? false) ||
            (element.nameRegoin?.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }
}
