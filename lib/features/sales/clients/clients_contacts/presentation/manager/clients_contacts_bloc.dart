import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../data/models/client_contact_model.dart';
import '../../domain/entities/clients_contacts_page_varialbe_entity.dart';
import '../../domain/use_cases/get_all_clients_contacts_usecase.dart';

part 'clients_contacts_event.dart';
part 'clients_contacts_state.dart';

@injectable
class ClientsContactsBloc extends Bloc<ClientsContactsEvent, ClientsContactsState> {
  final GetAllClientsContactsUseCase _getAllClientsContactsUseCase;

  ClientsContactsPageVariablesEntity pageVariables = ClientsContactsPageVariablesEntity();

  ClientsContactsBloc(this._getAllClientsContactsUseCase) : super(ClientsContactsState()) {
    on<GetAllClientsContactsEvent>(_onGetAllClientsContactsEvent);
  }

  FutureOr<void> _onGetAllClientsContactsEvent(
      GetAllClientsContactsEvent event,
      Emitter<ClientsContactsState> emit,
      ) async {
    if (state.getAllClientsContactsStatus.isLoading()) return;

    emit(state.copyWith(getAllClientsContactsStatus: BlocStatus.loading()));

    final params = GetAllClientsContactsParams(
      page: event.page,
      filter: event.filter,
      limit: event.limit,
    );

    try {
      final response = await _getAllClientsContactsUseCase(params);
      pageVariables.totalCount = response.count ?? 0;
      List<ClientContactModel> newList = List<ClientContactModel>.from(pageVariables.allList);
      newList.addAll(response.message ?? []);
      pageVariables.allList = newList;
      pageVariables.hasReachedEnd = response.message?.isEmpty ?? true;

      if (pageVariables.allList.isEmpty) {
        emit(state.copyWith(
          getAllClientsContactsStatus: BlocStatus.empty(),
          currentPage: event.page,
        ));
      } else {
        emit(state.copyWith(
          getAllClientsContactsStatus: BlocStatus.success(),
          clientContacts: pageVariables.allList,
          totalCount: pageVariables.totalCount,
          currentPage: event.page,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getAllClientsContactsStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }
}