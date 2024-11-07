import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:injectable/injectable.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../../client_communications/data/models/client_activity_model.dart';
import '../../domain/repositories/crud_activities_repo.dart';
import '../../domain/use_cases/add_activity_crud_usecase.dart';
import '../../domain/use_cases/update_activity_crud_usecase.dart';
import '../data_sources/crud_activities_datasource.dart';
import '../models/activity_type_model.dart';

@Injectable(as: CrudActivitiesRepository)
class CrudActivitiesRepoImpl implements CrudActivitiesRepository {
  final CrudActivitiesDatasource datasource;

  CrudActivitiesRepoImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> getAllActivities(Map<String, dynamic> body) {
    return datasource.getAllActivities(body);
  }
  @override
  Future<ResponseWrapper<List<ActivityTypeModel>>> getActivityTypes(Map<String, dynamic> body) {
    return datasource.getActivityTypes(body);
  }
  @override
  Future<ResponseWrapper<List<SubscribedClientModel>>> getSubscribedClients(Map<String, dynamic> body) {
    return datasource.getSubscribedClients(body);
  }
  @override
  Future<ResponseWrapper<ClientActivityModel>> updateCrudActivity(UpdateActivityCrudParams params) {
    return datasource.updateActivity(params);
  }  @override
  Future<ResponseWrapper<ClientActivityModel>> addCrudActivity(AddActivityCrudParams params) {
    return datasource.addCrudActivity(params);
  }

}