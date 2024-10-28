import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/api/api_utils.dart';
import '../../domain/repositories/add_client_contact_repo.dart';

@Injectable(as: AddClientContactRepository)
class AddClientContactRepositoryImpl implements AddClientContactRepository {
  final AddClientsContactsDatasource datasource;

  AddClientContactRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<ClientContactModel>> addClientContact(Map<String, dynamic> body) {
    return datasource.addClientContact(body);
  }
  @override
  Future<ResponseWrapper<ClientContactModel>> updateClientContact(Map<String, dynamic> body,String contactId) {
    return datasource.updateClientContact(body,contactId);
  }


}