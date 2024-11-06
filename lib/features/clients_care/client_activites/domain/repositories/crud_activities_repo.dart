
import 'package:crm_smart/features/clients_care/client_activites/data/models/activity_type_model.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import '../use_cases/add_activity_crud_usecase.dart';
import '../use_cases/update_activity_crud_usecase.dart';

abstract class CrudActivitiesRepository {

  Future<ResponseWrapper<List<ClientActivityModel>>> getAllActivities(
      Map<String, dynamic> body);

  Future<ResponseWrapper<List<ActivityTypeModel>>> getActivityTypes(
      Map<String, dynamic> body);
  Future<ResponseWrapper<List<SubscribedClientModel>>> getSubscribedClients(
      Map<String, dynamic> body);

  Future<ResponseWrapper<ClientActivityModel>> updateCrudActivity(
      UpdateActivityCrudParams body);

  Future<ResponseWrapper<ClientActivityModel>> addCrudActivity(
     AddActivityCrudParams body);


}
