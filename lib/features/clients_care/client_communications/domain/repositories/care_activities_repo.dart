
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/client_activity_model.dart';
import '../use_cases/update_care_activity_usecase.dart';

abstract class CareActivitiesRepository {

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllCareActivities(
      Map<String, dynamic> body);

  Future<ResponseWrapper<ClientActivityModel>> updateActivity(
      UpdateCareActivityParams body);


}
