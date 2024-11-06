import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/clients_activities_repo.dart';
import '../../domain/use_cases/update_activity_usecase.dart';
import '../data_sources/clients_activities_datasource.dart';
import '../models/client_activity_model.dart';

@Injectable(as: ClientsActivitiesRepository)
class ClientsListRepositoryImpl implements ClientsActivitiesRepository {
  final ClientsActivitiesDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> getAllClientsActivities(Map<String, dynamic> body) {
    return datasource.getAllClientsActivities(body);
  }
  @override
  Future<ResponseWrapper<ClientActivityModel>> updateActivity(UpdateActivityParams params) {
    return datasource.updateActivity(params);
  }

}