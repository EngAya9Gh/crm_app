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
  }

  final GetCommunicationListUsecase _getCommunicationListUsecase;

  FutureOr<void> _onGetCommunicationListEvent(
      GetCommunicationListEvent event, Emitter<CommunicationListState> emit) async {
    emit(state.copyWith(communicationListState: PageState.loading()));

    final response = await _getCommunicationListUsecase(GetCommunicationListParams(country: event.fkCountry));

    response.fold(
      (exception, message) => emit(state.copyWith(communicationListState: PageState.error())),
      (value) => emit(state.copyWith(communicationListState: PageState.loaded(data: value.data ?? []))),
    );
  }
}
