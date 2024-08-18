import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/distinctive_client.dart';

abstract class SpecialClientsRepository {
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> getSpecialClients(
      Map<String, dynamic> body);
}
