import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/delay_after_install_page_variables_entity.dart';
import '../../domain/entities/filter_delay_after_install_entity.dart';
import '../../domain/use_cases/get_delay_after_install_use_case.dart';

part 'delay_after_install_state.dart';

@injectable
class DelayAfterInstallCubit extends Cubit<DelayAfterInstallState> {
  final GetDelayAfterInstallUseCase _getDelayAfterInstallUsecase;

  DelayAfterInstallCubit(
    this._getDelayAfterInstallUsecase,
  ) : super(DelayAfterInstallState());

  DelayAfterInstallPageVariablesEntity pageVariables =
      DelayAfterInstallPageVariablesEntity();
  FilterDelayAfterInstallEntity filterEntity = FilterDelayAfterInstallEntity();

  void init() {
    pageVariables = DelayAfterInstallPageVariablesEntity();
    filterEntity = FilterDelayAfterInstallEntity();
  }

  Future<void> getDelayAfterInstall({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getDelayAfterInstallStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getDelayAfterInstallStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getDelayAfterInstallUsecase(
          GetDelayAfterInstallParams(
            fkCountry: fkCountry,
            type: 'date',
            employee: filterEntity.employeeNotifier.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getDelayAfterInstallStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterDelayAfterInstall();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getDelayAfterInstallStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getDelayAfterInstallStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_delay_after_install',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterDelayAfterInstall() {
    emit(state.copyWith(
      locallyFilterDelayAfterInstallStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      locallyFilterDelayAfterInstallStatus: BlocStatus.success(),
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
