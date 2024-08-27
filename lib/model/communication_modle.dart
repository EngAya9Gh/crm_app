import 'package:crm_smart/core/common/helpers/api_helper.dart';

class CommunicationModel {
  late final String idCommunication;
  late final String fkClient;
  String? fkUser;
  late final String? dateCommunication;
  late final String? date_last_com_install;
  late final String? result;
  late final String? notes;
  String? rate = '0.0';
  String? rateSupportValue = '0.0';
  String? rateProductValue = '0.0';
  late final String? typeCommuncation;
  late final String? number_wrong;
  late final String? clientRepeat;
  late final String? dateNext;
  late final String nameEnterprise;
  late final String? nameUser;
  late final String? id_invoice;
  late final String? date_create;
  late final String? date_approve;
  late final String? dateinstall_done;
  late final String? mobile;
  late final String? name_regoin;
  late final String? fk_regoin;
  late final String? nameClient;
  late final bool? tag;
  late String? type_install;
  late String? hoursdelaylabel;
  late String? isRecommendation;
  late String? is_visit;
  String? is_suspend;
  String? fkUserInstall;
  String? nameUserInstall;
  String? typeSeller;
  late final List<CommunicationDetails> details;
  late final List<RatingModel> ratings;

  CommunicationModel({
    required this.idCommunication,
    required this.fkUserInstall,
    this.nameUserInstall,
    required this.fkClient,
    required this.fkUser,
    required this.dateCommunication,
    this.result,
    this.notes,
    required this.rate,
    required this.typeCommuncation,
    required this.number_wrong,
    required this.clientRepeat,
    required this.dateNext,
    required this.nameEnterprise,
    required this.nameUser,
    required this.id_invoice,
    required this.date_create,
    this.hoursdelaylabel,
    this.type_install,
    this.date_last_com_install,
    required this.dateinstall_done,
    this.mobile,
    this.name_regoin,
    this.fk_regoin,
    this.nameClient,
    this.is_suspend,
    this.rateProductValue,
    this.rateSupportValue,
    this.tag,
    this.isRecommendation,
    this.is_visit,
    this.typeSeller,
    this.details = const [],
  });

  CommunicationModel.fromJson(Map<String, dynamic> json) {
    idCommunication = json['id_communication'].toString();
    fkClient = json['fk_client'].toString();
    hoursdelaylabel = ApiHelper.handleString(json['hoursdelaylabel']);
    fkUser = ApiHelper.handleString(json['fk_user']);
    dateCommunication = ApiHelper.handleString(json['date_communication']);
    result = ApiHelper.handleString(json['result']);
    notes = ApiHelper.handleString(json['notes']);
    rate = ApiHelper.handleString(json['rate']);
    typeCommuncation = ApiHelper.handleString(json['type_communcation']);
    number_wrong = ApiHelper.handleString(json['number_wrong']);
    clientRepeat = ApiHelper.handleString(json['client_repeat']);
    dateNext = ApiHelper.handleString(json['date_next']);
    nameEnterprise = json['name_enterprise'].toString();
    nameUser = ApiHelper.handleString(json['nameUser'] ?? json['name_user']);
    id_invoice = ApiHelper.handleString(json['id_invoice']);
    date_create = ApiHelper.handleString(json['date_create']);
    date_approve = ApiHelper.handleString(json['date_approve']);
    dateinstall_done = ApiHelper.handleString(json['dateinstall_done']);
    mobile = ApiHelper.handleString(json['mobile']);
    name_regoin = ApiHelper.handleString(json['name_regoin']);
    fk_regoin = ApiHelper.handleString(json['fk_regoin']);
    nameClient = ApiHelper.handleString(json['nameClient']);
    type_install = ApiHelper.handleString(json['type_install']);
    date_last_com_install =
        ApiHelper.handleString(json['date_last_com_install']);
    isRecommendation = ApiHelper.handleString(json['isRecommendation']);
    is_visit = ApiHelper.handleString(json['is_visit']);
    is_suspend = ApiHelper.handleString(json['is_suspend']);
    fkUserInstall = ApiHelper.handleString(json['userinstall']);
    nameUserInstall = ApiHelper.handleString(json['name_user_intall']);
    rateProductValue = ApiHelper.handleString(json['rate_product']);
    rateSupportValue = ApiHelper.handleString(json['rate_chat']);
    tag = ApiHelper.handleString(json['tag']) == "true" ? true : false;
    typeSeller = ApiHelper.handleString(json['type_seller']);
    details = json['communication_details'] == null
        ? []
        : List<CommunicationDetails>.from(
            json['communication_details'].map((e) {
            return CommunicationDetails.fromJson(e);
          }));
    ratings = json['ratings'] == null
        ? []
        : List<RatingModel>.from(json['ratings'].map((e) {
            return RatingModel.fromJson(e);
          }));
  }

  bool searchString(String query) {
    String searchIn = "$nameEnterprise";
    if (nameClient != null) searchIn += " $nameClient";
    if (mobile != null) searchIn += " $mobile";

    return searchIn.toLowerCase().contains(query.toLowerCase());
  }
}

class CommunicationDetails {
  final String id;
  final String? state;
  final String? reason;
  final String? createdAt;
  final String? updatedAt;

  const CommunicationDetails({
    required this.id,
    this.state,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory CommunicationDetails.fromJson(Map<String, dynamic> json) {
    return CommunicationDetails(
      id: json['id'].toString(),
      state: json['state'],
      reason: json['reason'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class RatingModel {
  final String key;
  final String? oldRate;
  final String? newRate;
  final String? dateUpdate;
  final String? fkUserUpdateRating;
  final String? nameUserUpdateRating;

  const RatingModel({
    required this.key,
    this.oldRate,
    this.newRate,
    this.dateUpdate,
    this.fkUserUpdateRating,
    this.nameUserUpdateRating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      key: json['key'],
      oldRate: json['old'] == null ? null : json['old'].toString(),
      newRate: json['new'].toString(),
      dateUpdate: json['date_update'],
      fkUserUpdateRating: json['fk_user_update_rating'].toString(),
      nameUserUpdateRating: json['name_user_update_rating'],
    );
  }
}
