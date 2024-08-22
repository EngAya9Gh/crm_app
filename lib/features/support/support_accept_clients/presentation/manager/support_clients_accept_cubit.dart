import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/clients_support_accept_page_variables_entity.dart';
import '../../domain/entities/filter_support_clients_accept_entity.dart';
import '../../domain/use_cases/get_support_clients_accept_use_case.dart';

part 'support_clients_accept_state.dart';

@injectable
class SupportClientsAcceptCubit extends Cubit<SupportClientsAcceptState> {
  final GetSupportClientsAcceptUseCase _getSupportClientsAcceptUseCase;

  SupportClientsAcceptCubit(
    this._getSupportClientsAcceptUseCase,
  ) : super(SupportClientsAcceptState());

  ClientsSupportAcceptPageVariablesEntity pageVariables =
      ClientsSupportAcceptPageVariablesEntity();
  FilterSupportClientsAcceptEntity filterSupportClientsAcceptEntity =
      FilterSupportClientsAcceptEntity();

  void init() {
    pageVariables = ClientsSupportAcceptPageVariablesEntity();
    filterSupportClientsAcceptEntity = FilterSupportClientsAcceptEntity();
  }

  Future<void> getSupportClientsAccept({
    required String fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getClientsAcceptStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getClientsAcceptStatus: BlocStatus.loading()));
        filterSupportClientsAcceptEntity.savePreviousState();
        final result = await _getSupportClientsAcceptUseCase(
          GetSupportClientsAcceptParams(
            fkCountry: fkCountry,
            mainCitiesIds:
                filterSupportClientsAcceptEntity.fkMainCitiesNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getClientsAcceptStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalClientsCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterClientLocally();
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getClientsAcceptStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getClientsAcceptStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_support_clients_accept',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterClientLocally() {
    emit(state.copyWith(
      locallyFilterClientsAcceptStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredClientsList = pageVariables.allList;
    } else {
      pageVariables.filteredClientsList = pageVariables.allList.where(
        (element) {
          return element.searchString(pageVariables.searchController.text);
        },
      ).toList();
    }
    emit(state.copyWith(
      locallyFilterClientsAcceptStatus: BlocStatus.success(),
    ));
  }

  void returnToPreviousState() {
    filterSupportClientsAcceptEntity =
        filterSupportClientsAcceptEntity.returnToPreviousState;
  }
}
