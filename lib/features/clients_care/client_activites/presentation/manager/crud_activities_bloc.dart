import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/clients_care/client_activites/domain/use_cases/get_activity_types_usecase.dart';
import 'package:crm_smart/features/clients_care/client_activites/domain/use_cases/get_subscribed_clients_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../data/models/activity_type_model.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import '../../domain/entities/activities_page_variable_entity.dart';
import '../../domain/entities/add_activity_crud_entity.dart';
import '../../domain/entities/update_activity_crud_entity.dart';
import '../../domain/use_cases/add_activity_crud_usecase.dart';
import '../../domain/use_cases/get_crud_activities_usecase.dart';
import '../../domain/use_cases/update_activity_crud_usecase.dart';

part 'crud_activities_event.dart';
part 'crud_activities_state.dart';

@injectable
class CrudActivitiesBloc extends Bloc<CrudActivitiesEvent, CrudActivitiesState> {
  final GetCrudActivitiesUseCase _getAllCrudActivitiesUseCase;
  final UpdateActivityCrudUseCase _updateActivityUseCase;
  final AddActivityCrudUseCase _addActivityUseCase; 
  final GetActivityTypesUseCase _getActivityTypesUseCase;
  final GetSubscribedClientsUseCase _getSubscribedClientsUseCase; 

  ActivitiesPageVariablesEntity pageVariables = ActivitiesPageVariablesEntity();
  AddActivityCrudEntity addActivityEntity = AddActivityCrudEntity();

  CrudActivitiesBloc(
      this._getAllCrudActivitiesUseCase,
      this._updateActivityUseCase,
      this._addActivityUseCase, 
      this._getActivityTypesUseCase, 
      this._getSubscribedClientsUseCase, 
      ) : super(CrudActivitiesState()) {
    on<GetAllCrudActivitiesEvent>(_onGetAllCrudActivitiesEvent);
    on<UpdateCrudActivityEvent>(_onUpdateCrudActivityEvent);
    on<AddActivityEvent>(_onAddActivityEvent); 
    on<GetActivityTypesEvent>(_onGetActivityTypesEvent); 
    on<GetSubscribedClientsEvent>(_onGetSubscribedClientsEvent); 
    on<ChangeWholeDayValueEvent>(_onChangeWholeDayValueEvent);

  }

