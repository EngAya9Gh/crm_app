import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/clients_transfer_approvals_page_vars_entity.dart';
import '../../domain/entities/filter_clients_transfer_approvals_entity.dart';
import '../../domain/use_cases/get_clients_transfer_approvals_usecase.dart';

part 'clients_transfer_approvals_state.dart';

@injectable
class ClientsTransferApprovalsCubit
    extends Cubit<ClientsTransferApprovalsState> {
  final GetClientsTransferApprovalsUsecase _getClientsTransferApprovalsUsecase;

  ClientsTransferApprovalsCubit(
    this._getClientsTransferApprovalsUsecase,
  ) : super(ClientsTransferApprovalsState());

  ClientsTransferApprovalsPageVarsEntity pageVariables =
      ClientsTransferApprovalsPageVarsEntity();
  FilterClientsTransferApprovalsEntity filterEntity =
      FilterClientsTransferApprovalsEntity();

  void init() {
    pageVariables = ClientsTransferApprovalsPageVarsEntity();
    filterEntity = FilterClientsTransferApprovalsEntity();
  }

  Future<void> getClientsTransferApprovals({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getClientsTransferApprovalsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getClientsTransferApprovalsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getClientsTransferApprovalsUsecase(
          GetClientsTransferApprovalsParams(),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getClientsTransferApprovalsStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterClientsTransferApprovals();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getClientsTransferApprovalsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getClientsTransferApprovalsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_clients_transfer_approvals',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterClientsTransferApprovals() {
    emit(state.copyWith(
      filterClientsTransferApprovalsStatus: BlocStatus.loading(),
    ));
    if (pageVariables.searchController.text.isEmpty) {
      pageVariables.filteredList = List.from(pageVariables.allList);
    } else {
      _searchLocallyImpl();
    }
    emit(state.copyWith(
      filterClientsTransferApprovalsStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    pageVariables.filteredList =
        List<ClientModel>.from(pageVariables.allList.where((element) {
      return element.searchString(pageVariables.searchController.text);
    }));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
