import '../enums/client/subscribing_intention_level_enum.dart';

class ClientModel {
  final String? idClients;
  final String? nameClient;
  final String? nameEnterprise;
  final String? typeJob;
  final String? city;
  final String? location;
  final String? fkRegoin;
  final String? fkcountry;
  final String? dateCreate;
  final String? typeClient;
  final String? fkUser;
  final String? dateTransfer;
  final String? mobile;
  final String? date_changetype;
  final String? reasonChange;
  final String? reasonTransfer;
  final String? nameCountry;
  final String? nameUser;
  final String? name_regoin;
  final String? total;
  final String? amountPaid;
  final String? offer_price;
  final String? date_price;
  final String? user_do;
  final String? isApprove;
  final String? nameuserdoning;
  final String? nameusertransfer;
  final String? fkusertrasfer;
  final String? mobileuser;
  final String? total_paid;
  final String? ismarketing;
  final String? address_client;
  final String? descActivController;
  final String? presystem;
  final String? presystemtitle;
  final String? sourcclient;
  final String? activityTypeFk;
  final String? activity_type_title;
  final String? phone;
  final String? userAdd;
  final String? nameAdduser;
  final String? date_visit_Client;
  final String? reason_change;
  final String? transferTo;
  final bool? tag;
  final String? name_city;
  final String? namemaincity;
  final String? idMainCity;
  final String? email;
  final String? size_activity;
  final String? fkClientSource;
  final String? NameReason_reject;
  final String? NameClient_recomand;
  final String? fk_rejectClient;
  final String? type_record;
  final String? type_classification;
  final String? reason_class;
  final String? nameUserApproveRreject;
  final String? date_approve_reject;
  final String? serialNumber;
  final String? doneVisit;
  final String? doneTransfer;
  final String? customerId;
  final String? userAddEmail;
  final String? dateReceive;
  final String? fkRejectClient;
  final SubscribingIntentionLevelEnum? subscribingIntentionLevel;

