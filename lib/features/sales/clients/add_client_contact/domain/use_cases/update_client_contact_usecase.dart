import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/add_client_contact_repo.dart';
import 'add_client_contact_usecase.dart';

@injectable
class UpdateClientContactUseCase extends BaseUsecase<
    ResponseWrapper<ClientContactModel>, AddClientContactParams> {
  UpdateClientContactUseCase(this.repository);

  final AddClientContactRepository repository;

  @override
  Future<ResponseWrapper<ClientContactModel>> call(
      AddClientContactParams params, ) {
    return repository.updateClientContact(params.toMap(), params.contactId!);
  }
}