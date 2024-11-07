
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';
abstract class ClientActivitiesRepository {

  Future<ResponseWrapper<List<ClientActivityModel>>> getClientActivities(
      Map<String, dynamic> body, String clientId);



}
