import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../data/models/date_invoice_model.dart';
import '../../domain/entities/add_event_form_variables_entity.dart';
import '../../domain/entities/dates_table_page_variables_entity.dart';
import '../../domain/entities/events_isolate_params_entity.dart';
import '../../domain/entities/filter_dates_table_entity.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../domain/use_cases/cofirm_visit_date_usecase.dart';
import '../../domain/use_cases/get_cancel_reasons_usecase.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../../domain/use_cases/get_subscribed_clients_usecase.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import '../../domain/use_cases/start_date_visit_status_usecase.dart';
import 'isolate_executor.dart';

part 'dates_table_state.dart';

@injectable
class DatesTableCubit extends Cubit<DatesTableState> {
  final GetDateInstallationUsecase _getDateInstallationUsecase;
  final RescheduleDateUsecase _rescheduleDateUsecase;
  final ChangeDateToDonUsecase _changeDateToDonUsecase;
  final ConfirmVisitDateUsecase _confirmVisitDateUsecase;
  final StartDateVisitStatusUsecase _startDateVisitStatusUsecase;
  final CancelScheduleUsecase _cancelScheduleUsecase;
  final ReturnScheduleVisitToOpenUsecase _returnScheduleVisitToOpenUsecase;
  final GetSubscribedClientsUsecase _getSubscribedClientsUsecase;
  final GetInvoicesByClientForDateUsecase _getInvoicesByClientForDateUsecase;
  final AddDateInstallUsecase _addDateInstallUsecase;
  final GetCancelReasonsUsecase _getCancelReasonsUsecase;

  DatesTableCubit(
    this._getDateInstallationUsecase,
    this._rescheduleDateUsecase,
    this._changeDateToDonUsecase,
    this._confirmVisitDateUsecase,
    this._cancelScheduleUsecase,
    this._returnScheduleVisitToOpenUsecase,
    this._getSubscribedClientsUsecase,
    this._getInvoicesByClientForDateUsecase,
    this._addDateInstallUsecase,
    this._getCancelReasonsUsecase,
    this._startDateVisitStatusUsecase,
  ) : super(DatesTableState());

  String? changedIdUser;
  List<UserEntity> subscribedClients = [];
  AddEventFormVariablesEntity addEventFormVariables =
      AddEventFormVariablesEntity();
  DatesTablePageVariablesEntity pageVariables = DatesTablePageVariablesEntity();
  FilterDatesTableEntity filterEntity = FilterDatesTableEntity();

  void init() {
    pageVariables.clear();
    filterEntity.clear();
    loadCalendarData();
  }

  void setAllCities({List<RegionModel>? cities}) {
    if (cities != null) {
      pageVariables.allMainCities = List.from(cities);
    }
    filterEntity.mainCitiesNotifier.value =
        List.from(pageVariables.allMainCities);
  }

  void loadCalendarData() {
    emit(state.copyWith(getDateInstallationStatus: BlocStatus.loading()));
    pageVariables.loadCalendarData();
    emit(state.copyWith(getDateInstallationStatus: BlocStatus.success()));
  }

  void refreshUi({BlocStatus? status}) {
    if (status == null) {
      return emit(state.copyWith(refreshUi: state.refreshUi + 1));
    }
    emit(state.copyWith(
        renderEventsStatus: status, refreshUi: state.refreshUi + 1));
  }

