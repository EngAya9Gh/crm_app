import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../data/models/date_invoice_model.dart';
import '../../domain/add_event_form_variables.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../../domain/use_cases/get_subscribed_clients_usecase.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';

part 'dates_table_state.dart';

@injectable
class DatesTableCubit extends Cubit<DatesTableState> {
  final GetDateInstallationUsecase _getDateInstallationUsecase;
  final RescheduleDateUsecase _rescheduleDateUsecase;
  final ChangeDateToDonUsecase _changeDateToDonUsecase;
  final CancelScheduleUsecase _cancelScheduleUsecase;
  final ReturnScheduleVisitToOpenUsecase _returnScheduleVisitToOpenUsecase;
  final GetSubscribedClientsUsecase _getSubscribedClientsUsecase;
  final GetInvoicesByClientForDateUsecase _getInvoicesByClientForDateUsecase;
  final AddDateInstallUsecase _addDateInstallUsecase;

  DatesTableCubit(
    this._getDateInstallationUsecase,
    this._rescheduleDateUsecase,
    this._changeDateToDonUsecase,
    this._cancelScheduleUsecase,
    this._returnScheduleVisitToOpenUsecase,
    this._getSubscribedClientsUsecase,
    this._getInvoicesByClientForDateUsecase,
    this._addDateInstallUsecase,
  ) : super(DatesTableState());

  String? changedIdUser;
  LinkedHashMap<DateTime, List<EventModel>> eventDataSource = LinkedHashMap();
  List<EventModel> _events = [];
  List<MainCityModel> allMainCities = [];
  List<MainCityModel> _filterSelectedMainCity = [];
  String _filterIdUser = '';
  String _nameCityClient = '';
  bool _isAllEvents = true;
  List<UserEntity> subscribedClients = [];
  final AddEventFormVariables addEventFormVariables = AddEventFormVariables();

  bool get isAllEvents => _isAllEvents;

  set isAllEvents(bool value) {
    _isAllEvents = value;
    filterSelectedMainCity = List.from(allMainCities);

    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  String? get filterIdUser => _filterIdUser;

  set filterIdUser(String? value) {
    _filterIdUser = value ?? '';
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  String get nameCityClient => _nameCityClient;

  set nameCityClient(String value) {
    _nameCityClient = value;
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

    getDateInstallationParams = _prepareParams(getDateInstallationParams);

    final result = await _getDateInstallationUsecase(getDateInstallationParams);
    result.fold((l) {
      emit(state.copyWith(
        getDateInstallationStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      _events = List.from(r);
      onSuccess?.call(_events);
      handleEventsMap(eventsList: _events);
      emit(state.copyWith(getDateInstallationStatus: BlocStatus.success()));
    });
  }

  GetDateInstallationParams _prepareParams(
      GetDateInstallationParams getDateInstallationParams) {
    getDateInstallationParams = getDateInstallationParams.copyWith(
      mainCityFks: filterSelectedMainCity.map((e) => e.id_maincity).toList(),
      fkUser: filterIdUser,
      nameCityClient: nameCityClient,
    );

    if (isAllEvents) {
      getDateInstallationParams = GetDateInstallationParams(
        fkCountry: getDateInstallationParams.fkCountry,
        fkUser: getDateInstallationParams.fkUser,
      );
    }
    return getDateInstallationParams;
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
  }) async {
    emit(state.copyWith(changeDateToDoneStatus: BlocStatus.loading()));

    final result = await _changeDateToDonUsecase(changeDateToDoneParams);
    result.fold((l) {
      emit(state.copyWith(changeDateToDoneStatus: BlocStatus.fail(error: l)));
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
    } else {
      _events.add(updatedEvent);
    }
  }

  int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Future<void> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams reOpenEventParams, {
    void Function(dynamic)? onSuccess,
  }) async {
    emit(state.copyWith(reOpenEventStatus: BlocStatus.loading()));

    final result = await _returnScheduleVisitToOpenUsecase(reOpenEventParams);
    result.fold((l) {
      emit(state.copyWith(reOpenEventStatus: BlocStatus.fail(error: l)));
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(reOpenEventStatus: BlocStatus.success()));
    });
  }

  Future<void> addDateInstall(
    AddDateInstallParams addDateInstallParams, {
    Function(EventModel)? onSuccess,
  }) async {
    emit(state.copyWith(addDateInstallStatus: BlocStatus.loading()));

    final result = await _addDateInstallUsecase(addDateInstallParams);

    result.fold((l) {
      emit(state.copyWith(addDateInstallStatus: BlocStatus.fail(error: l)));
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(addDateInstallStatus: BlocStatus.success()));
    });
  }

  Future<void> getSubscribedClients() async {
    emit(state.copyWith(getSubscribedClientsStatus: BlocStatus.loading()));

    final result =
        await _getSubscribedClientsUsecase(GetSubscribedClientsParams());
    result.fold((l) {
      emit(state.copyWith(
          getSubscribedClientsStatus: BlocStatus.fail(error: l)));
    }, (r) {
      subscribedClients = List.from(r);
      emit(state.copyWith(getSubscribedClientsStatus: BlocStatus.success()));
    });
  }

  Future<void> getInvoicesByClientForDate(
    GetInvoicesByClientForDateParams getInvoicesByClientForDateParams, {
    Function(List<EventModel> listEvents)? onSuccess,
  }) async {
    emit(
        state.copyWith(getInvoicesByClientForDateStatus: BlocStatus.loading()));

    final result = await _getInvoicesByClientForDateUsecase(
      getInvoicesByClientForDateParams,
    );
    result.fold((l) {
      emit(state.copyWith(
        getInvoicesByClientForDateStatus: BlocStatus.fail(error: l),
      ));
    }, (r) async {
      print("length => ${r.length}");
      emit(state.copyWith(
          getInvoicesByClientForDateStatus: BlocStatus.success(data: r)));
    });
  }
}
