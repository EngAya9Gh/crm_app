import 'package:bloc/bloc.dart';
import '../../../../../core/common/enums/client/type_client_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
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
  FilterLatestUpdatesEntity filterLatestUpdatesEntity =
      FilterLatestUpdatesEntity();

  void init({
    required String fkCountry,
    required bool isMarketing,
  }) {
    filterLatestUpdatesEntity = FilterLatestUpdatesEntity()
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
        filterLatestUpdatesEntity.savePreviousState();
        final result = await _getLatestClientsUseCase(
          _getLatestClientsParams(),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getLatestClientsStatus: BlocStatus.fail(error: e),
          )),
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
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  GetLatestClientsParams _getLatestClientsParams() {
    return GetLatestClientsParams(
      fkCountry: pageVariables.fkCountry,
      filter: pageVariables.searchController.text,
      fkRegion: filterLatestUpdatesEntity.fkRegionNotifier.value?.regionId,
      skip: pageVariables.latestUpdates.length,
      isMarketing:
          filterLatestUpdatesEntity.isMarketingNotifier.value ? '1' : null,
      typeClient: filterLatestUpdatesEntity.typeClientNotifier.value?.value,
      fkUser: filterLatestUpdatesEntity.fkUserNotifier.value?.id,
      ageFrom: filterLatestUpdatesEntity.ageFromController.text,
      ageTo: filterLatestUpdatesEntity.ageToController.text,
      from: filterLatestUpdatesEntity.dateFromController.text,
      to: filterLatestUpdatesEntity.dateToController.text,
      order: pageVariables.sortAscending ? 'asc' : 'desc',
      commentsState: filterLatestUpdatesEntity.commentsNotifier.value,
    );
  }

  void returnToPreviousState() {
    filterLatestUpdatesEntity = filterLatestUpdatesEntity.returnToPreviousState;
  }

  void sortLatestClients() {
    pageVariables.sortAscending = !pageVariables.sortAscending;
    getLatestClients(isNewFilter: true);
  }
}
