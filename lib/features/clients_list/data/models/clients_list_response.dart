import 'package:freezed_annotation/freezed_annotation.dart';

part 'clients_list_response.freezed.dart';

part 'clients_list_response.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel({
    @JsonKey(name: "id_clients") String? idClients,
    @JsonKey(name: "name_client") String? nameClient,
    @JsonKey(name: "name_enterprise") String? nameEnterprise,
    @JsonKey(name: "type_job") String? typeJob,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "fk_regoin") String? fkRegion,
    @JsonKey(name: "fkcountry") String? fkCountry,
    @JsonKey(name: "date_create") String? dateCreate,
    @JsonKey(name: "type_client") String? typeClient,
    @JsonKey(name: "fk_user") String? fkUser,
    @JsonKey(name: "date_transfer") String? dateTransfer,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "date_changetype") String? dateChangeType,
    @JsonKey(name: "reason_change") String? reasonChange,
    @JsonKey(name: "reason_transfer") String? reasonTransfer,
    @JsonKey(name: "nameCountry") String? nameCountry,
    @JsonKey(name: "nameUser") String? nameUser,
    @JsonKey(name: "name_regoin") String? nameRegion,
    @JsonKey(name: "total") String? total,
    @JsonKey(name: "amount_paid") String? amountPaid,
    @JsonKey(name: "offer_price") String? offerPrice,
    @JsonKey(name: "date_price") String? datePrice,
    @JsonKey(name: "user_do") String? userDo,
    @JsonKey(name: "isApprove") String? isApprove,
    @JsonKey(name: "nameuserdoning") String? nameUserDoing,
    @JsonKey(name: "nameusertransfer") String? nameUserTransfer,
    @JsonKey(name: "fkusertrasfer") String? fkUserTrasfer,
    @JsonKey(name: "mobileuser") String? mobileUser,
    @JsonKey(name: "total_paid") String? totalPaid,
    @JsonKey(name: "ismarketing") String? isMarketing,
    @JsonKey(name: "address_client") String? addressClient,
    @JsonKey(name: "descActivController") String? descriptionActiveController,
    @JsonKey(name: "presystem") String? preSystem,
    @JsonKey(name: "presystemtitle") String? preSystemTitle,
    @JsonKey(name: "sourcclient") String? sourceClient,
    @JsonKey(name: "activity_type_fk") String? activityTypeFk,
    @JsonKey(name: "activity_type_title") String? activityTypeTitle,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "user_add") String? userAdd,
    @JsonKey(name: "nameAdduser") String? nameAdduser,
    @JsonKey(name: "date_visit_Client") String? dateVisitClient,
    @JsonKey(name: "tag", fromJson: ClientModel.tagFromJson) bool? tag,
    @JsonKey(name: "done_visit") String? doneVisit,
    @JsonKey(name: "done_transfer") String? doneTransfer,
    @JsonKey(name: "name_city") String? nameCity,
    @JsonKey(name: "namemaincity") String? nameMainCity,
    @JsonKey(name: "id_maincity") String? idMainCity,
    @JsonKey(name: "IDcustomer") String? customerId,
    @JsonKey(name: "userAdd_email") String? userAddEmail,
    @JsonKey(name: "date_recive") String? dateReceive,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "size_activity") String? sizeActivity,
    @JsonKey(name: "fk_client_source") String? fkClientSource,
    @JsonKey(name: "NameReason_reject") String? nameReasonReject,
    @JsonKey(name: "NameClient_recomand") String? nameClientRecommend,
    @JsonKey(name: "fk_rejectClient") String? rejectId,
    @JsonKey(name: "type_record") String? type_record ,
    @JsonKey(name: "type_classification") String? type_classification ,
    @JsonKey(name: "reason_class") String? reason_class,
    @JsonKey(name: "SerialNumber") String? serialNumber,
  }) = _ClientModel;

  const ClientModel._();

  static tagFromJson(String? tag) {
    return tag == "true";
  }

  factory ClientModel.fromJson(Map<String, dynamic> json) => _$ClientModelFromJson(json);
}
