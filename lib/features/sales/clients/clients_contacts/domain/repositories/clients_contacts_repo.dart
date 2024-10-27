import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';

abstract class ClientsContactsRepository {

  Future<ResponseWrapper<List<ClientContactModel>>> getAllClientsContacts(
      Map<String, dynamic> body);

}
