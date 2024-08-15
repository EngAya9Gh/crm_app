import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../use_cases/get_clients_debts_usecase.dart';

abstract class ClientsDebtsRepo {
  Future<Either<String, PaginationResponseWrapper>> getClientsDebts(
    GetClientsDebtsParams params,
  );
}
