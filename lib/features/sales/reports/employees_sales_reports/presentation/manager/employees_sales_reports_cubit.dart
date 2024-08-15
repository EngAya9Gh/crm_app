import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/entities/employees_sales_reports_page_variables_entity.dart';
import '../../domain/entities/filter_employees_sales_reports_entity.dart';
import '../../domain/use_cases/get_employees_sales_reports_usecase.dart';

part 'employees_sales_reports_state.dart';

@injectable
class EmployeesSalesReportsCubit extends Cubit<EmployeesSalesReportsState> {
  final GetEmployeesSalesReportsUsecase _getEmployeesSalesReportsUsecase;

  EmployeesSalesReportsCubit(
    this._getEmployeesSalesReportsUsecase,
  ) : super(EmployeesSalesReportsState());

  EmployeesSalesReportsPageVariablesEntity pageVariables =
      EmployeesSalesReportsPageVariablesEntity();
  FilterEmployeesSalesReportsEntity filterEntity =
      FilterEmployeesSalesReportsEntity();

  void init() {
    pageVariables = EmployeesSalesReportsPageVariablesEntity();
    filterEntity = FilterEmployeesSalesReportsEntity();
  }

  Future<void> getEmployeesSalesReports() async {
    if (state.getEmployeesSalesReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getEmployeesSalesReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getEmployeesSalesReportsUsecase(
      GetEmployeesSalesReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        typeProduct: filterEntity.productTypeNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getEmployeesSalesReportsStatus: BlocStatus.fail(error: e),
      )),
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getEmployeesSalesReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getEmployeesSalesReportsStatus: BlocStatus.success(),
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
