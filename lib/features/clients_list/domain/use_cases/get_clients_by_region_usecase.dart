import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class GetClientsListByRegionUseCase extends UseCase<
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
