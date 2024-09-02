import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../domain/entities/client_logs_page_variables_entity.dart';
import '../../../domain/entities/filter_client_logs_entity.dart';
import '../../../domain/use_cases/get_client_logs_usecase.dart';

part 'client_logs_tab_state.dart';

@injectable
class ClientLogsTabCubit extends Cubit<ClientLogsTabState> {
  final GetClientLogsUsecase _getClientLogsUsecase;

  ClientLogsPageVariablesEntity pageVariables = ClientLogsPageVariablesEntity();
  FilterClientLogsEntity filterEntity = FilterClientLogsEntity();

  ClientLogsTabCubit(
    this._getClientLogsUsecase,
  ) : super(ClientLogsTabState());

  void init() {
    pageVariables = ClientLogsPageVariablesEntity();
    filterEntity = FilterClientLogsEntity();
  }

  Future<void> getClientLogs(
    String idClient, {
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getClientLogsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getClientLogsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getClientLogsUsecase(
          GetClientLogsParams(
            skip: pageVariables.allList.length,
            idClient: idClient,
            filter: pageVariables.searchController.text,
            from: filterEntity.dateFromController.text,
            to: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getClientLogsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd =
                value.data.length < AppConstants.kPerPage;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getClientLogsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getClientLogsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_support_clients_accept',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
