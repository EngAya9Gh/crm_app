import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/models/client_model.dart';
import '../repositories/clients_list_repository.dart';

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
  final String? type_record;
  final String? type_classification;
  final String? reason_class;
  final SubscribingIntentionLevelEnum? subscribingIntentionLevel;

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
    this.type_record,
    this.type_classification,
    this.reason_class,
    this.subscribingIntentionLevel,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'name_enterprise': nameEnterprise,
      "address_client": addressClient,
      "mobile": mobile,
      'city': city,
      'location': location,
      "phone": anotherPhoneNumber,
      'email': email,
      'size_activity': selectedActivitySizeType,
      'descActivController': descriptionActivity,
      "type_client": "تفاوض",
      "ismarketing": isMarketing,
      "reason_class": reason_class,
      "type_classification": type_classification,
      "type_record": type_record,
      'fk_client_source': selectedARecommendedClient,
      'activity_type_fk': selectedActivityIdType,
      'presystem': statusClient,
      'sourcclient': sourceClient,
      'name_client': nameClient,
      'priority': subscribingIntentionLevel?.name,
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  // copy with
  AddClientParams copyWith({
    String? email,
    String? selectedActivitySizeType,
    String? selectedARecommendedClient,
    String? location,
    String? statusClient,
    String? nameClient,
    String? nameEnterprise,
    String? city,
    String? mobile,
    String? anotherPhoneNumber,
    String? addressClient,
    String? selectedActivityIdType,
    String? isMarketing,
    String? sourceClient,
    String? descriptionActivity,
    String? type_record,
    String? type_classification,
    String? reason_class,
    SubscribingIntentionLevelEnum? subscribingIntentionLevel,
  }) {
    return AddClientParams(
      email: email ?? this.email,
      selectedActivitySizeType:
          selectedActivitySizeType ?? this.selectedActivitySizeType,
      selectedARecommendedClient:
          selectedARecommendedClient ?? this.selectedARecommendedClient,
      location: location ?? this.location,
      statusClient: statusClient ?? this.statusClient,
      nameClient: nameClient ?? this.nameClient,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      city: city ?? this.city,
      mobile: mobile ?? this.mobile,
      anotherPhoneNumber: anotherPhoneNumber ?? this.anotherPhoneNumber,
      addressClient: addressClient ?? this.addressClient,
      selectedActivityIdType:
          selectedActivityIdType ?? this.selectedActivityIdType,
      isMarketing: isMarketing ?? this.isMarketing,
      sourceClient: sourceClient ?? this.sourceClient,
      descriptionActivity: descriptionActivity ?? this.descriptionActivity,
      type_record: type_record ?? this.type_record,
      type_classification: type_classification ?? this.type_classification,
      reason_class: reason_class ?? this.reason_class,
      subscribingIntentionLevel:
          subscribingIntentionLevel ?? this.subscribingIntentionLevel,
    );
  }
}
