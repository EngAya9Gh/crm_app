import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/common/models/nullable.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/clients_list_response.dart';

part 'clients_list_event.dart';

part 'clients_list_state.dart';

@injectable
class ClientsListBloc extends Bloc<ClientsListEvent, ClientsListState> {
  ClientsListBloc(
    this._getClientsWithFilterUserUsecase,
  ) : super(ClientsListState()) {
    on<GetAllClientsListEvent>(_onGetAllClientsListEvent);
    on<UpdateGetClientsParamsEvent>(_onUpdateGetClientsParamsEvent);
    on<SearchEvent>(_onSearchEvent);
    on<ResetClientList>(_onResetClientList);
  }

  final GetClientsWithFilterUserUsecase _getClientsWithFilterUserUsecase;

  FutureOr<void> _onGetAllClientsListEvent(GetAllClientsListEvent event, Emitter<ClientsListState> emit) async {
    final GetClientsWithFilterParams getClientsWithFilterParams =
        state.getClientsWithFilterParams?.copyWith(page: Nullable.value(event.page)) ??
            GetClientsWithFilterParams(country: event.fkCountry, page: event.page);

    final response = await _getClientsWithFilterUserUsecase(getClientsWithFilterParams);

    response.fold(
      (exception, message) => state.clientsListController.error = exception,
      (value) {
        final hasReachedMax = HelperFunctions.instance.hasReachedMax(value.message);
        if (hasReachedMax) {
          state.clientsListController.appendLastPage(value.message ?? []);
        } else {
          final nextPage = (state.clientsListController.nextPageKey ?? 1) + 1;
          state.clientsListController.appendPage(value.message ?? [], nextPage);
        }
        emit(state.copyWith(getClientsWithFilterParams: getClientsWithFilterParams));
      },
    );
  }

  FutureOr<void> _onUpdateGetClientsParamsEvent(UpdateGetClientsParamsEvent event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      getClientsWithFilterParams: event.getClientsWithFilterParams,
      restFilter: event.resetFilter,
    ));

    state.clientsListController.refresh();
  }

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      getClientsWithFilterParams: state.getClientsWithFilterParams?.copyWith(query: Nullable.value(event.query)),
    ));

    state.clientsListController.refresh();
  }

  FutureOr<void> _onResetClientList(ResetClientList event, Emitter<ClientsListState> emit) {
    emit(state.copyWith(
      clientsListController: PagingController(firstPageKey: 1, invisibleItemsThreshold: 10),
      restFilter: true,
    ));
  }
}
