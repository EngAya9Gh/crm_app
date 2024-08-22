import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_periodic_communication_entity.dart';
import '../../domain/entities/periodic_communication_page_variables_entity.dart';
import '../../domain/filters/filter_strategy.dart';
import '../../domain/use_cases/get_periodic_communication_use_case.dart';

part 'periodic_communication_state.dart';

@injectable
class PeriodicCommunicationCubit extends Cubit<PeriodicCommunicationState> {
  final GetPeriodicCommunicationUseCase _getPeriodicCommunicationUsecase;

  PeriodicCommunicationCubit(
    this._getPeriodicCommunicationUsecase,
  ) : super(PeriodicCommunicationState());

  PeriodicCommunicationPageVariablesEntity pageVariables =
      PeriodicCommunicationPageVariablesEntity();
  FilterPeriodicCommunicationEntity filterEntity =
      FilterPeriodicCommunicationEntity();

  void init(String idUser) {
    pageVariables = PeriodicCommunicationPageVariablesEntity();
    filterEntity = FilterPeriodicCommunicationEntity();
  }

  Future<void> getPeriodicCommunication({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getPeriodicCommunicationStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPeriodicCommunicationUsecase(
          GetPeriodicCommunicationParams(
            fkCountry: fkCountry,
            periodicCommunicationType: pageVariables.periodicCommunicationType,
            fkUser: filterEntity.userIdNotifier.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
            rate: filterEntity.rateNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getPeriodicCommunicationStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            localfilter();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getPeriodicCommunicationStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getPeriodicCommunicationStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_periodic_Communication',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void localfilter() {
    emit(state.copyWith(
      filterPeriodicCommunicationStatus: BlocStatus.loading(),
    ));
    _searchLocallyImpl();
    emit(state.copyWith(
      filterPeriodicCommunicationStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    final strategies = [
      SearchQueryFilter(pageVariables.searchController.text),
    ];

    pageVariables.filteredList = pageVariables.allList.where((element) {
      return strategies.every((strategy) => strategy.apply(element));
    }).toList();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
