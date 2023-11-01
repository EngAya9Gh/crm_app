import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class AddClientUserUsecase extends UseCase<Result<ResponseWrapper<ClientModel>>, AddClientParams> {
  AddClientUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(AddClientParams params) {
    return repository.addClient(params.toMap());
  }
}

class AddClientParams {
  final String? email;
  final String? selectedActivitySizeType;
  final String? selectedARecommendedClient;
  final String? location;
  final String? statusClient;
  final String nameClient;
  final String nameEnterprise;
  final String city;
  final String mobile;
  final String anotherPhoneNumber;
  final String addressClient;
  final String selectedActivityIdType;
  final bool isMarketing;
  final String sourceClient;
  final String descriptionActivity;
  final UserModel user;

  AddClientParams({
    this.email,
    this.selectedActivitySizeType,
    this.selectedARecommendedClient,
    this.location,
    this.statusClient,
    required this.nameClient,
    required this.nameEnterprise,
    required this.city,
    required this.mobile,
    required this.anotherPhoneNumber,
    required this.addressClient,
    required this.selectedActivityIdType,
    required this.isMarketing,
    required this.sourceClient,
    required this.descriptionActivity,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'email': email,
      'size_activity': selectedActivitySizeType,
      'fk_client_source': selectedARecommendedClient,
      'name_client': nameClient,
      'name_enterprise': nameEnterprise,
      'city': city,
      'location': location,
      "mobile": mobile,
      "phone": anotherPhoneNumber,
      "address_client": addressClient,
      'activity_type_fk': selectedActivityIdType,
      "ismarketing": isMarketing ? '1' : '0',
      'presystem': statusClient,
      'sourcclient': sourceClient,
      'descActivController': descriptionActivity,
      'type_job': 'type',
      "fk_regoin": user.fkRegoin == null ? "null" : user.fkRegoin,
      "date_create": DateTime.now().toIso8601String(),
      "type_client": "تفاوض",
      "fk_user": user.idUser,
      "user_add": user.idUser,
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }
}
