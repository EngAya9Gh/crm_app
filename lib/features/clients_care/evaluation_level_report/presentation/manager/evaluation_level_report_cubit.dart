import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/evaluation_level_report_page_variables_entity.dart';
import '../../domain/entities/filter_evaluation_level_report_entity.dart';
import '../../domain/filters/filter_strategy.dart';
import '../../domain/use_cases/get_evaluation_level_report_usecase.dart';

part 'evaluation_level_report_state.dart';

@injectable
class EvaluationLevelReportCubit extends Cubit<EvaluationLevelReportState> {
  final GetEvaluationLevelReportUsecase _getPeriodicCommunicationUsecase;

  EvaluationLevelReportCubit(
    this._getPeriodicCommunicationUsecase,
  ) : super(EvaluationLevelReportState());

  EvaluationLevelReportPageVariablesEntity pageVariables =
      EvaluationLevelReportPageVariablesEntity();
  FilterEvaluationLevelReportEntity filterEntity =
      FilterEvaluationLevelReportEntity();

  void init(String idUser) {
    pageVariables = EvaluationLevelReportPageVariablesEntity();
    filterEntity = FilterEvaluationLevelReportEntity();
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
            getEvaluationLevelReportStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPeriodicCommunicationUsecase(
          GetEvaluationLevelReportParams(
            fkCountry: fkCountry,
            periodicCommunicationType: pageVariables.periodicCommunicationType,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
            rate: filterEntity.rateNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (e == AppConstants.canceledByUserError) return;
            emit(state.copyWith(
              getEvaluationLevelReportStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            localfilter();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getEvaluationLevelReportStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getEvaluationLevelReportStatus: BlocStatus.success(),
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
