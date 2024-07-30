import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_delay_install_reports_use_case.dart';

abstract class DelayInstallReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getDelayInstallReports(
    GetDelayInstallReportsParams params,
  );
}
