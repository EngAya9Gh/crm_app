import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/sales/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class EditClientUserUsecase
    extends UseCase<Result<ResponseWrapper<ClientModel>>, EditClientParams> {
  EditClientUserUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(EditClientParams params) {
    return repository.editClient(params.toMap(), params.toParams);
  }
}

class EditClientParams {
  final String? email;
  final String? selectedActivitySizeType;
  final String? selectedARecommendedClient;
  final String? location;
  // final String? offerPrice;
  // final String? reason;
  final String? statusClient;
  // final String? datePrice;
  // final String? dateChangeType;
  // final String? rejectId;
  final String nameClient;
  final String nameEnterprise;
  final String city;
  // final String typeClient;
  final String mobile;
  final String anotherPhoneNumber;
  final String addressClient;
  final String? selectedActivityIdType;
  final String isMarketing;
  // final String userActionID;
  final String sourceClient;
  final String descriptionActivity;
  final String clientId;
  final String? type_record;
  final String? type_classification;
  final String? reason_class;
  EditClientParams({
    this.email,
    this.selectedActivitySizeType,
    this.selectedARecommendedClient,
    this.location,
    // this.offerPrice,
    // this.reason,
    this.statusClient,
    // this.datePrice,
    // this.dateChangeType,
    // this.rejectId,
    required this.nameClient,
    required this.nameEnterprise,
    required this.city,
    // required this.typeClient,
    required this.mobile,
    required this.anotherPhoneNumber,
    required this.addressClient,
    required this.selectedActivityIdType,
    required this.isMarketing,
    // required this.userActionID,
    required this.sourceClient,
    required this.descriptionActivity,
    required this.clientId,
    this.type_record,
    this.type_classification,
    this.reason_class,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'name_client': nameClient,
      'name_enterprise': nameEnterprise,
      "address_client": addressClient,
      "mobile": mobile,
      'city': city,
      'location': location,
      "phone": anotherPhoneNumber,
      'email': email,
      'descActivController': descriptionActivity,
      // "type_client": typeClient,
      // "user_do": userActionID,
      "ismarketing": isMarketing,
      "reason_class": reason_class,
      "type_classification": type_classification,
      "type_record": type_record,
      'fk_client_source': selectedARecommendedClient,
      'activity_type_fk': selectedActivityIdType,
      // "offer_price": offerPrice,
      // "reason_change": reason,
      'presystem': statusClient,
      'sourcclient': sourceClient,
      // "date_changetype": dateChangeType,
      // "date_price": datePrice,
      // "fk_rejectClient": rejectId,
    }..removeWhere((key, value) => value == null || value == "");

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_clients': clientId};
}