  Future<void> getDateInstallation({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.clear();
        }
        emit(state.copyWith(getDateInstallationStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getDateInstallationUsecase(
          GetDateInstallationParams(
              fkCountry: AppConstants.currentCountry,
              fkUser: filterEntity.userNotifier.value?.idUser,
              mainCityFks: filterEntity.isAllEventsNotifier.value
                  ? null
                  : filterEntity.mainCitiesNotifier.value
                      ?.map((e) => e.id_maincity)
                      .toList(),
              date: pageVariables.focusedDay,
              type: filterEntity.type.value),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getDateInstallationStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            if (isNewFilter) {
              pageVariables.allList = [];
            }
            pageVariables.allList.addAll(value.data);

            pageVariables.totalCount = value.count ?? 0;
            loadCalendarData();
            filterEventsLocally();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getDateInstallationStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getDateInstallationStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_dates_table',
      isDebounced: isDebounced,
    );
  }

  void filterEventsLocally() {
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      pageVariables.filteredList = List.from(pageVariables.allList.where(
        (element) {
          return element.searchString(pageVariables.searchController.text);
        },
      ));
    }
    _handleSelectedDayEvents();
    handleEventsMap(eventsList: pageVariables.filteredList);
  }

  void _handleSelectedDayEvents() {
    if (!isSameDay(pageVariables.selectedDay, pageVariables.focusedDay)) {
      pageVariables.selectedDayEvents.value = [];
      return;
    }
    pageVariables.selectedDayEvents.value = List.from(
      pageVariables.filteredList.where((element) {
        return isSameDay(element.from, pageVariables.selectedDay);
      }),
    );
  }

  Future<void> handleEventsMap({
    List<EventModel>? eventsList,
    EventModel? updatedEvent,
    EventModel? oldEvent,
  }) async {
    try {
      emit(state.copyWith(renderEventsStatus: BlocStatus.loading()));

      final isolateParams = EventsIsolateParamsEntity(
        allList: pageVariables.allList,
        filteredList: eventsList ?? pageVariables.filteredList,
        selectedDayEvents: pageVariables.selectedDayEvents.value,
        eventDataSource: pageVariables.eventDataSource,
        oldEvent: oldEvent,
        updatedEvent: updatedEvent,
      );

      final result = await compute(
        IsolateHelper.handleEventsMapIsolate,
        isolateParams,
      );

      pageVariables.allList = result.allList;
      pageVariables.filteredList = result.filteredList;
      pageVariables.selectedDayEvents.value = result.selectedDayEvents;
      pageVariables.eventDataSource = result.eventDataSource!;

      emit(state.copyWith(renderEventsStatus: BlocStatus.success()));

      return;
    } catch (e) {
      emit(state.copyWith(
          renderEventsStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  Future<void> rescheduleDate(
    RescheduleDateParams rescheduleDateParams, {
    void Function(String)? onSuccess,
  }) async {
    emit(state.copyWith(rescheduleDateStatus: BlocStatus.loading()));

    final result = await _rescheduleDateUsecase(rescheduleDateParams);
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
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
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(changeDateToDoneStatus: BlocStatus.fail(error: l)));
      onFail?.call(l);
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(changeDateToDoneStatus: BlocStatus.success()));
    });
  }

  Future<void> confirmVisitDate(
      ConfirmVisitDateParams confirmVisitDateParams) async {
    emit(state.copyWith(confirmVisitDateStatus: BlocStatus.loading()));

    final result = await _confirmVisitDateUsecase(confirmVisitDateParams);
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(confirmVisitDateStatus: BlocStatus.fail(error: l)));
    }, (r) {
      emit(state.copyWith(confirmVisitDateStatus: BlocStatus.success()));
      pageVariables.changeItemLocal(r.message!);
    });
  }

  Future<void> startDateVisit(
      ConfirmVisitDateParams confirmVisitDateParams, String editItemId) async {
    emit(state.copyWith(
        startDateVisitStatus: BlocStatus.loading(), editItemId: editItemId));

    final result = await _startDateVisitStatusUsecase(confirmVisitDateParams);
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(startDateVisitStatus: BlocStatus.fail(error: l)));
    }, (r) {
      emit(state.copyWith(startDateVisitStatus: BlocStatus.success()));
      pageVariables.changeItemLocal(r.message!);
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
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(cancelScheduleStatus: BlocStatus.fail(error: l)));
      onFail?.call(l);
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(cancelScheduleStatus: BlocStatus.success()));
    });
  }

  Future<void> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams reOpenEventParams, {
    void Function(EventModel)? onSuccess,
  }) async {
    emit(state.copyWith(reOpenEventStatus: BlocStatus.loading()));

    final result = await _returnScheduleVisitToOpenUsecase(reOpenEventParams);
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(reOpenEventStatus: BlocStatus.fail(error: l)));
    }, (r) {
      onSuccess?.call(r.data);
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
      if (AppConstants.shouldReturnEarly(l)) return;
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
      if (AppConstants.shouldReturnEarly(l)) return;
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
      if (AppConstants.shouldReturnEarly(l)) return;
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

  void getCancelReasons() async {
    emit(state.copyWith(getCancelReasonsStatus: BlocStatus.loading()));

    final result = await _getCancelReasonsUsecase(GetCancelReasonsParams());
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(
        getCancelReasonsStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      emit(state.copyWith(
        getCancelReasonsStatus: BlocStatus.success(data: r.data),
      ));
    });
  }
}
