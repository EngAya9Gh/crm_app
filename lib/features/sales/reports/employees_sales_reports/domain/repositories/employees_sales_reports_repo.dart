import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_employees_sales_reports_usecase.dart';

abstract class EmployeesSalesReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getEmployeesSalesReports(
    GetEmployeesSalesReportsParams params,
  );
}
