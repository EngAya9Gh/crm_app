import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/clients_accept_page_variables_entity.dart';
import '../../domain/entities/filter_clients_accept_entity.dart';
import '../../domain/use_cases/get_clients_accept_usecase.dart';

part 'clients_accept_state.dart';

@injectable
class ClientsAcceptCubit extends Cubit<ClientsAcceptState> {
  final GetClientsAcceptUseCase _getClientsAcceptUseCase;

  ClientsAcceptCubit(
    this._getClientsAcceptUseCase,
  ) : super(ClientsAcceptState());

  ClientsAcceptPageVariablesEntity pageVariables =
      ClientsAcceptPageVariablesEntity();
  FilterClientsAcceptEntity filterEntity = FilterClientsAcceptEntity();

  void init() {
    pageVariables = ClientsAcceptPageVariablesEntity();
    filterEntity = FilterClientsAcceptEntity();
  }

  Future<void> getClientsAccept({
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
        filterEntity.savePreviousState();
        final result = await _getClientsAcceptUseCase(
          GetClientsAcceptParams(
            skip: pageVariables.allList.length,
            fkCountry: AppConstants.currentCountry,
            filter: pageVariables.searchController.text,
            fkRegion: filterEntity.fkRegionNotifier.value?.branchId,
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
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getClientsAcceptStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(getClientsAcceptStatus: BlocStatus.success()));
          },
        );
      },
      tag: 'search_clients_accept',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
