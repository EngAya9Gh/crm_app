import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../domain/entities/filter_periodic_communication_reports_entity.dart';
import '../../domain/entities/periodic_communication_reports_page_variables_entity.dart';
import '../../domain/use_cases/get_periodic_communication_reports_usecase.dart';

part 'periodic_communication_reports_state.dart';

@injectable
class PeriodicCommunicationReportsCubit
    extends Cubit<PeriodicCommunicationReportsState> with HydratedMixin {
  final GetPeriodicCommunicationReportsUsecase
      _getPeriodicCommunicationReportsUsecase;

  PeriodicCommunicationReportsCubit(
    this._getPeriodicCommunicationReportsUsecase,
  ) : super(PeriodicCommunicationReportsState()) {
    hydrate();
  }

  PeriodicCommunicationReportsPageVariablesEntity pageVariables =
      PeriodicCommunicationReportsPageVariablesEntity();
  FilterPeriodicCommunicationReportsEntity filterEntity =
      FilterPeriodicCommunicationReportsEntity();

  void init() {
    pageVariables = PeriodicCommunicationReportsPageVariablesEntity();
  }

  Future<void> getPeriodicCommunicationReports() async {
    if (state.getPeriodicCommunicationReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(
        getPeriodicCommunicationReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getPeriodicCommunicationReportsUsecase(
      GetPeriodicCommunicationReportsParams(
        fkCountry: AppConstants.currentCountry,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getPeriodicCommunicationReportsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getPeriodicCommunicationReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getPeriodicCommunicationReportsStatus: BlocStatus.success(),
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
  PeriodicCommunicationReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setDateFromControllerValue =
          json[AppStrings.periodicCommunicationReportsCubit.dateFromController];
      filterEntity.setDateToControllerValue =
          json[AppStrings.periodicCommunicationReportsCubit.dateToController];
      return state;
    } catch (e) {
      debugPrint("error is => ${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PeriodicCommunicationReportsState state) {
    return {
      AppStrings.periodicCommunicationReportsCubit.dateFromController:
          filterEntity.dateFromController.text,
      AppStrings.periodicCommunicationReportsCubit.dateToController:
          filterEntity.dateToController.text,
    };
  }
}
