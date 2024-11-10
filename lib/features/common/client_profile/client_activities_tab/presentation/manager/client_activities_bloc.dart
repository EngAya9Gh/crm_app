import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';
import '../../domain/entities/client_activities_variable_entity.dart';
import '../../domain/use_cases/get_client_activities_usecase.dart';

part 'client_activities_event.dart';
part 'client_activities_state.dart';

@injectable
class ClientActivitiesBloc extends Bloc<ClientActivitiesEvent, ClientActivitiesState> {
  final GetClientActivitiesUseCase _getAllClientActivitiesUseCase;

  ClientActivitiesPageVariablesEntity pageVariables = ClientActivitiesPageVariablesEntity();

  ClientActivitiesBloc(this._getAllClientActivitiesUseCase,) : super(ClientActivitiesState()) {
    on<GetAllClientActivitiesEvent>(_onGetAllClientActivitiesEvent);

  }

  FutureOr<void> _onGetAllClientActivitiesEvent(
      GetAllClientActivitiesEvent event,
      Emitter<ClientActivitiesState> emit,
      ) async {
    if (state.getClientActivitiesStatus.isLoading()) return;

    emit(state.copyWith(getClientActivitiesStatus: BlocStatus.loading(),currentPage: event.page));

    final params = GetAllClientActivitiesParams(
      page: event.page,
      limit: 20,
      clientId: event.clientId,
    );

    try {
      if(event.filter != null ){
        pageVariables.allList = [];
        pageVariables.totalCount = 0;
      }
      final response = await _getAllClientActivitiesUseCase(params);
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
          getClientActivitiesStatus: BlocStatus.empty(),
          currentPage: event.page,
        ));
      } else {
        emit(state.copyWith(
          getClientActivitiesStatus: BlocStatus.success(),
          careActivities: pageVariables.allList,
          totalCount: pageVariables.totalCount,
          currentPage: event.page,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getClientActivitiesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }



}