import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_debts_reports_usecase.dart';

abstract class ClientsDebtsReportsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsDebtsReports(
    GetClientsDebtsReportsParams params,
  );
}
