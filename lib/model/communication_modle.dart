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
    hoursdelaylabel = json['hoursdelaylabel'];
    fkUser = json['fk_user'].toString();
    dateCommunication = json['date_communication'];
    result = json['result'];
    notes = json['notes'];
    rate = json['rate'];
    typeCommuncation = json['type_communcation'];
    number_wrong = json['number_wrong'];
    clientRepeat = json['client_repeat'];
    dateNext = json['date_next'];
    nameEnterprise = json['name_enterprise'];
    nameUser = json['nameUser'] ?? json['name_user'];
    id_invoice = json['id_invoice'];
    date_create = json['date_create'];
    date_approve = json['date_approve'];
    dateinstall_done = json['dateinstall_done'];
    mobile = json['mobile'];
    name_regoin = json['name_regoin'];
    fk_regoin = json['fk_regoin'];
    nameClient = json['nameClient'];
    type_install = _handleNullString(json['type_install']);
    date_last_com_install = json['date_last_com_install'];
    isRecommendation = json['isRecommendation'];
    is_visit = json['is_visit'];
    is_suspend = json['is_suspend'];
    fkUserInstall = json['userinstall'];
    nameUserInstall = json['name_user_intall'];
    rateProductValue = json['rate_product'];
    rateSupportValue = json['rate_chat'];
    tag = json['tag'] == "true" ? true : false;
    typeSeller = json['type_seller'];
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

  String? _handleNullString(dynamic value) {
    if (value == null) return null;
    return value.toString();
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
      oldRate: json['old'],
      newRate: json['new'],
      dateUpdate: json['date_update'],
      fkUserUpdateRating: json['fk_user_update_rating'].toString(),
      nameUserUpdateRating: json['name_user_update_rating'],
    );
  }
}
