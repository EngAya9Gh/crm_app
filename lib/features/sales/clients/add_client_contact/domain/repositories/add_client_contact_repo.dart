import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';

abstract class AddClientContactRepository {

  Future<ResponseWrapper<ClientContactModel>> addClientContact(
      Map<String, dynamic> body);
  Future<ResponseWrapper<ClientContactModel>> updateClientContact(
      Map<String, dynamic> body, String contactId);

}
