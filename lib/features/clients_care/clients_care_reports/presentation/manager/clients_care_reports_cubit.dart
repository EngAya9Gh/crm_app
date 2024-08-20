import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';
import '../../domain/entities/clients_care_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_care_reports_entity.dart';
import '../../domain/use_cases/get_clients_care_reports_usecase.dart';

part 'clients_care_reports_state.dart';

@injectable
class ClientsCareReportsCubit extends Cubit<ClientsCareReportsState>
    with HydratedMixin {
  final GetClientsCareReportsUsecase _getClientsCareReportsUsecase;

  ClientsCareReportsCubit(
    this._getClientsCareReportsUsecase,
  ) : super(ClientsCareReportsState()) {
    hydrate();
  }

  ClientsCareReportsPageVariablesEntity pageVariables =
      ClientsCareReportsPageVariablesEntity();
  FilterClientsCareReportsEntity filterEntity =
      FilterClientsCareReportsEntity();

  void init() {
    pageVariables = ClientsCareReportsPageVariablesEntity();
  }

  Future<void> getClientsCareReports() async {
    if (state.getClientsCareReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsCareReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsCareReportsUsecase(
      GetClientsCareReportsParams(
        fkCountry: AppConstants.fkCountry,
        type: filterEntity.reportTypeNotifier.value,
        typeCare: filterEntity.typeCareNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) {
        if (e == AppConstants.canceledByUserError) return;
        emit(state.copyWith(
          getClientsCareReportsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getClientsCareReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getClientsCareReportsStatus: BlocStatus.success(),
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
  ClientsCareReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.clientsCareReportsCubit.reportTypeNotifier],
      );
      filterEntity.setPeriodTypeNotifierValue = PeriodTypeEnum.fromString(
        json[AppStrings.clientsCareReportsCubit.periodTypeNotifier],
      );
      filterEntity.setTypeCareNotifierValue = CareReportTypeEnum.fromString(
        json[AppStrings.clientsCareReportsCubit.careTypeNotifier],
      );
      filterEntity.setDateFromControllerValue =
          json[AppStrings.clientsCareReportsCubit.dateFromController];
      filterEntity.setDateToControllerValue =
          json[AppStrings.clientsCareReportsCubit.dateToController];
      return state;
    } catch (e) {
      debugPrint("error is => ${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ClientsCareReportsState state) {
    return {
      AppStrings.clientsCareReportsCubit.reportTypeNotifier:
          filterEntity.reportTypeNotifier.value.name,
      AppStrings.clientsCareReportsCubit.periodTypeNotifier:
          filterEntity.periodTypeNotifier.value.name,
      AppStrings.clientsCareReportsCubit.careTypeNotifier:
          filterEntity.typeCareNotifier.value?.name,
      AppStrings.clientsCareReportsCubit.dateFromController:
          filterEntity.dateFromController.text,
      AppStrings.clientsCareReportsCubit.dateToController:
          filterEntity.dateToController.text,
    };
  }
}
