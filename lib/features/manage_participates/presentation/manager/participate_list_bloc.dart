import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';

import 'package:injectable/injectable.dart';

import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import '../../../../common/models/page_state/bloc_status.dart';
import '../../domain/use_cases/add_participate_usecase.dart';
import '../../domain/use_cases/edit_paraticipate_usecase.dart';
import '../../domain/use_cases/get_participate_list_usecase.dart';




@injectable
class ParticipateListBloc extends Bloc<ParticipateEvent, ParticipateListState> {
  // ParticipateListBloc(initialState) : super(initialState);
  ParticipateListBloc(
    this._getParticipateListUsecase,
    this._addParticipateUserUsecase,
    this._editParticipateUserUsecase) : super(ParticipateListState()) {
    on<GetParticipateListEvent>(_onGetParticipateListEvent);
    on<SearchEvent>(_onSearchEvent);
    on<AddParticipateEvent>(_onAddParticipateEvent);
    on<EditParticipateEvent>(_onEditParticipateEvent);
    on<ChanageCurrentParticipate>(_onChangeCurrentParticipate);
    on<SwitchProfileTabs>(_onSwitchProfileTabs);
   
     
  }

  final ParticipateListUsecase _getParticipateListUsecase;
  final AddParticipateUserUsecase _addParticipateUserUsecase;
  final EditParticipateUserUsecase _editParticipateUserUsecase;
  FutureOr<void> _onGetParticipateListEvent(
      GetParticipateListEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(particiPateListState: PageState.loading()));

    final response = await _getParticipateListUsecase( GetParticipateListParams() );

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
            (element.name_participate.toLowerCase().contains(query) ?? false) ||
            (element.numberbank_participate.toLowerCase().contains(query) ?? false))
        .toList();
    return list;
  }


   FutureOr<void> _onAddParticipateEvent(AddParticipateEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(actionParticipateBlocStatus:BlocStatus.loading()));
  
    final response = await _addParticipateUserUsecase(event.addParticipateParams);

    response.fold(
      (exception, message) => emit(state.copyWith(actionParticipateBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
       emit(state.copyWith(actionParticipateBlocStatus: const BlocStatus.success()));
        List<ParticipateModel> participates = state.allParticipateState;
        participates.insert(0, value.data!);
        //  emit(state.copyWith(particiPateListState: PageState.loading()));
         emit(
          state.copyWith(
           particiPateListState: PageState.loaded(data: participates),
            allParticipateState: participates,
          ),
        );
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onEditParticipateEvent(EditParticipateEvent event, Emitter<ParticipateListState> emit) async {
    emit(state.copyWith(actionParticipateBlocStatus: const BlocStatus.loading()));

    final response = await _editParticipateUserUsecase(event.editParticipateParams);

    response.fold(
      (exception, message) => emit(state.copyWith(actionParticipateBlocStatus: BlocStatus.fail(error: message ?? ''))),
      (value) {
        emit(state.copyWith(actionParticipateBlocStatus: const BlocStatus.success()));
        List<ParticipateModel> participates = state.allParticipateState;
        participates = participates.map((e) => e.id_participate == event.editParticipateParams.idParticipate ? value.data! : e).toList();
       
      //  emit(state.copyWith(particiPateListState: PageState.loading()));
        emit(
          state.copyWith(
            particiPateListState: PageState.loaded(data: participates),
            allParticipateState: participates,
          ),
        );
        event.onSuccess?.call(value.data!);
      },
    );
  }

  FutureOr<void> _onSwitchProfileTabs(SwitchProfileTabs event, Emitter<ParticipateListState> emit) async {
      emit(state.copyWith(currentProfileTab:event.indexTab));
        
      
  }

   FutureOr<void> _onChangeCurrentParticipate(ChanageCurrentParticipate event, Emitter<ParticipateListState> emit) async {
      emit(state.copyWith(currentPaticipate:event.participateModel));
        
      
  }

}
