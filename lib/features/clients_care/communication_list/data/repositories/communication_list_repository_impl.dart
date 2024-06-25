import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../data_sources/communication_list_datasource.dart';
import '../../domain/repositories/communication_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/distinctive_client.dart';

@Injectable(as: CommunicationListRepository)
class CommunicationListRepositoryImpl implements CommunicationListRepository {
  final CommunicationListDatasource datasource;

  CommunicationListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> getCommunicationList(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.getCommunicationList(body));
  }
}
