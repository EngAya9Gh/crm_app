import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/location/branch_model.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_regions_sales_reports_entity.dart';
import '../../domain/entities/regions_sales_reports_page_variables_entity.dart';
import '../../domain/use_cases/get_regions_sales_reports_usecase.dart';

part 'regions_sales_reports_state.dart';

@injectable
class RegionsSalesReportsCubit extends Cubit<RegionsSalesReportsState>
    with HydratedMixin {
  final GetRegionsSalesReportsUsecase _getRegionsSalesReportsUsecase;

  RegionsSalesReportsCubit(
    this._getRegionsSalesReportsUsecase,
  ) : super(RegionsSalesReportsState()) {
    hydrate();
  }

  RegionsSalesReportsPageVariablesEntity pageVariables =
      RegionsSalesReportsPageVariablesEntity();
  FilterRegionsSalesReportsEntity filterEntity =
      FilterRegionsSalesReportsEntity();

  void init() {
    pageVariables = RegionsSalesReportsPageVariablesEntity();
  }

  Future<void> getRegionsSalesReports() async {
    if (state.getRegionsSalesReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getRegionsSalesReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getRegionsSalesReportsUsecase(
      GetRegionsSalesReportsParams(
        type: filterEntity.reportTypeNotifier.value,
        typeProduct: filterEntity.productTypeNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
        regionId: filterEntity.regionNotifier.value?.branchId,
      ),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getRegionsSalesReportsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getRegionsSalesReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getRegionsSalesReportsStatus: BlocStatus.success(),
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
  RegionsSalesReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.regionsSalesReportsCubit.reportTypeNotifier],
      );
      filterEntity.setPeriodTypeNotifierValue = PeriodTypeEnum.fromString(
        json[AppStrings.regionsSalesReportsCubit.periodTypeNotifier],
      );
      final region = json[AppStrings.regionsSalesReportsCubit.regionNotifier];
      if (region != null) {
        filterEntity.setRegionNotifierValue = BranchModel.fromJson(region);
      }
      filterEntity.setProductTypeNotifierValue = ProductTypeEnum.fromString(
        json[AppStrings.regionsSalesReportsCubit.productTypeNotifier],
      );
      filterEntity.setIsMarketingNotifierValue =
          json[AppStrings.regionsSalesReportsCubit.isMarketingNotifier];
      filterEntity.setDateFromControllerValue =
          json[AppStrings.regionsSalesReportsCubit.dateFromController];
      filterEntity.setDateToControllerValue =
          json[AppStrings.regionsSalesReportsCubit.dateToController];
      return state;
    } catch (e) {
      debugPrint("error is => ${e}");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(RegionsSalesReportsState state) {
    return {
      AppStrings.regionsSalesReportsCubit.reportTypeNotifier:
          filterEntity.reportTypeNotifier.value.name,
      AppStrings.regionsSalesReportsCubit.periodTypeNotifier:
          filterEntity.periodTypeNotifier.value?.name,
      AppStrings.regionsSalesReportsCubit.regionNotifier:
          filterEntity.regionNotifier.value?.toJson(),
      AppStrings.regionsSalesReportsCubit.productTypeNotifier:
          filterEntity.productTypeNotifier.value?.name,
      AppStrings.regionsSalesReportsCubit.isMarketingNotifier:
          filterEntity.isMarketingNotifier.value,
      AppStrings.regionsSalesReportsCubit.dateFromController:
          filterEntity.dateFromController.text,
      AppStrings.regionsSalesReportsCubit.dateToController:
          filterEntity.dateToController.text,
    };
  }
}
