import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/entities/filter_products_sales_reports_entity.dart';
import '../../domain/entities/products_sales_reports_page_variables_entity.dart';
import '../../domain/use_cases/get_products_sales_reports_usecase.dart';

part 'products_sales_reports_state.dart';

@injectable
class ProductsSalesReportsCubit extends Cubit<ProductsSalesReportsState> {
  final GetProductsSalesReportsUsecase _getProductsSalesReportsUsecase;

  ProductsSalesReportsCubit(
    this._getProductsSalesReportsUsecase,
  ) : super(ProductsSalesReportsState());

  ProductsSalesReportsPageVariablesEntity pageVariables =
      ProductsSalesReportsPageVariablesEntity();
  FilterProductsSalesReportsEntity filterEntity =
      FilterProductsSalesReportsEntity();

  void init() {
    pageVariables = ProductsSalesReportsPageVariablesEntity();
    filterEntity = FilterProductsSalesReportsEntity();
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
        user: filterEntity.userNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getProductsSalesReportsStatus: BlocStatus.fail(error: e),
      )),
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
}
