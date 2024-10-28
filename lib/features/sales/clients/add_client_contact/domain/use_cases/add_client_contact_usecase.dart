import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/add_client_contact_repo.dart';

@injectable
class AddClientContactUseCase extends BaseUsecase<
    ResponseWrapper<ClientContactModel>, AddClientContactParams> {
  AddClientContactUseCase(this.repository);

  final AddClientContactRepository repository;

  @override
  Future<ResponseWrapper<ClientContactModel>> call(
      AddClientContactParams params) {
    return repository.addClientContact(params.toMap());
  }
}

class AddClientContactParams {
  final String clientId;
  final String name;
  final String? description;
  final ContactTypeEnum contactType;
  final String contactValue;

  AddClientContactParams({
    required this.clientId,
    required this.name,
    this.description,
    required this.contactType,
    required this.contactValue,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'client_id': clientId,
      'name': name,
      'contact_type': contactType.type,
      'contact_value': contactValue,
    };

    if (description != null) {
      map['description'] = description;
    }

    return map;
  }
}
