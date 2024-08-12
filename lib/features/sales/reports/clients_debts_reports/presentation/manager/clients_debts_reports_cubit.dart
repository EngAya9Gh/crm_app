import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/entities/clients_debts_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_debts_reports_entity.dart';
import '../../domain/use_cases/get_clients_debts_reports_usecase.dart';

part 'clients_debts_reports_state.dart';

@injectable
class ClientsDebtsReportsCubit extends Cubit<ClientsDebtsReportsState> {
  final GetClientsDebtsReportsUsecase _getClientsDebtsReportsUsecase;

  ClientsDebtsReportsCubit(
    this._getClientsDebtsReportsUsecase,
  ) : super(ClientsDebtsReportsState());

  ClientsDebtsReportsPageVariablesEntity pageVariables =
      ClientsDebtsReportsPageVariablesEntity();
  FilterClientsDebtsReportsEntity filterEntity =
      FilterClientsDebtsReportsEntity();

  void init() {
    pageVariables = ClientsDebtsReportsPageVariablesEntity();
    filterEntity = FilterClientsDebtsReportsEntity();
  }

  Future<void> getClientDebtsReports() async {
    if (state.getClientsDebtsReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsDebtsReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsDebtsReportsUsecase(
      GetClientsDebtsReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        region: filterEntity.regionNotifier.value,
        user: filterEntity.userNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getClientsDebtsReportsStatus: BlocStatus.fail(error: e),
      )),
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getClientsDebtsReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getClientsDebtsReportsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  void _clear() {
    pageVariables.allList.clear();
    pageVariables.totalValue = 0;
    pageVariables.dataRows.clear();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
