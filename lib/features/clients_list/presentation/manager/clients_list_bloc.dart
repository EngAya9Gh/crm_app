import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/clients_list_response.dart';


part 'clients_list_state.dart';
part 'clients_list_event.dart';

@injectable
class ClientsListBloc extends Bloc<ClientsListEvent, ClientsListState> {
  ClientsListBloc(
      this._getAllClientsListUseCase,
      this._getClientsListByUserUseCase,
      this._getClientsListByRegionUseCase,
      ) : super(ClientsListState()) {
    on<GetAllClientsListEvent>(_onGetAllClientsListEvent);
    on<GetClientsListByRegionEvent>(_onGetClientsListByRegionEvent);
    on<GetClientsListByUserEvent>(_onGetClientsListByUserEvent);
  }
  final GetAllClientsListUseCase _getAllClientsListUseCase;
  final GetClientsListByUserUseCase _getClientsListByUserUseCase;
  final GetClientsListByRegionUseCase _getClientsListByRegionUseCase;

  FutureOr<void> _onGetAllClientsListEvent(
      GetAllClientsListEvent event, Emitter<ClientsListState> emit) async {
    List<ClientModel> currentList = [];
    if(event.page==1){
      emit(state.copyWith(clientsListState: PageState.loading()));
    }else{
      currentList = state.clientsListState.data.toList();
    }
    final response = await _getAllClientsListUseCase(GetAllClientsListParams(country: event.fkCountry,page: event.page,perPage: event.perPage));

    response.fold(
          (exception, message) => emit(state.copyWith(clientsListState:PageState.error())),
          (value) {
            if(event.page>1){
              currentList.addAll(value.data??[]);
              emit(state.copyWith(clientsListState: PageState.loaded(data:currentList ?? [])));
            }else
              emit(state.copyWith(clientsListState: PageState.loaded(data: value.data ?? [])));
          }
    );
  }

  FutureOr<void> _onGetClientsListByUserEvent(
      GetClientsListByUserEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(clientsListState: PageState.loading()));

    final response = await _getClientsListByUserUseCase(GetClientsListByUserParams(user: event.fkUser));

    response.fold(
          (exception, message) => emit(state.copyWith(clientsListState:PageState.error())),
          (value) => emit(state.copyWith(clientsListState: PageState.loaded(data: value.data ?? []))),
    );
  }


  FutureOr<void> _onGetClientsListByRegionEvent(
      GetClientsListByRegionEvent event, Emitter<ClientsListState> emit) async {
    emit(state.copyWith(clientsListState: PageState.loading()));

    final response = await _getClientsListByRegionUseCase(GetClientsListByRegionParams(region: event.fkRegion));

    response.fold(
          (exception, message) => emit(state.copyWith(clientsListState:PageState.error())),
          (value) => emit(state.copyWith(clientsListState: PageState.loaded(data: value.data ?? []))),
    );
  }
}
