import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/exceeded_clients_page_variables_entity.dart';
import '../../domain/entities/filter_exceeded_clients_entity.dart';
import '../../domain/use_cases/exceeded_clients_use_case.dart';

part 'exceeded_clients_state.dart';

@injectable
class ExceededClientsCubit extends Cubit<ExceededClientsState> {
  final ExceededClientsUseCase _getExceededClientsUseCase;

  ExceededClientsCubit(
    this._getExceededClientsUseCase,
  ) : super(ExceededClientsState());

  ExceededClientsPageVariablesEntity pageVariables =
      ExceededClientsPageVariablesEntity();
  FilterExceededClientsEntity filterEntity = FilterExceededClientsEntity();

  void init() {
    pageVariables = ExceededClientsPageVariablesEntity();
    filterEntity = FilterExceededClientsEntity();
  }

  Future<void> getExceededClients({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getExceededClientsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allClientsList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getExceededClientsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getExceededClientsUseCase(
          ExceededClientsParams(
            passLimit: filterEntity.passLimitNotifier.value,
          ),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getExceededClientsStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.allClientsList.addAll(value.data);
            pageVariables.totalClientsCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterClientLocally();
            emit(state.copyWith(
              getExceededClientsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_exceeded_clients',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterClientLocally() {
    emit(state.copyWith(
      locallyFilterExceededClientsStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredClientsList = pageVariables.allClientsList;
    } else {
      pageVariables.filteredClientsList = pageVariables.allClientsList.where(
        (element) {
          return element.searchString(pageVariables.searchController.text);
        },
      ).toList();
    }
    emit(state.copyWith(
      locallyFilterExceededClientsStatus: BlocStatus.success(),
    ));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
