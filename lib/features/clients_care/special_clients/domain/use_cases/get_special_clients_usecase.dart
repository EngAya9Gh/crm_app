import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/distinctive_client.dart';
import '../repositories/special_clients_repository.dart';

@injectable
class GetSpecialClientsUsecase extends BaseUsecase<Result<ResponseWrapper<List<DistinctiveClient>>>, GetSpecialClientsParams> {
  GetSpecialClientsUsecase(this.repository);

  final SpecialClientsRepository repository;

  @override
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> call(GetSpecialClientsParams params) {
    return repository.getSpecialClients(params.toMap());
  }
}

class GetSpecialClientsParams {
  final int page;
  final int limit;
  final String country;
  final CityModel? city;

  GetSpecialClientsParams({
    required this.page,
    this.limit = 15,
    required this.country,
    this.city,
  });

  Map<String, dynamic> toMap() => {
        'page': page,
        'limit': limit,
        if (city != null) "city_id": "${city!.cityId}",
      };
}
