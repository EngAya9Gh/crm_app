import 'dart:collection';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../data/models/date_invoice_model.dart';
import '../../domain/entities/add_event_form_variables_entity.dart';
import '../../domain/entities/dates_table_page_variables_entity.dart';
import '../../domain/entities/filter_dates_table_entity.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../../domain/use_cases/get_subscribed_clients_usecase.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import 'isolate_executor.dart';

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
  List<UserEntity> subscribedClients = [];
  AddEventFormVariablesEntity addEventFormVariables =
      AddEventFormVariablesEntity();
  DatesTablePageVariablesEntity pageVariables = DatesTablePageVariablesEntity();
  FilterDatesTableEntity filterEntity = FilterDatesTableEntity();

  void init(List<MainCityModel> cities) {
    pageVariables = DatesTablePageVariablesEntity();
    filterEntity = FilterDatesTableEntity();
    eventDataSource = LinkedHashMap();
    pageVariables.allMainCities = List.from(cities);
    setAllCities();
  }

  void setAllCities() => filterEntity.mainCitiesNotifier.value =
      List.from(pageVariables.allMainCities);

  Future<void> getDateInstallation({
    required String fkCountry,
    Function(List<EventModel> listEvents)? onSuccess,
  }) async {
    filterEntity.savePreviousState();
    emit(state.copyWith(getDateInstallationStatus: BlocStatus.loading()));

    final result = await _getDateInstallationUsecase(GetDateInstallationParams(
      fkCountry: fkCountry,
      fkUser: filterEntity.userNotifier.value?.idUser,
      mainCityFks: filterEntity.mainCitiesNotifier.value
          ?.map((e) => e.id_maincity)
          .toList(),
    ));
    result.fold((l) {
      emit(state.copyWith(
        getDateInstallationStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      pageVariables.allList = List.from(r);
      filterEventsLocally();
      onSuccess?.call(pageVariables.allList);
      emit(state.copyWith(getDateInstallationStatus: BlocStatus.success()));
    });
  }

  void filterEventsLocally() {
    AppConstants.debounceFunction(
      () {
        if (pageVariables.searchController.text.isEmpty) {
          pageVariables.filteredList = List.from(pageVariables.allList);
        } else {
          pageVariables.filteredList = List.from(pageVariables.allList.where(
            (element) {
              return element.searchString(pageVariables.searchController.text);
            },
          ));
        }

        handleEventsMap(eventsList: pageVariables.filteredList);
      },
      tag: "search_events_table",
    );
  }

  Future<void> handleEventsMap({
    List<EventModel>? eventsList,
    EventModel? updatedEvent,
    EventModel? oldEvent,
  }) async {
    try {
      emit(state.copyWith(
        renderEventsStatus: BlocStatus.loading(),
        refreshUi: state.refreshUi + 1,
      ));
      final receivePort = ReceivePort();
      final isolateParams = {
        'sendPort': receivePort.sendPort,
        'eventsList': eventsList ?? List.from(pageVariables.allList),
        'updatedEvent': updatedEvent,
        'oldEvent': oldEvent,
      };

      await Isolate.spawn(
          (params) => IsolateHelper.handleEventsMapIsolate(params),
          isolateParams);

      receivePort.listen((result) {
        pageVariables.filteredList = List.from(result["eventsList"]);
        this.eventDataSource = result["eventDataSource"];

        emit(state.copyWith(
          renderEventsStatus: BlocStatus.success(),
          refreshUi: state.refreshUi + 1,
        ));
        receivePort.close();
      });

      return;
    } catch (e) {
      emit(state.copyWith(
        renderEventsStatus: BlocStatus.fail(error: e.toString()),
        refreshUi: state.refreshUi + 1,
      ));
      throw e;
    }
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

  void _handleUpdatedEvent(
      {required EventModel updatedEvent, EventModel? oldEvent}) {
    if (oldEvent != null) {
      pageVariables.allList
          .removeWhere((element) => element.from == oldEvent.from);
      pageVariables.allList.add(updatedEvent);
      return;
    }

    final index = pageVariables.allList.indexWhere((element) {
      return element.from == updatedEvent.from;
    });
    if (index != -1) {
      pageVariables.allList[index] = updatedEvent;
    } else {
      pageVariables.allList.add(updatedEvent);
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
      emit(state.copyWith(
          getInvoicesByClientForDateStatus: BlocStatus.success(data: r)));
    });
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
