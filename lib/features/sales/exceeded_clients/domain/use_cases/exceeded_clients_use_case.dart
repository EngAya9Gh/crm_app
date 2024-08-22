import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/exceeded_clients_repo.dart';

@lazySingleton
class ExceededClientsUseCase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, ExceededClientsParams> {
  ExceededClientsUseCase(this._repository);

  final ExceededClientsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    ExceededClientsParams params,
  ) async {
    return await _repository.getExceededClients(params);
  }
}

class ExceededClientsParams {
  final bool? passLimit;

  const ExceededClientsParams({
    this.passLimit,
  });

  Map<String, dynamic> toParams() {
    return {
      if (passLimit != true) 'pass_limit': 1,
    };
  }
}
