import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/special_clients_repository.dart';
import '../data_sources/special_clients_datasource.dart';
import '../models/distinctive_client.dart';

@Injectable(as: SpecialClientsRepository)
class SpecialClientsRepositoryImpl implements SpecialClientsRepository {
  final SpecialClientsDatasource datasource;

  SpecialClientsRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> getSpecialClients(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.getSpecialClients(body));
  }
}
