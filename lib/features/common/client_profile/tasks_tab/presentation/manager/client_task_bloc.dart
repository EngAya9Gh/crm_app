import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_client_tasks_usecase.dart';

part 'client_task_event.dart';

part 'client_task_state.dart';

@injectable
class ClientTaskBloc extends Bloc<ClientTaskEvent, ClientTaskState> {
  final GetClientTasksUsecase _getClientTasksUsecase;

  ClientTaskBloc(
    this._getClientTasksUsecase,
  ) : super(ClientTaskState()) {
    on<GetClientTasksEvent>(_onGetClientTasksEvent);
  }

  FutureOr<void> _onGetClientTasksEvent(GetClientTasksEvent event, Emitter<ClientTaskState> emit) async {
    emit(state.copyWith(listClientTasks: BlocStatus.loading()));
    final result = await _getClientTasksUsecase(event.params);
    result.extract(
      (exception, message) => BlocStatus.fail(error: message),
      (value) {
        emit(state.copyWith(totalCount: value.count));
        if (value.message?.isEmpty??true) {
          emit(state.copyWith(listClientTasks: BlocStatus.success(data: [])));
        }
        emit(state.copyWith(listClientTasks: BlocStatus.success(data: value.message)));
      },
    );
  }
}
