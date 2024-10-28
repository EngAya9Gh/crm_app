import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';

@injectable
class GetAllClientsContactsUseCase extends BaseUsecase<
   ResponseWrapper<List<ClientContactModel>>, GetAllClientsContactsParams> {
  GetAllClientsContactsUseCase(this.repository);

  final ClientsContactsRepository repository;

  @override
  Future<ResponseWrapper<List<ClientContactModel>>> call(
      GetAllClientsContactsParams params) {
    return repository.getAllClientsContacts(params.toMap());
  }
}

class GetAllClientsContactsParams {
  final int page;
  final String? filter;
  final int? limit;
  final String? contactType;

  GetAllClientsContactsParams({
    required this.page,
     this.filter,
     this.contactType,
    required this.limit
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

     map['page'] = page;
    if (filter != null) map['filter'] = filter;
    if (limit != null) map['limit'] = limit;
    if (contactType != null) map['type'] = contactType;

    return map;
  }
}
