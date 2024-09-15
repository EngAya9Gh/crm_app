import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/delay_install_reports_page_variables_entity.dart';
import '../../domain/entities/filter_delay_install_reports_entity.dart';
import '../../domain/use_cases/get_delay_install_reports_use_case.dart';

part 'delay_install_reports_state.dart';

@injectable
class DelayInstallReportsCubit extends Cubit<DelayInstallReportsState> {
  final GetDelayInstallReportsUseCase _getDelayInstallReportsUsecase;

  DelayInstallReportsCubit(
    this._getDelayInstallReportsUsecase,
  ) : super(DelayInstallReportsState());

  DelayInstallReportsPageVariablesEntity pageVariables =
      DelayInstallReportsPageVariablesEntity();
  FilterDelayInstallReportsEntity filterEntity =
      FilterDelayInstallReportsEntity();

  void init() {
    pageVariables = DelayInstallReportsPageVariablesEntity();
    filterEntity = FilterDelayInstallReportsEntity();
  }

  Future<void> getDelayInstallReports({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getDelayInstallReportsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(
            state.copyWith(getDelayInstallReportsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getDelayInstallReportsUsecase(
          GetDelayInstallReportsParams(
            fkCountry: AppConstants.currentCountry,
            type: 'userSum',
            employee: filterEntity.employeeNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getDelayInstallReportsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterReportsLocally();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getDelayInstallReportsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getDelayInstallReportsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_delay_install_reports',
      isDebounced: isDebounced,
    );
  }

  void filterReportsLocally() {
    emit(state.copyWith(
      locallyFilterDelayInstallReportsStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      locallyFilterDelayInstallReportsStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    pageVariables.filteredList.clear();
    for (var i = 0; i < pageVariables.allList.length; i++) {
      final invoice = pageVariables.allList[i];
      final String searchIn =
          "${invoice.name_enterprise} ${invoice.nameClient} ${invoice.mobile}";
      if (searchIn
          .toLowerCase()
          .contains(pageVariables.searchController.text.toLowerCase())) {
        pageVariables.filteredList.add(invoice);
      }
    }
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
