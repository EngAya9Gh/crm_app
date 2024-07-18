import 'package:dartz/dartz.dart';

import '../../../../../model/clientmodel.dart';
import '../use_cases/get_clients_accept_usecase.dart';

abstract class ClientsAcceptRepository {
  Future<Either<String, List<ClientModel1>>> getClientsAccept(
    GetClientsAcceptParams params,
  );
}
