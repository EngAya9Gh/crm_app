import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/api/api_utils.dart';
import '../../domain/repositories/clients_dates_repo.dart';
import '../data_sources/client_dates_datasource.dart';
import '../models/client_date_model.dart';

@Injectable(as: ClientsDatesRepository)
class ClientsListRepositoryImpl implements ClientsDatesRepository {
  final ClientsDatesDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientDateModel>>> getAllClientsDates(Map<String, dynamic> body, String clientId) {
    return datasource.getAllClientsDates(body, clientId);
  }


}