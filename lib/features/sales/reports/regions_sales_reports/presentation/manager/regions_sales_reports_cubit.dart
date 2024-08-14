import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/entities/filter_regions_sales_reports_entity.dart';
import '../../domain/entities/regions_sales_reports_page_variables_entity.dart';
import '../../domain/use_cases/get_regions_sales_reports_usecase.dart';

part 'regions_sales_reports_state.dart';

@injectable
class RegionsSalesReportsCubit extends Cubit<RegionsSalesReportsState> {
  final GetRegionsSalesReportsUsecase _getRegionsSalesReportsUsecase;

  RegionsSalesReportsCubit(
    this._getRegionsSalesReportsUsecase,
  ) : super(RegionsSalesReportsState());

  RegionsSalesReportsPageVariablesEntity pageVariables =
      RegionsSalesReportsPageVariablesEntity();
  FilterRegionsSalesReportsEntity filterEntity =
      FilterRegionsSalesReportsEntity();

  void init() {
    pageVariables = RegionsSalesReportsPageVariablesEntity();
    filterEntity = FilterRegionsSalesReportsEntity();
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
        regionId: filterEntity.regionNotifier.value?.regionId,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getRegionsSalesReportsStatus: BlocStatus.fail(error: e),
      )),
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
}
