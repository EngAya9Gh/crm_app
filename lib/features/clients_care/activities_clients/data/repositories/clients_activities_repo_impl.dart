import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/activities_clients/data/models/client_activity_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/api/api_utils.dart';
import '../../domain/repositories/clients_activities_repo.dart';
import '../data_sources/clients_activities_datasource.dart';

@Injectable(as: ClientsActivitiesRepository)
class ClientsListRepositoryImpl implements ClientsActivitiesRepository {
  final ClientsActivitiesDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> getAllClientsActivities(Map<String, dynamic> body) {
    return datasource.getAllClientsActivities(body);
  }


}