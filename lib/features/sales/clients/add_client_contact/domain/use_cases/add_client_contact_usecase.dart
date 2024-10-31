import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
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
  final String? clientId;
  final String? contactId;
  final String name;
  final String? type;
  final ContactTypeEnum contactType;
  final String contactValue;

  AddClientContactParams({
     this.clientId,
     this.contactId,
    required this.name,
     this.type,
    required this.contactType,
    required this.contactValue,
  });

  // Add copyWith method
  AddClientContactParams copyWith({
    String? clientId,
    String? contactId,
    String? name,
    String? type,
    ContactTypeEnum? contactType,
    String? contactValue,
  }) {
    return AddClientContactParams(
      clientId: clientId ?? this.clientId,
      contactId: contactId ?? this.contactId,
      name: name ?? this.name,
      type: type ?? this.type,
      contactType: contactType ?? this.contactType,
      contactValue: contactValue ?? this.contactValue,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'client_id': clientId,
      'name': name,
      'contact_type': contactType.type,
      'contact_value': contactValue,
      'type': type,
    };


    return map;
  }
}