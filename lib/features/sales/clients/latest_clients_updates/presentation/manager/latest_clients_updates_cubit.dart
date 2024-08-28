import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_latest_updates_entity.dart';
import '../../domain/entities/latest_updates_page_variables_entity.dart';
import '../../domain/use_cases/get_latest_clients_comments_usecase.dart';

part 'latest_clients_updates_state.dart';

@injectable
class LatestClientsUpdatesCubit extends Cubit<LatestClientsUpdatesState> {
  final GetLatestClientsUseCase _getLatestClientsUseCase;

  LatestClientsUpdatesCubit(
    this._getLatestClientsUseCase,
  ) : super(LatestClientsUpdatesState());

  LatestUpdatesPageVariablesEntity pageVariables =
      LatestUpdatesPageVariablesEntity();
  FilterLatestUpdatesEntity filterEntity = FilterLatestUpdatesEntity();

  void init({
    required String fkCountry,
    required bool isMarketing,
  }) {
    filterEntity = FilterLatestUpdatesEntity()
      ..isMarketingNotifier.value = isMarketing;
    pageVariables = LatestUpdatesPageVariablesEntity()..fkCountry = fkCountry;
  }

  Future<void> getLatestClients({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getLatestClientsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.latestUpdates.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getLatestClientsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getLatestClientsUseCase(
          _getLatestClientsParams(),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getLatestClientsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.latestUpdates.addAll(value.data);
            pageVariables.totalClientsCount = value.count ?? 0;
            emit(state.copyWith(
              getLatestClientsStatus: BlocStatus.success(
                data: value.data.isEmpty,
              ),
            ));
          },
        );
      },
      tag: 'search_latest_clients',
      isDebounced: isDebounced,
    );
  }

  GetLatestClientsParams _getLatestClientsParams() {
    return GetLatestClientsParams(
      fkCountry: pageVariables.fkCountry,
      filter: pageVariables.searchController.text,
      fkRegion: filterEntity.fkRegionNotifier.value?.branchId,
      skip: pageVariables.latestUpdates.length,
      isMarketing: filterEntity.isMarketingNotifier.value ? '1' : null,
      typeClient: filterEntity.typeClientNotifier.value?.value,
      fkUser: filterEntity.fkUserNotifier.value?.id,
      ageFrom: filterEntity.ageFromController.text,
      ageTo: filterEntity.ageToController.text,
      from: filterEntity.dateFromController.text,
      to: filterEntity.dateToController.text,
      order: pageVariables.sortAscending ? 'asc' : 'desc',
      commentsState: filterEntity.commentsNotifier.value,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }

  void sortLatestClients() {
    pageVariables.sortAscending = !pageVariables.sortAscending;
    getLatestClients(isNewFilter: true);
  }
}
