import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/communication_list/data/data_sources/communication_list_datasource.dart';
import 'package:crm_smart/features/communication_list/data/models/communication_list_response.dart';
import 'package:crm_smart/features/communication_list/domain/repositories/communication_list_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CommunicationListRepository)
class CommunicationListRepositoryImpl implements CommunicationListRepository {
  final CommunicationListDatasource datasource;

  CommunicationListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<Communication>>>> getCommunicationList(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getCommunicationList(body));
  }
}
