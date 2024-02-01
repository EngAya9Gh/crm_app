import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/communication_list/data/models/distinctive_client.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';


abstract class ParticipateListRepository{
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(Map<String, dynamic> body);
}