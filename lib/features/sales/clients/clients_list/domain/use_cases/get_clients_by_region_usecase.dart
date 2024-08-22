import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetClientsListByRegionUseCase extends BaseUsecase<
    Result<ResponseWrapper<List<ClientModel>>>, GetClientsListByRegionParams> {
  GetClientsListByRegionUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> call(
      GetClientsListByRegionParams params) {
    return repository.getClientsByRegion(params.toMap());
  }
}

class GetClientsListByRegionParams {
  final String region;

  GetClientsListByRegionParams({required this.region});

  Map<String, dynamic> toMap() => {'fk_regoin': this.region};
}
