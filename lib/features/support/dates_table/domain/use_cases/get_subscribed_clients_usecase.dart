import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/subscribed_client_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetSubscribedClientsUsecase extends BaseUsecase<
    Either<String, List<SubscribedClientModel>>, GetSubscribedClientsParams> {
  GetSubscribedClientsUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, List<SubscribedClientModel>>> call(
    GetSubscribedClientsParams params,
  ) async {
    return await _repository.getSubscribedClients(params);
  }
}

class GetSubscribedClientsParams {
  const GetSubscribedClientsParams();
}
