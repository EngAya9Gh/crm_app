import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../data/models/client_activity_model.dart';
import '../../domain/entities/care_activities_variable_entity.dart';
import '../../domain/entities/update_care_activity_variable_entity.dart';
import '../../domain/use_cases/get_all_care_activities_usecase.dart';
import '../../domain/use_cases/update_care_activity_usecase.dart';

part 'care_activities_event.dart';
part 'care_activities_state.dart';

@injectable
class CareActivitiesBloc extends Bloc<CareActivitiesEvent, CareActivitiesState> {
  final GetAllCareActivitiesUseCase _getAllCareActivitiesUseCase;
  final UpdateCareActivityUseCase _updateActivityUseCase;

  CareActivitiesPageVariablesEntity pageVariables = CareActivitiesPageVariablesEntity();
  UpdateCareActivityVariablesEntity updateActivityVariables = UpdateCareActivityVariablesEntity();

  CareActivitiesBloc(this._getAllCareActivitiesUseCase,this._updateActivityUseCase,) : super(CareActivitiesState()) {
    on<GetAllCareActivitiesEvent>(_onGetAllCareActivitiesEvent);
    on<UpdateActivityEvent>(_onUpdateActivityEvent);

  }

  FutureOr<void> _onGetAllCareActivitiesEvent(
      GetAllCareActivitiesEvent event,
      Emitter<CareActivitiesState> emit,
      ) async {
    if (state.getAllCareActivitiesStatus.isLoading()) return;

    emit(state.copyWith(getAllCareActivitiesStatus: BlocStatus.loading(),currentPage: event.page));

    final params = GetAllCareActivitiesParams(
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
      final response = await _getAllCareActivitiesUseCase(params);
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
          getAllCareActivitiesStatus: BlocStatus.empty(),
          currentPage: event.page,
        ));
      } else {
        emit(state.copyWith(
          getAllCareActivitiesStatus: BlocStatus.success(),
          careActivities: pageVariables.allList,
          totalCount: pageVariables.totalCount,
          currentPage: event.page,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getAllCareActivitiesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }


  FutureOr<void> _onUpdateActivityEvent(
      UpdateActivityEvent event,
      Emitter<CareActivitiesState> emit,
      ) async {
    if (state.updateClientActivityStatus.isLoading()) return;

    emit(state.copyWith(updateClientActivityStatus: BlocStatus.loading(),));

    final params = UpdateCareActivityParams(
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
            getAllCareActivitiesStatus: BlocStatus.loading(),
          ));
          pageVariables.allList[index] = response.message!; // As

          emit(state.copyWith(
            updateClientActivityStatus: BlocStatus.success(),
            getAllCareActivitiesStatus: BlocStatus.success(),
            careActivities: pageVariables.allList,
            totalCount: pageVariables.totalCount,
          ));
          event.onSuccess?.call();
        }
    } catch (e) {
      emit(state.copyWith(
        updateClientActivityStatus: BlocStatus.fail(error: e.toString()),
        getAllCareActivitiesStatus: BlocStatus.success(),
        careActivities: pageVariables.allList,
        totalCount: pageVariables.totalCount,
      ));
      event.onSuccess?.call();
    }
  }


}