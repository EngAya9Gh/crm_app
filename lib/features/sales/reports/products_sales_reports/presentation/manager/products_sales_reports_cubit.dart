import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../model/usermodel.dart';
import '../../domain/entities/filter_products_sales_reports_entity.dart';
import '../../domain/entities/products_sales_reports_page_variables_entity.dart';
import '../../domain/use_cases/get_products_sales_reports_usecase.dart';

part 'products_sales_reports_state.dart';

@injectable
class ProductsSalesReportsCubit extends Cubit<ProductsSalesReportsState>
    with HydratedMixin {
  final GetProductsSalesReportsUsecase _getProductsSalesReportsUsecase;

  ProductsSalesReportsCubit(
    this._getProductsSalesReportsUsecase,
  ) : super(ProductsSalesReportsState()) {
    hydrate();
  }

  ProductsSalesReportsPageVariablesEntity pageVariables =
      ProductsSalesReportsPageVariablesEntity();
  FilterProductsSalesReportsEntity filterEntity =
      FilterProductsSalesReportsEntity();

  void init() {
    pageVariables = ProductsSalesReportsPageVariablesEntity();
  }

  Future<void> getProductsSalesReports() async {
    if (state.getProductsSalesReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getProductsSalesReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getProductsSalesReportsUsecase(
      GetProductsSalesReportsParams(
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
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getProductsSalesReportsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getProductsSalesReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getProductsSalesReportsStatus: BlocStatus.success(),
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
  ProductsSalesReportsState? fromJson(Map<String, dynamic> json) {
    try {
      filterEntity.setReportTypeNotifierValue = ReportTypeEnum.fromString(
        json[AppStrings.productsSalesReportsCubit.reportTypeNotifier],
      );
      filterEntity.setPeriodTypeNotifierValue = PeriodTypeEnum.fromString(
        json[AppStrings.productsSalesReportsCubit.periodTypeNotifier],
      );
      filterEntity.setProductTypeNotifierValue = ProductTypeEnum.fromString(
        json[AppStrings.productsSalesReportsCubit.productTypeNotifier],
      );
      if (json[AppStrings.productsSalesReportsCubit.regionNotifier] != null) {
        filterEntity.setRegionNotifierValue = RegionModel.fromJson(
            json[AppStrings.productsSalesReportsCubit.regionNotifier]);
      }
      if (json[AppStrings.productsSalesReportsCubit.userNotifier] != null) {
        filterEntity.setUserNotifierValue = UserModel.fromJson(
            json[AppStrings.productsSalesReportsCubit.userNotifier]);
      }
      filterEntity.setIsMarketingNotifierValue =
          json[AppStrings.productsSalesReportsCubit.isMarketingNotifier];
      filterEntity.setDateFromControllerValue =
          json[AppStrings.productsSalesReportsCubit.dateFromController];
      filterEntity.setDateToControllerValue =
          json[AppStrings.productsSalesReportsCubit.dateToController];
      return state;
    } catch (e) {
      debugPrint("error is => $e");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ProductsSalesReportsState state) {
    return {
      AppStrings.productsSalesReportsCubit.reportTypeNotifier:
          filterEntity.reportTypeNotifier.value.name,
      AppStrings.productsSalesReportsCubit.periodTypeNotifier:
          filterEntity.periodTypeNotifier.value.name,
      AppStrings.productsSalesReportsCubit.productTypeNotifier:
          filterEntity.productTypeNotifier.value?.name,
      AppStrings.productsSalesReportsCubit.regionNotifier:
          filterEntity.regionNotifier.value?.toJson(),
      AppStrings.productsSalesReportsCubit.userNotifier:
          filterEntity.userNotifier.value?.toJson(),
      AppStrings.productsSalesReportsCubit.isMarketingNotifier:
          filterEntity.isMarketingNotifier.value,
      AppStrings.productsSalesReportsCubit.dateFromController:
          filterEntity.dateFromController.text,
      AppStrings.productsSalesReportsCubit.dateToController:
          filterEntity.dateToController.text,
    };
  }
}
