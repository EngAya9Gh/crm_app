import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/exceeded_clients_page_variables_entity.dart';
import '../../domain/entities/filter_exceeded_clients_entity.dart';
import '../../domain/use_cases/exceeded_clients_use_case.dart';
import '../../domain/use_cases/transfer_exceeded_clients_use_case.dart';

part 'exceeded_clients_state.dart';

@injectable
class ExceededClientsCubit extends Cubit<ExceededClientsState> {
  final ExceededClientsUseCase _getExceededClientsUseCase;
  final TransferExceededClientsUseCase _transferExceededClientsUseCase;

  ExceededClientsCubit(
    this._getExceededClientsUseCase,
    this._transferExceededClientsUseCase,
  ) : super(ExceededClientsState());

  ExceededClientsPageVariablesEntity pageVariables =
      ExceededClientsPageVariablesEntity();
  FilterExceededClientsEntity filterEntity = FilterExceededClientsEntity();

  void init() {
    pageVariables = ExceededClientsPageVariablesEntity();
    filterEntity = FilterExceededClientsEntity();
  }

  Future<void> getExceededClients({
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

  Future<void> transferExceededClients() async {
    emit(state.copyWith(transferExceededClientsStatus: BlocStatus.loading()));
    final result = await _transferExceededClientsUseCase(
      TransferExceededClientsParams(
        clientsIds: pageVariables.selectedClientsForTransfer,
      ),
    );

    result.fold(
      (e) {
        emit(state.copyWith(
          transferExceededClientsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) async {
        _locallyUpdateClientsList();
        pageVariables.selectedClientsForTransfer.clear();
        emit(state.copyWith(
          transferExceededClientsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  _locallyUpdateClientsList() {
    pageVariables.allClientsList.removeWhere(
      (element) => pageVariables.selectedClientsForTransfer.contains(element),
    );
    filterClientLocally();
  }

  void selectClient(ClientModel client) {
    if (pageVariables.selectedClientsForTransfer.contains(client)) {
      pageVariables.selectedClientsForTransfer.remove(client);
    } else {
      pageVariables.selectedClientsForTransfer.add(client);
    }
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
