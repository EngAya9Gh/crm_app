import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/clients_care/activities_clients/data/models/client_activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../sales/clients/clients_contacts/data/models/client_contact_model.dart';
import '../../domain/entities/clients_activities_page_varialbe_entity.dart';
import '../../domain/use_cases/get_all_clients_activities_usecase.dart';

part 'clients_activities_event.dart';
part 'clients_activities_state.dart';

@injectable
class ClientsActivitiesBloc extends Bloc<ClientsActivitiesEvent, ClientsActivitiesState> {
  final GetAllClientsActivitiesUseCase _getAllClientsActivitiesUseCase;

  ClientsActivitiesPageVariablesEntity pageVariables = ClientsActivitiesPageVariablesEntity();

  ClientsActivitiesBloc(this._getAllClientsActivitiesUseCase) : super(ClientsActivitiesState()) {
    on<GetAllClientsActivitiesEvent>(_onGetAllClientsActivitiesEvent);
  }

  FutureOr<void> _onGetAllClientsActivitiesEvent(
      GetAllClientsActivitiesEvent event,
      Emitter<ClientsActivitiesState> emit,
      ) async {
    if (state.getAllClientsActivitiesStatus.isLoading()) return;

    emit(state.copyWith(getAllClientsActivitiesStatus: BlocStatus.loading(),currentPage: event.page));

    final params = GetAllClientsActivitiesParams(
      page: event.page,
      filter: event.filter,
      limit: event.limit??20,
    );

    try {
      if(event.filter != null || event.contactType != null){
        pageVariables.allList = [];
        pageVariables.totalCount = 0;
      }
      final response = await _getAllClientsActivitiesUseCase(params);
      pageVariables.totalCount = response.count ?? 0;
      List<ClientActivityModel> newList = List<ClientActivityModel>.from(pageVariables.allList);
      if(event.page==1){
        newList = response.message ?? [];
      }else{
        newList.addAll(response.message ?? []);
      }
      pageVariables.allList = newList;
      pageVariables.hasReachedEnd = response.message?.isEmpty ?? true;

      if (pageVariables.allList.isEmpty) {
        emit(state.copyWith(
          getAllClientsActivitiesStatus: BlocStatus.empty(),
          currentPage: event.page,
        ));
      } else {
        emit(state.copyWith(
          getAllClientsActivitiesStatus: BlocStatus.success(),
          clientActivities: pageVariables.allList,
          totalCount: pageVariables.totalCount,
          currentPage: event.page,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getAllClientsActivitiesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }


}