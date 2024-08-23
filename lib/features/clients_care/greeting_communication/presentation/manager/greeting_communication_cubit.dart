import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_greeting_communication_entity.dart';
import '../../domain/entities/greeting_communication_page_variables_entity.dart';
import '../../domain/filters/filter_strategy.dart';
import '../../domain/use_cases/get_greeting_communication_use_case.dart';

part 'greeting_communication_state.dart';

@injectable
class GreetingCommunicationCubit extends Cubit<GreetingCommunicationState> {
  final GetGreetingCommunicationUseCase _getGreetingCommunicationUsecase;

  GreetingCommunicationCubit(
    this._getGreetingCommunicationUsecase,
  ) : super(GreetingCommunicationState());

  GreetingCommunicationPageVariablesEntity pageVariables =
      GreetingCommunicationPageVariablesEntity();
  FilterGreetingCommunicationEntity filterEntity =
      FilterGreetingCommunicationEntity();

  void init(String idUser) {
    pageVariables = GreetingCommunicationPageVariablesEntity();
    filterEntity = FilterGreetingCommunicationEntity();
  }

  Future<void> getGreetingCommunication({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getGreetingCommunicationStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getGreetingCommunicationStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getGreetingCommunicationUsecase(
          GetGreetingCommunicationParams(
            fkCountry: fkCountry,
            type: "ترحيب",
            fkUser: filterEntity.userIdNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getGreetingCommunicationStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            localFilter();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getGreetingCommunicationStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getGreetingCommunicationStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_greeting_communication',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void localFilter() {
    emit(state.copyWith(
      filterGreetingCommunicationStatus: BlocStatus.loading(),
    ));
    _searchLocallyImpl();
    emit(state.copyWith(
      filterGreetingCommunicationStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    final strategies = [
      SearchQueryFilter(pageVariables.searchController.text),
      RegionFilter(filterEntity.regionIdNotifier.value?.branchId),
      StatusFilter(filterEntity.statusNotifier.value),
    ];

    pageVariables.filteredList = pageVariables.allList.where((element) {
      return strategies.every((strategy) => strategy.apply(element));
    }).toList();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
