import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/support/dates_timeline/data/models/date_timeline_model.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_date_timeline_entity.dart';

part 'dates_timeline_state.dart';
part 'dates_timeline_event.dart';

@injectable
class DatesTimelineBloc extends  Bloc<DateTimelineEvent, DatesTimelineState>  {
  final GetTimelineByEmployeeUseCase _getTimelineByEmployeeUseCase;
  FilterDatesTimelineEntity filterEntity = FilterDatesTimelineEntity();

  DatesTimelineBloc(this._getTimelineByEmployeeUseCase) : super(DatesTimelineState(selectedDate: DateTime.now())) {
  on<GetTimelineByEmployeeEvent>(_onGetTimelineByEmployeeEvent);
  on<UpdateSelectedDateEvent>(_onUpdateSelectedDate);

  }


  FutureOr<void> _onGetTimelineByEmployeeEvent(
      GetTimelineByEmployeeEvent event, Emitter<DatesTimelineState> emit) async {
    emit(state.copyWith(getDatesTimelineStatus: const BlocStatus.loading()));

    final response =
    await _getTimelineByEmployeeUseCase(event.getTimelineByEmployeeParams);

    response.fold(
          (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
            getDatesTimelineStatus: BlocStatus.fail(error: e ?? '')));
      },
          (data) {
        emit(state.copyWith(
          getDatesTimelineStatus: const BlocStatus.success(),
          events: data,
        ));

        event.onSuccess?.call(data);
      },
    );
  }



  void _onUpdateSelectedDate(
      UpdateSelectedDateEvent event,
      Emitter<DatesTimelineState> emit,
      ) {
    emit(state.copyWith(selectedDate: event.selectedDate));
  }

  String get formattedSelectedDate => DateFormat('yyyy-MM-dd').format(state.selectedDate);

}