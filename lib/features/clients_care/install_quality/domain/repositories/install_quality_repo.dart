import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_install_use_case.dart';

abstract class InstallQualityRepo {
  Future<Either<String, PaginationResponseWrapper>> getInstall(
    GetInstallParams params,
  );
}
