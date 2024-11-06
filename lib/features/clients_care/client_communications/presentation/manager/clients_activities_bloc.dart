import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../client_activites/data/models/activity_type_model.dart';
import '../../data/models/client_activity_model.dart';
import '../../domain/entities/clients_activities_variable_entity.dart';
import '../../domain/entities/update_activity_variable_entity.dart';
import '../../domain/use_cases/get_all_clients_activities_usecase.dart';
import '../../domain/use_cases/update_activity_usecase.dart';

part 'clients_activities_event.dart';
part 'clients_activities_state.dart';

@injectable
class ClientsActivitiesBloc extends Bloc<ClientsActivitiesEvent, ClientsActivitiesState> {
  final GetAllClientsActivitiesUseCase _getAllClientsActivitiesUseCase;
  final UpdateActivityUseCase _updateActivityUseCase;

  ClientsActivitiesPageVariablesEntity pageVariables = ClientsActivitiesPageVariablesEntity();
  UpdateActivityVariablesEntity updateActivityVariables = UpdateActivityVariablesEntity();

  ClientsActivitiesBloc(this._getAllClientsActivitiesUseCase,this._updateActivityUseCase,) : super(ClientsActivitiesState()) {
    on<GetAllClientsActivitiesEvent>(_onGetAllClientsActivitiesEvent);
    on<UpdateActivityEvent>(_onUpdateActivityEvent);

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
      fk_user: pageVariables.fkUser.value,
      from: pageVariables.startDataController.text,
      to: pageVariables.endDataController.text,
      priority: pageVariables.priority.value,
      state: pageVariables.activityState.value,
      limit: 20,
    );

    try {
      if(event.filter != null ){
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


  FutureOr<void> _onUpdateActivityEvent(
      UpdateActivityEvent event,
      Emitter<ClientsActivitiesState> emit,
      ) async {
    if (state.updateClientActivityStatus.isLoading()) return;

    emit(state.copyWith(updateClientActivityStatus: BlocStatus.loading(),));

    final params = UpdateActivityParams(
      activityId: event.activityId.toString(),
      description: event.description,
      endDate: event.endDate,
      state: "completed",
    );

    try {
  
      final response = await _updateActivityUseCase(params);

        if(response.message!=null){
          ClientActivityModel currentAct = pageVariables.allList.firstWhere(
                (activity) => activity.id == event.activityId, // Assuming 'id' is the identifier
          );

          int index = pageVariables.allList.indexOf(currentAct);
          emit(state.copyWith(
            getAllClientsActivitiesStatus: BlocStatus.loading(),
          ));
          pageVariables.allList[index] = response.message!; // As

          emit(state.copyWith(
            updateClientActivityStatus: BlocStatus.success(),
            getAllClientsActivitiesStatus: BlocStatus.success(),
            clientActivities: pageVariables.allList,
            totalCount: pageVariables.totalCount,
          ));
          event.onSuccess?.call();
        }
    } catch (e) {
      emit(state.copyWith(
        updateClientActivityStatus: BlocStatus.fail(error: e.toString()),
        getAllClientsActivitiesStatus: BlocStatus.success(),
        clientActivities: pageVariables.allList,
        totalCount: pageVariables.totalCount,
      ));
      event.onSuccess?.call();
    }
  }


}