import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/client_activity_model.dart';

abstract class ClientsActivitiesRepository {

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllClientsActivities(
      Map<String, dynamic> body);

}
