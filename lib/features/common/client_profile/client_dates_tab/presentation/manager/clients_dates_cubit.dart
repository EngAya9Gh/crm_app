import 'dart:async';
import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../data/models/client_date_model.dart';
import '../../domain/entities/clients_dates_page_varialbe_entity.dart';
import '../../domain/use_cases/get_all_clients_dates_usecase.dart';

part 'clients_dates_state.dart';

@injectable
class ClientsDatesCubit extends Cubit<ClientsDatesState> {
  final GetAllClientsDatesUseCase _getAllClientsDatesUseCase;

  ClientsDatesPageVariablesEntity pageVariables = ClientsDatesPageVariablesEntity();

  ClientsDatesCubit(this._getAllClientsDatesUseCase) : super(ClientsDatesState());

  void init() {
    pageVariables = ClientsDatesPageVariablesEntity();
    pageVariables.clear();
    loadCalendarData();
  }

  FutureOr<void> getAllClientsDates({
    required String clientId,
  }) async {
    if (state.getAllClientsDatesStatus.isLoading()) return;

    emit(state.copyWith(getAllClientsDatesStatus: BlocStatus.loading()));

    final params = GetAllClientsDatesParams(clientId: clientId);

    try {
      pageVariables.allList = [];
      pageVariables.totalCount = 0;
      final response = await _getAllClientsDatesUseCase(params);
      pageVariables.totalCount = response.count ?? 0;
      List<ClientDateModel> newList = List<ClientDateModel>.from(pageVariables.allList);
      newList = response.message ?? [];
      pageVariables.allList = newList;
      loadCalendarData();
      loadEventDataSource(newList);
      pageVariables.hasReachedEnd = true;

      if (pageVariables.allList.isEmpty) {
        emit(state.copyWith(
          getAllClientsDatesStatus: BlocStatus.empty(),
        ));
      } else {
        emit(state.copyWith(
          getAllClientsDatesStatus: BlocStatus.success(),
          clientDates: pageVariables.allList,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getAllClientsDatesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }

  void loadCalendarData() {
    emit(state.copyWith(getAllClientsDatesStatus: BlocStatus.loading()));
    pageVariables.loadCalendarData();
    emit(state.copyWith(getAllClientsDatesStatus: BlocStatus.success()));
  }

  void refreshUi({BlocStatus? status}) {
    if (status == null) {
      return emit(state.copyWith(refreshUi: state.refreshUi + 1));
    }
    emit(state.copyWith(renderEventsStatus: status, refreshUi: state.refreshUi + 1));
  }

  static int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void loadEventDataSource(List<ClientDateModel> newList) {
    emit(state.copyWith(getAllClientsDatesStatus: BlocStatus.loading()));

    pageVariables.eventDataSource = LinkedHashMap<DateTime, List<ClientDateModel>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    )..addAll(Map<DateTime, List<ClientDateModel>>.fromIterable(
        newList,
        key: (item) => (item as ClientDateModel).dateClientVisit!,
        value: (item) => newList.where((element) {
          return isSameDay((item as ClientDateModel).dateClientVisit, element.dateClientVisit);
        }).toList(),
      ));
    _handleSelectedDayEvents();

    emit(state.copyWith(getAllClientsDatesStatus: BlocStatus.success()));
  }

  void _handleSelectedDayEvents() {
    if (pageVariables.selectedDay == null) {
      pageVariables.selectedDayEvents.value = pageVariables.allList;
      return;
    }
    pageVariables.selectedDayEvents.value = List.from(
      pageVariables.allList.where((element) {
        return isSameDay(element.dateClientVisit, pageVariables.selectedDay);
      }),
    );
  }
}
