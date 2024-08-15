part of 'employees_sales_reports_cubit.dart';

class EmployeesSalesReportsState extends Equatable {
  final BlocStatus<bool> getEmployeesSalesReportsStatus;

  EmployeesSalesReportsState({
    this.getEmployeesSalesReportsStatus = const BlocStatus<bool>.initial(),
  });

  EmployeesSalesReportsState copyWith({
    BlocStatus<bool>? getEmployeesSalesReportsStatus,
  }) {
    return EmployeesSalesReportsState(
      getEmployeesSalesReportsStatus:
          getEmployeesSalesReportsStatus ?? this.getEmployeesSalesReportsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getEmployeesSalesReportsStatus,
    ];
  }
}