  FutureOr<void> _onGetAllCrudActivitiesEvent(
      GetAllCrudActivitiesEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    if (state.getAllCrudActivitiesStatus.isLoading()) return;

    emit(state.copyWith(getAllCrudActivitiesStatus: BlocStatus.loading(),currentPage: event.page));

    final params = GetCrudActivitiesParams(
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
      final response = await _getAllCrudActivitiesUseCase(params);
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
          getAllCrudActivitiesStatus: BlocStatus.empty(),
          currentPage: event.page,
        ));
      } else {
        emit(state.copyWith(
          getAllCrudActivitiesStatus: BlocStatus.success(),
          clientActivities: pageVariables.allList,
          totalCount: pageVariables.totalCount,
          currentPage: event.page,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getAllCrudActivitiesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }


  FutureOr<void> _onGetActivityTypesEvent(
      GetActivityTypesEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    if (state.getActivityTypesStatus.isLoading()) return;

    emit(state.copyWith(getActivityTypesStatus: BlocStatus.loading(),));

    final params = GetActivityTypesParams(type: event.type);

    try {

      final response = await _getActivityTypesUseCase(params.toMap());
      List<ActivityTypeModel> newList = response.message ?? [];
      if (newList.isEmpty) {
        emit(state.copyWith(
          getActivityTypesStatus: BlocStatus.empty(),
        ));
      } else {
        addActivityEntity.addActivityTypesList.value=newList;
        if(addActivityEntity.selectedActivity.value != null){
          addActivityEntity.setUpdateValues(addActivityEntity.selectedActivity.value!);
        }
        emit(state.copyWith(
          getActivityTypesStatus: BlocStatus.success(),
          activityTypesList: event.type=='menu'?[]:newList
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getActivityTypesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }


  FutureOr<void> _onGetSubscribedClientsEvent(
      GetSubscribedClientsEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    if (state.getSubscribedClientsStatus.isLoading()) return;

    emit(state.copyWith(getSubscribedClientsStatus: BlocStatus.loading(),));

    final params = GetSubscribedClientsParams();

    try {

      final response = await _getSubscribedClientsUseCase(params.toMap());
      List<SubscribedClientModel> newList = response.message ?? [];

      if (newList.isEmpty) {
        emit(state.copyWith(
          getSubscribedClientsStatus: BlocStatus.empty(),
        ));
      } else {
        addActivityEntity.subscribedClientsList.value=newList;
        if(addActivityEntity.selectedActivity.value != null){
          addActivityEntity.setUpdateValues(addActivityEntity.selectedActivity.value!);
        }
        emit(state.copyWith(
          getSubscribedClientsStatus: BlocStatus.success(),
          subscribedClientsList: newList,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getSubscribedClientsStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }


  FutureOr<void> _onUpdateCrudActivityEvent(
      UpdateCrudActivityEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    if (state.updateClientActivityStatus.isLoading()) return;

    emit(state.copyWith(updateClientActivityStatus: BlocStatus.loading(),));

    final params = UpdateActivityCrudParams(
      activityId: event.activityId,
      activityTypeId:  addActivityEntity.selectedActivityType.value!.id.toString(),
      name: addActivityEntity.nameController.text,
      fkClient:  addActivityEntity.selectedClient.value!.id.toString(),
      startDate: addActivityEntity.startDateController.text,
      endDate: addActivityEntity.endDateController.text,
      wholeDay: addActivityEntity.wholeDay.value ? 1 : 0,
      description: addActivityEntity.descriptionController.text,
      priority: addActivityEntity.priority.value??"normal",
      state: addActivityEntity.activityState.value??"schedule",
    );
    try {
  
      final response = await _updateActivityUseCase(params);

        if(response.message!=null){
          ClientActivityModel currentAct;
            if (pageVariables.allList.any((activity) => activity.id.toString() == event.activityId)) {
             currentAct = pageVariables.allList.firstWhere(
                    (activity) => activity.id.toString() == event.activityId,
              );
             int index = pageVariables.allList.indexOf(currentAct);
             emit(state.copyWith(
               getAllCrudActivitiesStatus: BlocStatus.loading(),
             ));
             pageVariables.allList[index] = response.message!;

             emit(state.copyWith(
               updateClientActivityStatus: BlocStatus.success(),
               getAllCrudActivitiesStatus: BlocStatus.success(),
               clientActivities: pageVariables.allList,
               totalCount: pageVariables.totalCount,
             ));
             event.onSuccess?.call();
            }
        }
    } catch (e) {
      emit(state.copyWith(
        updateClientActivityStatus: BlocStatus.fail(error: e.toString()),
        getAllCrudActivitiesStatus: BlocStatus.success(),
        clientActivities: pageVariables.allList,
        totalCount: pageVariables.totalCount,
      ));
      event.onSuccess?.call();
    }
  }

  FutureOr<void> _onAddActivityEvent(
      AddActivityEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    if (state.addClientActivityStatus.isLoading()) return;

    emit(state.copyWith(updateClientActivityStatus: BlocStatus.loading()));

    final params = AddActivityCrudParams(
      activityTypeId:  addActivityEntity.selectedActivityType.value!.id.toString(),
      name: addActivityEntity.nameController.text,
      fkClient:  addActivityEntity.selectedClient.value!.id.toString(),
      startDate: addActivityEntity.startDateController.text,
      endDate: addActivityEntity.endDateController.text,
      wholeDay: addActivityEntity.wholeDay.value ? 1 : 0,
      description: addActivityEntity.descriptionController.text,
      priority: addActivityEntity.priority.value??"normal",
      state: addActivityEntity.activityState.value??"schedule",
    );

    try {
      final response = await _addActivityUseCase(params);

      if (response.message != null) {
        pageVariables.allList.insert(0, response.message!);
        emit(state.copyWith(
          updateClientActivityStatus: BlocStatus.success(),
          clientActivities: pageVariables.allList,
          totalCount: pageVariables.totalCount + 1,
        ));
        event.onSuccess?.call();
      }
    } catch (e) {
      emit(state.copyWith(
        updateClientActivityStatus: BlocStatus.fail(error: e.toString()),
        clientActivities: pageVariables.allList,
        totalCount: pageVariables.totalCount,
      ));
      event.onSuccess?.call();
    }
  }
  FutureOr<void> _onChangeWholeDayValueEvent(
      ChangeWholeDayValueEvent event,
      Emitter<CrudActivitiesState> emit,
      ) async {
    addActivityEntity.wholeDay.value = !state.wholeDay;
    emit(state.copyWith(wholeDay: !state.wholeDay));
  }

}