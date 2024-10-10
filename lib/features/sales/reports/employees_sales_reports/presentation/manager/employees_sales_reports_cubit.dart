import 'package:crm_smart/core/common/enums/reports/invoice_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../domain/entities/employees_sales_reports_page_variables_entity.dart';
import '../../domain/entities/filter_employees_sales_reports_entity.dart';
import '../../domain/use_cases/get_employees_sales_reports_usecase.dart';

part 'employees_sales_reports_state.dart';

@injectable
class EmployeesSalesReportsCubit extends Cubit<EmployeesSalesReportsState>
    with HydratedMixin {
  final GetEmployeesSalesReportsUsecase _getEmployeesSalesReportsUsecase;

  EmployeesSalesReportsCubit(
    this._getEmployeesSalesReportsUsecase,
  ) : super(EmployeesSalesReportsState()) {
    hydrate();
  }

  EmployeesSalesReportsPageVariablesEntity pageVariables =
      EmployeesSalesReportsPageVariablesEntity();
  FilterEmployeesSalesReportsEntity filterEntity =
      FilterEmployeesSalesReportsEntity();

  void init() {
    pageVariables = EmployeesSalesReportsPageVariablesEntity();
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
        invoiceType: filterEntity.invoiceTypeNotifier.value
      ),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getEmployeesSalesReportsStatus: BlocStatus.fail(error: e),
        ));
      },
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

  @override
  EmployeesSalesReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.employeesSalesReportsCubit.reportTypeNotifier],
      );
      filterEntity.setPeriodTypeNotifierValue = PeriodTypeEnum.fromString(
        json[AppStrings.employeesSalesReportsCubit.periodTypeNotifier],
      );
      filterEntity.setProductTypeNotifierValue = ProductTypeEnum.fromString(
        json[AppStrings.employeesSalesReportsCubit.productTypeNotifier],
      );
      filterEntity.setInvoiceTypeNotifierValue = InvoiceTypeEnum.fromString(
        json[AppStrings.employeesSalesReportsCubit.invoiceTypeNotifier],
      );
      filterEntity.setIsMarketingNotifierValue =
          json[AppStrings.employeesSalesReportsCubit.isMarketingNotifier];
      filterEntity.setDateFromControllerValue =
          json[AppStrings.employeesSalesReportsCubit.dateFromController];
      filterEntity.setDateToControllerValue =
          json[AppStrings.employeesSalesReportsCubit.dateToController];
      return state;
    } catch (e) {
      debugPrint("error is => ${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(EmployeesSalesReportsState state) {
    return {
      AppStrings.employeesSalesReportsCubit.reportTypeNotifier:
          filterEntity.reportTypeNotifier.value.name,
      AppStrings.employeesSalesReportsCubit.periodTypeNotifier:
          filterEntity.periodTypeNotifier.value.name,
      AppStrings.employeesSalesReportsCubit.productTypeNotifier:
          filterEntity.productTypeNotifier.value?.name,
      AppStrings.employeesSalesReportsCubit.invoiceTypeNotifier:
          filterEntity.invoiceTypeNotifier.value?.name,
      AppStrings.employeesSalesReportsCubit.isMarketingNotifier:
          filterEntity.isMarketingNotifier.value,
      AppStrings.employeesSalesReportsCubit.dateFromController:
          filterEntity.dateFromController.text,
      AppStrings.employeesSalesReportsCubit.dateToController:
          filterEntity.dateToController.text,
    };
  }
}
