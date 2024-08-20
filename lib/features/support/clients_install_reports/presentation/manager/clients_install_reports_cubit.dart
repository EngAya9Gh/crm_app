import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/clients_install_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_install_reports_entity.dart';
import '../../domain/use_cases/get_clients_install_reports_usecase.dart';

part 'clients_install_reports_state.dart';

@injectable
class ClientsInstallReportsCubit extends Cubit<ClientsInstallReportsState> {
  final GetClientsInstallReportsUsecase _getClientsInstallReportsUsecase;

  ClientsInstallReportsCubit(
    this._getClientsInstallReportsUsecase,
  ) : super(ClientsInstallReportsState());

  ClientsInstallReportsPageVariablesEntity pageVariables =
      ClientsInstallReportsPageVariablesEntity();
  FilterClientsInstallReportsEntity filterEntity =
      FilterClientsInstallReportsEntity();

  void init() {
    pageVariables = ClientsInstallReportsPageVariablesEntity();
    filterEntity = FilterClientsInstallReportsEntity();
  }

  Future<void> getClientsInstallReports() async {
    if (state.getClientsInstallReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsInstallReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsInstallReportsUsecase(
      GetClientsInstallReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(
          getClientsInstallReportsStatus: BlocStatus.fail(error: error),
        ));
      },
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getClientsInstallReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getClientsInstallReportsStatus: BlocStatus.success(),
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
