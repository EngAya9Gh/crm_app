import 'package:crm_smart/core/api/result.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/distinctive_client.dart';

abstract class CommunicationListRepository{
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> getCommunicationList(Map<String, dynamic> body);
}