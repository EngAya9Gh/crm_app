import 'package:freezed_annotation/freezed_annotation.dart';

part 'communication_list_response.freezed.dart';
part 'communication_list_response.g.dart';

@freezed
class CommunicationListResponse with _$CommunicationListResponse {
  const factory CommunicationListResponse({
    @JsonKey(name: "result")
    String? result,
    @JsonKey(name: "code")
    String? code,
    @JsonKey(name: "message")
    List<Communication>? message,
  }) = _CommunicationListResponse;

  factory CommunicationListResponse.fromJson(Map<String, dynamic> json) => _$CommunicationListResponseFromJson(json);
}

@freezed
class Communication with _$Communication {
  const factory Communication({
    @JsonKey(name: "id_communication")
    String? idCommunication,
    @JsonKey(name: "fk_client")
    String? fkClient,
    @JsonKey(name: "fk_user")
    String? fkUser,
    @JsonKey(name: "date_communication")
    dynamic dateCommunication,
    @JsonKey(name: "result")
    dynamic result,
    @JsonKey(name: "notes")
    dynamic notes,
    @JsonKey(name: "rate")
    dynamic rate,
    @JsonKey(name: "type_communcation")
    String? typeCommuncation,
    @JsonKey(name: "number_wrong")
    String? numberWrong,
    @JsonKey(name: "client_repeat")
    String? clientRepeat,
    @JsonKey(name: "date_next")
    DateTime? dateNext,
    @JsonKey(name: "id_invoice")
    dynamic idInvoice,
    @JsonKey(name: "IDcustomer")
    dynamic iDcustomer,
    @JsonKey(name: "user_do")
    dynamic userDo,
    @JsonKey(name: "name_enterprisecom")
    dynamic nameEnterprisecom,
    @JsonKey(name: "address")
    dynamic address,
    @JsonKey(name: "type_install")
    dynamic typeInstall,
    @JsonKey(name: "date_last_com_install")
    dynamic dateLastComInstall,
    @JsonKey(name: "client_out")
    dynamic clientOut,
    @JsonKey(name: "school")
    String? school,
    @JsonKey(name: "is_suspend")
    String? isSuspend,
    @JsonKey(name: "isRecommendation")
    dynamic isRecommendation,
    @JsonKey(name: "is_visit")
    dynamic isVisit,
    @JsonKey(name: "user_update")
    dynamic userUpdate,
    @JsonKey(name: "name_enterprise")
    String? nameEnterprise,
    @JsonKey(name: "nameUser")
    String? nameUser,
    @JsonKey(name: "date_create")
    dynamic dateCreate,
    @JsonKey(name: "date_approve")
    dynamic dateApprove,
    @JsonKey(name: "dateinstall_done")
    dynamic dateinstallDone,
    @JsonKey(name: "mobile")
    String? mobile,
    @JsonKey(name: "fk_regoin")
    String? fkRegoin,
    @JsonKey(name: "name_regoin")
    String? nameRegoin,
    @JsonKey(name: "name_client")
    String? nameClient,
    @JsonKey(name: "hoursdelaylabel")
    String? hoursdelaylabel,
  }) = _Communication;

  factory Communication.fromJson(Map<String, dynamic> json) => _$CommunicationFromJson(json);
}
