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
  FilterClientsAcceptEntity filterClientsAcceptEntity =
      FilterClientsAcceptEntity();

  void init() {
    pageVariables = ClientsAcceptPageVariablesEntity();
    filterClientsAcceptEntity = FilterClientsAcceptEntity();
  }

  Future<void> getClientsAccept({
    required fkCountry,
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getClientsAcceptStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.clientsList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getClientsAcceptStatus: BlocStatus.loading()));
        filterClientsAcceptEntity.savePreviousState();
        final result = await _getClientsAcceptUseCase(
          GetClientsAcceptParams(
            fkCountry: fkCountry,
            filter: pageVariables.searchController.text,
            fkRegion:
                filterClientsAcceptEntity.fkRegionNotifier.value?.regionId,
            skip: pageVariables.clientsList.length,
          ),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getClientsAcceptStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.clientsList.addAll(value.data);
            pageVariables.totalClientsCount = value.count ?? 0;
            emit(state.copyWith(
              getClientsAcceptStatus: BlocStatus.success(
                data: value.data.isEmpty,
              ),
            ));
          },
        );
      },
      tag: 'search_clients_accept',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void returnToPreviousState() {
    filterClientsAcceptEntity = filterClientsAcceptEntity.returnToPreviousState;
  }
}
