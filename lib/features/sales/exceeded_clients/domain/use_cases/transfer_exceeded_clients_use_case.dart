import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/prepare_params_list.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repositories/exceeded_clients_repo.dart';

@lazySingleton
class TransferExceededClientsUseCase extends UseCase<
    Either<String, PaginationResponseWrapper>, TransferExceededClientsParams> {
  TransferExceededClientsUseCase(this._repository);

  final ExceededClientsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    TransferExceededClientsParams params,
  ) async {
    return await _repository.transferExceededClients(params);
  }
}

class TransferExceededClientsParams {
  final List<ClientModel> clientsIds;

  const TransferExceededClientsParams({
    required this.clientsIds,
  });

  Map<String, dynamic> toBody() {
    return {
      ...prepareParamsList(
        key: "ids",
        values: clientsIds.map((e) => e.idClients).toList(),
      ),
    };
  }
}
