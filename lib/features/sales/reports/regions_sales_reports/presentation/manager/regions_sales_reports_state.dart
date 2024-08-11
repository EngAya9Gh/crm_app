part of 'regions_sales_reports_cubit.dart';

class RegionsSalesReportsState extends Equatable {
  final BlocStatus<bool> getRegionsSalesReportsStatus;

  RegionsSalesReportsState({
    this.getRegionsSalesReportsStatus = const BlocStatus<bool>.initial(),
  });

  RegionsSalesReportsState copyWith({
    BlocStatus<bool>? getRegionsSalesReportsStatus,
  }) {
    return RegionsSalesReportsState(
      getRegionsSalesReportsStatus:
          getRegionsSalesReportsStatus ?? this.getRegionsSalesReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getRegionsSalesReportsStatus,
    ];
  }
}
