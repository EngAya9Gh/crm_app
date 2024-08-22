import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/distinctive_client.dart';
import '../repositories/special_clients_repository.dart';

@injectable
class GetSpecialClientsUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<DistinctiveClient>>>, GetSpecialClientsParams> {
  GetSpecialClientsUsecase(this.repository);

  final SpecialClientsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> call(
      GetSpecialClientsParams params) {
    return repository.getSpecialClients(params.toMap());
  }
}

class GetSpecialClientsParams {
  final String country;
  final String? citId;

  GetSpecialClientsParams({required this.country, this.citId});

  Map<String, dynamic> toMap() => {
        'fk_country': this.country,
        if (citId != null) "fk_city": "$citId",
      };
}
