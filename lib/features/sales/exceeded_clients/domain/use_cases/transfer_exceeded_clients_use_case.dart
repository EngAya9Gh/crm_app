import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/exceeded_clients_repo.dart';

@lazySingleton
class TransferExceededClientsUseCase extends BaseUsecase<
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
      ...ApiHelper.prepareParamsList(
        key: "ids",
        values: clientsIds.map((e) => e.idClients).toList(),
      ),
    };
  }
}
