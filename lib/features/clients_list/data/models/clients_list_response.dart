class ClientModel {
  final String? idClients;
  final String? nameClient;
  final String? nameEnterprise;
  final String? typeJob;
  final String? city;
  final String? location;
  final String? fkRegion;
  final String? fkCountry;
  final String? dateCreate;
  final String? typeClient;
  final String? fkUser;
  final String? dateTransfer;
  final String? mobile;
  final String? dateChangeType;
  final String? reasonChange;
  final String? reasonTransfer;
  final String? nameCountry;
  final String? nameUser;
  final String? nameRegion;
  final String? total;
  final String? amountPaid;
  final String? offerPrice;
  final String? datePrice;
  final String? userDo;
  final String? isApprove;
  final String? nameUserDoing;
  final String? nameUserTransfer;
  final String? fkUserTrasfer;
  final String? mobileUser;
  final String? totalPaid;
  final String? isMarketing;
  final String? addressClient;
  final String? descriptionActiveController;
  final String? preSystem;
  final String? preSystemTitle;
  final String? sourceClient;
  final String? activityTypeFk;
  final String? activityTypeTitle;
  final String? phone;
  final String? userAdd;
  final String? nameAdduser;
  final String? dateVisitClient;
  final bool? tag;
  final String? doneVisit;
  final String? doneTransfer;
  final String? nameCity;
  final String? nameMainCity;
  final String? idMainCity;
  final String? customerId;
  final String? userAddEmail;
  final String? dateReceive;
  final String? email;
  final String? sizeActivity;
  final String? fkClientSource;
  final String? nameReasonReject;
  final String? nameClientRecommend;
  final String? rejectId;
  final String? type_record;
  final String? type_classification;
  final String? reason_class;
  final String? serialNumber;

  ClientModel({
    this.idClients,
    this.nameClient,
    this.nameEnterprise,
    this.typeJob,
    this.city,
    this.location,
    this.fkRegion,
    this.fkCountry,
    this.dateCreate,
    this.typeClient,
    this.fkUser,
    this.dateTransfer,
    this.mobile,
    this.dateChangeType,
    this.reasonChange,
    this.reasonTransfer,
    this.nameCountry,
    this.nameUser,
    this.nameRegion,
    this.total,
    this.amountPaid,
    this.offerPrice,
    this.datePrice,
    this.userDo,
    this.isApprove,
    this.nameUserDoing,
    this.nameUserTransfer,
    this.fkUserTrasfer,
    this.mobileUser,
    this.totalPaid,
    this.isMarketing,
    this.addressClient,
    this.descriptionActiveController,
    this.preSystem,
    this.preSystemTitle,
    this.sourceClient,
    this.activityTypeFk,
    this.activityTypeTitle,
    this.phone,
    this.userAdd,
    this.nameAdduser,
    this.dateVisitClient,
    this.tag,
    this.doneVisit,
    this.doneTransfer,
    this.nameCity,
    this.nameMainCity,
    this.idMainCity,
    this.customerId,
    this.userAddEmail,
    this.dateReceive,
    this.email,
    this.sizeActivity,
    this.fkClientSource,
    this.nameReasonReject,
    this.nameClientRecommend,
    this.rejectId,
    this.type_record,
    this.type_classification,
    this.reason_class,
    this.serialNumber,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      idClients: json['id_clients'].toString(),
      nameClient: json['name_client'].toString(),
      nameEnterprise: json['name_enterprise'].toString(),
      typeJob: json['type_job'].toString(),
      city: json['city'].toString(),
      location: json['location'].toString(),
      fkRegion: json['fk_regoin'].toString(),
      fkCountry: json['fkcountry'].toString(),
      dateCreate: json['date_create'].toString(),
      typeClient: json['type_client'].toString(),
      fkUser: json['fk_user'].toString(),
      dateTransfer: json['date_transfer'].toString(),
      mobile: json['mobile'].toString(),
      dateChangeType: json['date_changetype'].toString(),
      reasonChange: json['reason_change'].toString(),
      reasonTransfer: json['reason_transfer'].toString(),
      nameCountry: json['nameCountry'].toString(),
      nameUser: json['nameUser'].toString(),
      nameRegion: json['name_regoin'].toString(),
      total: json['total'].toString(),
      amountPaid: json['amount_paid'].toString(),
      offerPrice: json['offer_price'].toString(),
      datePrice: json['date_price'].toString(),
      userDo: json['user_do'].toString(),
      isApprove: json['isApprove'].toString(),
      nameUserDoing: json['nameuserdoning'].toString(),
      nameUserTransfer: json['nameusertransfer'].toString(),
      fkUserTrasfer: json['fkusertrasfer'].toString(),
      mobileUser: json['mobileuser'].toString(),
      totalPaid: json['total_paid'].toString(),
      isMarketing: json['ismarketing'].toString(),
      addressClient: json['address_client'].toString(),
      descriptionActiveController: json['descActivController'].toString(),
      preSystem: json['presystem'].toString(),
      preSystemTitle: json['presystemtitle'].toString(),
      sourceClient: json['sourcclient'].toString(),
      activityTypeFk: json['activity_type_fk'].toString(),
      activityTypeTitle: json['activity_type_title'].toString(),
      phone: json['phone'].toString(),
      userAdd: json['user_add'].toString(),
      nameAdduser: json['nameAdduser'].toString(),
      dateVisitClient: json['date_visit_Client'].toString(),
      tag: json['tag'],
      doneVisit: json['done_visit'].toString(),
      doneTransfer: json['done_transfer'].toString(),
      nameCity: json['name_city'].toString(),
      nameMainCity: json['namemaincity'].toString(),
      idMainCity: json['id_maincity'].toString(),
      customerId: json['IDcustomer'].toString(),
      userAddEmail: json['userAdd_email'].toString(),
      dateReceive: json['date_recive'].toString(),
      email: json['email'].toString(),
      sizeActivity: json['size_activity'].toString(),
      fkClientSource: json['fk_client_source'].toString(),
      nameReasonReject: json['NameReason_reject'].toString(),
      nameClientRecommend: json['NameClient_recomand'].toString(),
      rejectId: json['fk_rejectClient'].toString(),
      type_record: json['type_record'].toString(),
      type_classification: json['type_classification'].toString(),
      reason_class: json['reason_class'].toString(),
      serialNumber: json['SerialNumber'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_clients': idClients,
      'name_client': nameClient,
      'name_enterprise': nameEnterprise,
      'type_job': typeJob,
      'city': city,
      'location': location,
      'fk_regoin': fkRegion,
      'fkcountry': fkCountry,
      'date_create': dateCreate,
      'type_client': typeClient,
      'fk_user': fkUser,
      'date_transfer': dateTransfer,
      'mobile': mobile,
      'date_changetype': dateChangeType,
      'reason_change': reasonChange,
      'reason_transfer': reasonTransfer,
      'nameCountry': nameCountry,
      'nameUser': nameUser,
      'name_regoin': nameRegion,
      'total': total,
      'amount_paid': amountPaid,
      'offer_price': offerPrice,
      'date_price': datePrice,
      'user_do': userDo,
      'isApprove': isApprove,
      'nameuserdoning': nameUserDoing,
      'nameusertransfer': nameUserTransfer,
      'fkusertrasfer': fkUserTrasfer,
      'mobileuser': mobileUser,
      'total_paid': totalPaid,
      'ismarketing': isMarketing,
      'address_client': addressClient,
      'descActivController': descriptionActiveController,
      'presystem': preSystem,
      'presystemtitle': preSystemTitle,
      'sourcclient': sourceClient,
      'activity_type_fk': activityTypeFk,
      'activity_type_title': activityTypeTitle,
      'phone': phone,
      'user_add': userAdd,
      'nameAdduser': nameAdduser,
      'date_visit_Client': dateVisitClient,
      'tag': tag,
      'done_visit': doneVisit,
      'done_transfer': doneTransfer,
      'name_city': nameCity,
      'namemaincity': nameMainCity,
      'id_maincity': idMainCity,
      'IDcustomer': customerId,
      'userAdd_email': userAddEmail,
      'date_recive': dateReceive,
      'email': email,
      'size_activity': sizeActivity,
      'fk_client_source': fkClientSource,
      'NameReason_reject': nameReasonReject,
      'NameClient_recomand': nameClientRecommend,
      'fk_rejectClient': rejectId,
      'type_record': type_record,
      'type_classification': type_classification,
      'reason_class': reason_class,
      'SerialNumber': serialNumber,
    };
  }

  static tagFromJson(String? tag) {
    return tag == "true";
  }
}
