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

  GetAllClientsContactsParams({
    required this.page,
     this.filter,
    required this.limit
  });

  Map<String, dynamic> toMap() => {
    'page': this.page,
    'filter': this.filter,
    'limit': this.limit
  };
}
