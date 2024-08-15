part of 'products_sales_reports_cubit.dart';

class ProductsSalesReportsState extends Equatable {
  final BlocStatus<bool> getProductsSalesReportsStatus;

  ProductsSalesReportsState({
    this.getProductsSalesReportsStatus = const BlocStatus<bool>.initial(),
  });

  ProductsSalesReportsState copyWith({
    BlocStatus<bool>? getProductsSalesReportsStatus,
  }) {
    return ProductsSalesReportsState(
      getProductsSalesReportsStatus:
          getProductsSalesReportsStatus ?? this.getProductsSalesReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getProductsSalesReportsStatus,
    ];
  }
}