  const ClientModel({
    this.idClients,
    this.nameClient,
    this.nameEnterprise,
    this.typeJob,
    this.city,
    this.location,
    this.fkRegoin,
    this.fkcountry,
    this.dateCreate,
    this.typeClient,
    this.fkUser,
    this.dateTransfer,
    this.mobile,
    this.date_changetype,
    this.reasonChange,
    this.reasonTransfer,
    this.nameCountry,
    this.nameUser,
    this.name_regoin,
    this.total,
    this.amountPaid,
    this.offer_price,
    this.date_price,
    this.user_do,
    this.isApprove,
    this.nameuserdoning,
    this.nameusertransfer,
    this.fkusertrasfer,
    this.mobileuser,
    this.total_paid,
    this.ismarketing,
    this.address_client,
    this.descActivController,
    this.presystem,
    this.presystemtitle,
    this.sourcclient,
    this.activityTypeFk,
    this.activity_type_title,
    this.phone,
    this.userAdd,
    this.nameAdduser,
    this.date_visit_Client,
    this.reason_change,
    this.transferTo,
    this.tag,
    this.name_city,
    this.namemaincity,
    this.idMainCity,
    this.email,
    this.size_activity,
    this.fkClientSource,
    this.NameReason_reject,
    this.NameClient_recomand,
    this.fk_rejectClient,
    this.type_record,
    this.type_classification,
    this.reason_class,
    this.nameUserApproveRreject,
    this.date_approve_reject,
    this.serialNumber,
    this.doneVisit,
    this.doneTransfer,
    this.customerId,
    this.userAddEmail,
    this.dateReceive,
    this.fkRejectClient,
    this.subscribingIntentionLevel,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      idClients: json['id_clients'].toString(),
      nameClient: json['name_client'],
      nameEnterprise: json['name_enterprise'],
      typeJob: json['type_job'],
      city: json['city'],
      location: json['location'],
      fkRegoin: json['fk_regoin'].toString(),
      fkcountry: json['fkcountry'].toString(),
      dateCreate: json['date_create'],
      typeClient: json['type_client'],
      fkUser: json['fk_user'].toString(),
      dateTransfer: json['date_transfer'],
      mobile: json['mobile'],
      date_changetype: json['date_changetype'],
      reasonChange: json['reason_change'],
      reasonTransfer: json['reason_transfer'],
      nameCountry: json['nameCountry'],
      nameUser: json['nameUser'],
      name_regoin: json['name_regoin'],
      total: json['total'],
      amountPaid: json['amount_paid'],
      offer_price: json['offer_price'],
      date_price: json['date_price'],
      user_do: json['user_do'] == null ? null : json['user_do'].toString(),
      isApprove: json['isApprove'],
      nameuserdoning: json['nameuserdoning'],
      nameusertransfer: json['nameusertransfer'],
      fkusertrasfer: json['fkusertrasfer'],
      mobileuser: json['mobileuser'],
      total_paid: json['total_paid'],
      ismarketing: json['ismarketing'],
      address_client: json['address_client'],
      descActivController: json['descActivController'],
      presystem: json['presystem'],
      presystemtitle: json['presystemtitle'],
      sourcclient: json['sourcclient'],
      activityTypeFk: json['activity_type_fk'],
      activity_type_title: json['activity_type_title'],
      phone: json['phone'],
      userAdd: json['user_add'].toString(),
      nameAdduser: json['nameAdduser'],
      date_visit_Client: json['date_visit_Client'],
      tag: tagFromJson(json['tag']),
      fkClientSource: json['fk_client_source'] == null
          ? null
          : json['fk_client_source'].toString(),
      size_activity: json['size_activity'].toString(),
      email: json['email'].toString(),
      transferTo: json['nameTransferTo'],
      type_record: json['type_record'].toString(),
      type_classification: json['type_classification'].toString(),
      reason_class: json['reason_class'].toString(),
      nameUserApproveRreject: json['nameUserApproveRreject'],
      date_approve_reject: json['date_approve_reject'],
      serialNumber: json['SerialNumber'].toString(),
      NameReason_reject: json['NameReason_reject'].toString(),
      NameClient_recomand: json['NameClient_recomand'].toString(),
      fkRejectClient: json['fk_rejectClient'] == null
          ? null
          : json['fk_rejectClient'].toString(),
      name_city: json['name_city'].toString(),
      namemaincity: json['namemaincity'].toString(),
      idMainCity: json['id_maincity'].toString(),
      customerId: json['IDcustomer'].toString(),
      userAddEmail: json['userAdd_email'].toString(),
      dateReceive: json['date_recive'].toString(),
      subscribingIntentionLevel:
          SubscribingIntentionLevelEnum.fromString(json['priority'].toString()),
      doneVisit: json['done_visit'].toString(),
      doneTransfer: json['done_transfer'].toString(),
    );
  }

