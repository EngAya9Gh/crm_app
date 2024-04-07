import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class AddClientUserUsecase
    extends UseCase<Result<ResponseWrapper<ClientModel>>, AddClientParams> {
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
  final String? selectedActivityIdType;
  final String isMarketing;
  final String sourceClient;
  final String descriptionActivity;
  final UserModel user;
  final String? type_record;
  final String? type_classification;
  final String? reason_class;
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
    this.type_record,
    this.type_classification,
    this.reason_class,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'name_enterprise': nameEnterprise,
      "address_client": addressClient,
      "mobile": mobile,
      'type_job': 'type',
      'city': city,
      'location': location,
      "phone": anotherPhoneNumber,
      'email': email,
      'size_activity': selectedActivitySizeType,
      'descActivController': descriptionActivity,
      "fk_regoin": user.fkRegoin == null ? "null" : user.fkRegoin,
      "type_client": "تفاوض",
      "ismarketing": isMarketing,
      "reason_class": reason_class,
      "type_classification": type_classification,
      "type_record": type_record,
      'fk_client_source': selectedARecommendedClient,
      'activity_type_fk': selectedActivityIdType,
      'presystem': statusClient,
      'sourcclient': sourceClient,
      "date_create": DateTime.now().toIso8601String(),
      "fk_user": user.idUser,
      'name_client': nameClient,
      "user_add": user.idUser,
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }
}
