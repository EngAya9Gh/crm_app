import 'package:crm_smart/model/usermodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../domain/entities/clients_status_reports_page_variables_entity.dart';
import '../../domain/entities/filter_clients_status_reports_entity.dart';
import '../../domain/use_cases/get_clients_status_reports_usecase.dart';

part 'clients_status_reports_state.dart';

@injectable
class ClientsStatusReportsCubit extends Cubit<ClientsStatusReportsState>
    with HydratedMixin {
  final GetClientsStatusReportsUsecase _getClientsStatusReportsUsecase;

  ClientsStatusReportsCubit(
    this._getClientsStatusReportsUsecase,
  ) : super(ClientsStatusReportsState()) {
    hydrate();
  }

  ClientsStatusReportsPageVariablesEntity pageVariables =
      ClientsStatusReportsPageVariablesEntity();
  FilterClientsStatusReportsEntity filterEntity =
      FilterClientsStatusReportsEntity();

  void init() {
    pageVariables = ClientsStatusReportsPageVariablesEntity();
  }

  Future<void> getClientsStatusReports() async {
    if (state.getClientsStatusReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getClientsStatusReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getClientsStatusReportsUsecase(
      GetClientsStatusReportsParams(
        type: filterEntity.reportTypeNotifier.value,
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

  @override
  ClientsStatusReportsState? fromJson(Map<String, dynamic> json) {
    print("json is => ${json}");
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.clientsStatusReportsCubit.reportTypeNotifierValue],
      );
      filterEntity.setPeriodTypeNotifierValue = PeriodTypeEnum.fromString(
        json[AppStrings.clientsStatusReportsCubit.periodTypeNotifierValue],
      );
      if (json[AppStrings.clientsStatusReportsCubit.regionNotifierValue] !=
          null) {
        filterEntity.setRegionNotifierValue = RegionModel.fromJson(
            json[AppStrings.clientsStatusReportsCubit.regionNotifierValue]);
      }
      if (json[AppStrings.clientsStatusReportsCubit.userNotifierValue] !=
          null) {
        filterEntity.setUserNotifierValue = UserModel.fromJson(
            json[AppStrings.clientsStatusReportsCubit.userNotifierValue]);
      }
      filterEntity.setIsMarketingNotifierValue =
          json[AppStrings.clientsStatusReportsCubit.isMarketingNotifierValue];
      filterEntity.dateFromController.text =
          json[AppStrings.clientsStatusReportsCubit.dateFromControllerText];
      filterEntity.dateToController.text =
          json[AppStrings.clientsStatusReportsCubit.dateToControllerText];
      return state;
    } catch (e) {
      debugPrint("error is => ${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ClientsStatusReportsState state) {
    return {
      AppStrings.clientsStatusReportsCubit.reportTypeNotifierValue:
          filterEntity.reportTypeNotifier.value.name,
      AppStrings.clientsStatusReportsCubit.periodTypeNotifierValue:
          filterEntity.periodTypeNotifier.value?.name,
      AppStrings.clientsStatusReportsCubit.regionNotifierValue:
          filterEntity.regionNotifier.value?.toJson(),
      AppStrings.clientsStatusReportsCubit.userNotifierValue:
          filterEntity.userNotifier.value?.toJson(),
      AppStrings.clientsStatusReportsCubit.isMarketingNotifierValue:
          filterEntity.isMarketingNotifier.value,
      AppStrings.clientsStatusReportsCubit.dateFromControllerText:
          filterEntity.dateFromController.text,
      AppStrings.clientsStatusReportsCubit.dateToControllerText:
          filterEntity.dateToController.text,
    };
  }
}
