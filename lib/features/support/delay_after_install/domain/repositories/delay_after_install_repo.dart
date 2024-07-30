import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_delay_after_install_use_case.dart';

abstract class DelayAfterInstallRepo {
  Future<Either<String, PaginationResponseWrapper>> getDelayAfterInstall(
    GetDelayAfterInstallParams params,
  );
}
