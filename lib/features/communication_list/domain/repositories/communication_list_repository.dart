import 'package:crm_smart/core/api/result.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/communication_list_response.dart';

abstract class CommunicationListRepository{
  Future<Result<ResponseWrapper<List<Communication>>>> getCommunicationList(Map<String, dynamic> body);
}