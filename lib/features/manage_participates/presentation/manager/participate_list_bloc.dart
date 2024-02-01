import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/communication_list/domain/use_cases/get_communication_list_usecase.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/nullable.dart';
// import '../../data/models/distinctive_client.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import '../../domain/use_cases/get_participate_list_usecase.dart';

// part 'participate_list_event.dart';

// part 'participate_list_state.dart';


@injectable
class ParticipateListBloc extends Bloc<ParticipateEvent, ParticipateListState> {
  // ParticipateListBloc(initialState) : super(initialState);
  ParticipateListBloc(this._getParticipateListUsecase) : super(ParticipateListState()) {
    on<GetParticipateListEvent>(_onGetParticipateListEvent);
    on<SearchEvent>(_onSearchEvent);
    on<OnChangeRegionEvent>(_onOnChangeRegionEvent);
  }

  final ParticipateListUsecase _getParticipateListUsecase;

  FutureOr<void> _onGetParticipateListEvent(
      GetParticipateListEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateListState: PageState.loading()));

    final response = await _getParticipateListUsecase(
        GetParticipateListParams(
          // country: event.fkCountry, citId: state.selectedCityId
          )
        );
//  List<ParticipateModel>.from(value.message ?? state.allParticipateState);
    response.fold(
      (exception, message) => emit(state.copyWith(particiPateListState: PageState.error())),
      (value) {
        final filterData = filterList(event.query);
        final lists = [filterData, (value.message ?? [])];
        final commonElements =   event.query.isNotEmpty 
            ? filterList(event.query,value.message)
            : HelperFunctions.instance.intersection(lists);

        emit(
          state.copyWith(
            particiPateListState: 
             event.query.isNotEmpty
                ?PageState.loaded(data: commonElements)
                : PageState.loaded(data: value.message ?? []) ,
            allParticipateState: value.message,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSearchEvent(SearchEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateListState: PageState.loaded(data: filterList(event.query))));
  }

  List<ParticipateModel> filterList(String query , [List<ParticipateModel>? l]) {
    List<ParticipateModel> list = List<ParticipateModel>.from(l ?? state.allParticipateState);
    list = list
        .where((element) =>
        //     (element.name_participate?.toLowerCase().contains(query) ?? false) ||
            (element.name_participate?.toLowerCase().contains(query) ?? false) ||
            (element.numberbank_participate.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }

  FutureOr<void> _onOnChangeRegionEvent(OnChangeRegionEvent event, Emitter<ParticipateListState> emit) {
    // emit(state.copyWith(selectedCityId1: Nullable.value(event.selectedRegionId)));

    add(GetParticipateListEvent(event.fkCountry, query: event.query));
  }


}