  // copywith
  ClientModel copyWith({
    String? idClients,
    String? nameClient,
    String? nameEnterprise,
    String? typeJob,
    String? city,
    String? location,
    String? fkRegoin,
    String? fkcountry,
    String? dateCreate,
    String? typeClient,
    String? fkUser,
    String? dateTransfer,
    String? mobile,
    String? date_changetype,
    String? reasonChange,
    String? reasonTransfer,
    String? nameCountry,
    String? nameUser,
    String? name_regoin,
    String? total,
    String? amountPaid,
    String? offer_price,
    String? date_price,
    String? user_do,
    String? isApprove,
    String? nameuserdoning,
    String? nameusertransfer,
    String? fkusertrasfer,
    String? mobileuser,
    String? total_paid,
    String? ismarketing,
    String? address_client,
    String? descActivController,
    String? presystem,
    String? presystemtitle,
    String? sourcclient,
    String? activityTypeFk,
    String? activity_type_title,
    String? phone,
    String? userAdd,
    String? nameAdduser,
    String? date_visit_Client,
    String? reason_change,
    String? transferTo,
    bool? tag,
    String? name_city,
    String? namemaincity,
    String? idMainCity,
    String? email,
    String? size_activity,
    String? fkClientSource,
    String? NameReason_reject,
    String? NameClient_recomand,
    String? fk_rejectClient,
    String? type_record,
    String? type_classification,
    String? reason_class,
    String? nameUserApproveRreject,
    String? date_approve_reject,
    String? serialNumber,
    String? doneVisit,
    String? doneTransfer,
    String? customerId,
    String? userAddEmail,
    String? dateReceive,
    SubscribingIntentionLevelEnum? subscribingIntentionLevel,
  }) {
    return ClientModel(
      idClients: idClients ?? this.idClients,
      nameClient: nameClient ?? this.nameClient,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      typeJob: typeJob ?? this.typeJob,
      city: city ?? this.city,
      location: location ?? this.location,
      fkRegoin: fkRegoin ?? this.fkRegoin,
      fkcountry: fkcountry ?? this.fkcountry,
      dateCreate: dateCreate ?? this.dateCreate,
      typeClient: typeClient ?? this.typeClient,
      fkUser: fkUser ?? this.fkUser,
      dateTransfer: dateTransfer ?? this.dateTransfer,
      mobile: mobile ?? this.mobile,
      date_changetype: date_changetype ?? this.date_changetype,
      reasonChange: reasonChange ?? this.reasonChange,
      reasonTransfer: reasonTransfer ?? this.reasonTransfer,
      nameCountry: nameCountry ?? this.nameCountry,
      nameUser: nameUser ?? this.nameUser,
      name_regoin: name_regoin ?? this.name_regoin,
      total: total ?? this.total,
      amountPaid: amountPaid ?? this.amountPaid,
      offer_price: offer_price ?? this.offer_price,
      date_price: date_price ?? this.date_price,
      user_do: user_do ?? this.user_do,
      isApprove: isApprove ?? this.isApprove,
      nameuserdoning: nameuserdoning ?? this.nameuserdoning,
      nameusertransfer: nameusertransfer ?? this.nameusertransfer,
      fkusertrasfer: fkusertrasfer ?? this.fkusertrasfer,
      mobileuser: mobileuser ?? this.mobileuser,
      total_paid: total_paid ?? this.total_paid,
      ismarketing: ismarketing ?? this.ismarketing,
      address_client: address_client ?? this.address_client,
      descActivController: descActivController ?? this.descActivController,
      presystem: presystem ?? this.presystem,
      presystemtitle: presystemtitle ?? this.presystemtitle,
      sourcclient: sourcclient ?? this.sourcclient,
      activityTypeFk: activityTypeFk ?? this.activityTypeFk,
      activity_type_title: activity_type_title ?? this.activity_type_title,
      phone: phone ?? this.phone,
      userAdd: userAdd ?? this.userAdd,
      nameAdduser: nameAdduser ?? this.nameAdduser,
      date_visit_Client: date_visit_Client ?? this.date_visit_Client,
      reason_change: reason_change ?? this.reason_change,
      transferTo: transferTo ?? this.transferTo,
      tag: tag ?? this.tag,
      name_city: name_city ?? this.name_city,
      namemaincity: namemaincity ?? this.namemaincity,
      idMainCity: idMainCity ?? this.idMainCity,
      email: email ?? this.email,
      size_activity: size_activity ?? this.size_activity,
      fkClientSource: fkClientSource ?? this.fkClientSource,
      NameReason_reject: NameReason_reject ?? this.NameReason_reject,
      NameClient_recomand: NameClient_recomand ?? this.NameClient_recomand,
      fk_rejectClient: fk_rejectClient ?? this.fk_rejectClient,
      type_record: type_record ?? this.type_record,
      type_classification: type_classification ?? this.type_classification,
      reason_class: reason_class ?? this.reason_class,
      nameUserApproveRreject:
          nameUserApproveRreject ?? this.nameUserApproveRreject,
      date_approve_reject: date_approve_reject ?? this.date_approve_reject,
      serialNumber: serialNumber ?? this.serialNumber,
      doneVisit: doneVisit ?? this.doneVisit,
      doneTransfer: doneTransfer ?? this.doneTransfer,
      customerId: customerId ?? this.customerId,
      userAddEmail: userAddEmail ?? this.userAddEmail,
      dateReceive: dateReceive ?? this.dateReceive,
      subscribingIntentionLevel:
          subscribingIntentionLevel ?? this.subscribingIntentionLevel,
    );
  }

  static tagFromJson(String? tag) {
    return tag == "true";
  }

  String userAsString() {
    return "${this.nameEnterprise}";
  }

  bool getFilterUser(String filter) {
    return this.nameEnterprise.toString().contains(filter);
  }
}
