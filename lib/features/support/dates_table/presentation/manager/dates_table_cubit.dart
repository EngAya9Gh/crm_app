import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';

part 'dates_table_state.dart';

@injectable
class DatesTableCubit extends Cubit<DatesTableState> {
  final GetDateInstallationUsecase _getDateInstallationUsecase;
  final RescheduleDateUsecase _rescheduleDateUsecase;
  final ChangeDateToDonUsecase _changeDateToDonUsecase;
  final CancelScheduleUsecase _cancelScheduleUsecase;

  DatesTableCubit(
    this._getDateInstallationUsecase,
    this._rescheduleDateUsecase,
    this._changeDateToDonUsecase,
    this._cancelScheduleUsecase,
  ) : super(DatesTableState());

  String? changedIdUser;
  LinkedHashMap<DateTime, List<EventModel>> eventDataSource = LinkedHashMap();
  List<EventModel> _events = [];
  List<MainCityModel> allMainCities = [];
  List<MainCityModel> _filterSelectedMainCity = [];
  String _filterIdUser = '';

  String? get filterIdUser => _filterIdUser;

  set filterIdUser(String? value) {
    _filterIdUser = value ?? '';
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  List<MainCityModel> get filterSelectedMainCity => _filterSelectedMainCity;

  set filterSelectedMainCity(List<MainCityModel> value) {
    _filterSelectedMainCity = value;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void resetFilter(List<MainCityModel> cities) {
    allMainCities = List.from(cities);
    filterSelectedMainCity = List.from(cities);
    filterIdUser = null;

    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  Future<void> getDateInstallation(
    GetDateInstallationParams getDateInstallationParams, {
    Function(List<EventModel> listEvents)? onSuccess,
  }) async {
    emit(state.copyWith(getDateInstallationStatus: BlocStatus.loading()));

    getDateInstallationParams = getDateInstallationParams.copyWith(
      mainCityFks: filterSelectedMainCity.map((e) => e.id_maincity).toList(),
      fkUser: filterIdUser,
    );

    final result = await _getDateInstallationUsecase(getDateInstallationParams);
    result.fold((l) {
      emit(state.copyWith(
        getDateInstallationStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      _events = r.map((e) => e.asEvent()).toList();
      onSuccess?.call(_events);
      handleEventsMap(eventsList: _events);
      emit(state.copyWith(getDateInstallationStatus: BlocStatus.success()));
    });
  }

  Future<void> rescheduleDate(
    RescheduleDateParams rescheduleDateParams, {
    void Function(String)? onSuccess,
  }) async {
    emit(state.copyWith(rescheduleDateStatus: BlocStatus.loading()));

    final result = await _rescheduleDateUsecase(rescheduleDateParams);
    result.fold((l) {
      emit(state.copyWith(rescheduleDateStatus: BlocStatus.fail(error: l)));
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(rescheduleDateStatus: BlocStatus.success()));
    });
  }

  Future<void> changeDateToDone(
    ChangeDateToDoneParams changeDateToDoneParams, {
    void Function(String)? onSuccess,
    void Function(String)? onFail,
  }) async {
    emit(state.copyWith(changeDateToDoneStatus: BlocStatus.loading()));

    final result = await _changeDateToDonUsecase(changeDateToDoneParams);
    result.fold((l) {
      emit(state.copyWith(changeDateToDoneStatus: BlocStatus.fail(error: l)));
      onFail?.call(l);
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(changeDateToDoneStatus: BlocStatus.success()));
    });
  }

  Future<void> cancelSchedule(
    CancelScheduleParams cancelScheduleParams, {
    void Function(String)? onSuccess,
    void Function(String)? onFail,
  }) async {
    emit(state.copyWith(cancelScheduleStatus: BlocStatus.loading()));

    final result = await _cancelScheduleUsecase(cancelScheduleParams);
    result.fold((l) {
      emit(state.copyWith(cancelScheduleStatus: BlocStatus.fail(error: l)));
      onFail?.call(l);
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(cancelScheduleStatus: BlocStatus.success()));
    });
  }

  void handleEventsMap({
    List<EventModel>? eventsList,
    EventModel? updatedEvent,
    EventModel? oldEvent,
  }) {
    if (eventsList != null) _events = List.from(eventsList);
    if (updatedEvent != null) {
      _handleUpdatedEvent(updatedEvent: updatedEvent, oldEvent: oldEvent);
    }

    final mapEvents = Map<DateTime, List<EventModel>>.fromIterable(
      _events,
      key: (item) => (item as EventModel).from,
      value: (item) => _events.where((element) {
        return isSameDay((item as EventModel).from, element.from);
      }).toList(),
    );

    eventDataSource = LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    )..addAll(mapEvents);

    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void _handleUpdatedEvent(
      {required EventModel updatedEvent, EventModel? oldEvent}) {
    if (oldEvent != null) {
      _events.removeWhere((element) => element.from == oldEvent.from);
      _events.add(updatedEvent);
      return;
    }

    final index = _events.indexWhere((element) {
      return element.from == updatedEvent.from;
    });
    if (index != -1) {
      _events[index] = updatedEvent;
    }
  }

  int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
