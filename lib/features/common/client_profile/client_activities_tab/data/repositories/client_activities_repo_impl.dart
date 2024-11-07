import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:injectable/injectable.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';
import '../../domain/repositories/client_activities_repo.dart';
import '../data_sources/client_activities_datasource.dart';

@Injectable(as: ClientActivitiesRepository)
class ClientListRepositoryImpl implements ClientActivitiesRepository {
  final ClientActivitiesDatasource datasource;

  ClientListRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> getClientActivities(Map<String, dynamic> body,String clientId) {
    return datasource.getClientActivities(body,clientId);
  }


}