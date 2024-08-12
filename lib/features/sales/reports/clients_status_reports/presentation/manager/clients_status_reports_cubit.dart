import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/entities/clients_status_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_status_reports_entity.dart';
import '../../domain/use_cases/get_clients_status_reports_usecase.dart';

part 'clients_status_reports_state.dart';

@injectable
class ClientsStatusReportsCubit extends Cubit<ClientsStatusReportsState> {
  final GetClientsStatusReportsUsecase _getClientsStatusReportsUsecase;

  ClientsStatusReportsCubit(
    this._getClientsStatusReportsUsecase,
  ) : super(ClientsStatusReportsState());

  ClientsStatusReportsPageVariablesEntity pageVariables =
      ClientsStatusReportsPageVariablesEntity();
  FilterClientsStatusReportsEntity filterEntity =
      FilterClientsStatusReportsEntity();

  void init() {
    pageVariables = ClientsStatusReportsPageVariablesEntity();
    filterEntity = FilterClientsStatusReportsEntity();
  }

  Future<void> getClientsStatusReports() async {
    if (state.getClientsStatusReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsStatusReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsStatusReportsUsecase(
      GetClientsStatusReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        typeProduct: filterEntity.productTypeNotifier.value,
        region: filterEntity.regionNotifier.value,
        user: filterEntity.userNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getClientsStatusReportsStatus: BlocStatus.fail(error: e),
      )),
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getClientsStatusReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getClientsStatusReportsStatus: BlocStatus.success(),
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
