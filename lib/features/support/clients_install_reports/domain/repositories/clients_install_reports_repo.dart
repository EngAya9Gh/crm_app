import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_install_reports_usecase.dart';

abstract class ClientsInstallReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsInstallReports(
    GetClientsInstallReportsParams params,
  );
}
