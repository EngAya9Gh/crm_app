
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/client_activity_model.dart';
import '../use_cases/update_activity_usecase.dart';

abstract class ClientsActivitiesRepository {

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllClientsActivities(
      Map<String, dynamic> body);

  Future<ResponseWrapper<ClientActivityModel>> updateActivity(
      UpdateActivityParams body);


}
