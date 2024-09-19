import 'package:equatable/equatable.dart';

import '../enums/client/subscribing_intention_level_enum.dart';
import '../helpers/api_helper.dart';

class ClientModel extends Equatable {
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
  final String? nameCountry;
  final String? nameUser;
  final String? nameRegion;
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
  final String? nameTransferTo;
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
  final String? dateReceived;
  final String? receivedDate;
  final String? isCommentsCheck;
  final String? dateUpdate;
  final String? fkuserUpdate;
  final String? approveIduserReject;
  final String? dateReject;
  final String? fkUserReject;
  final String? datePrice2;
  final String? isParent;

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
    this.nameCountry,
    this.nameUser,
    this.nameRegion,
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
    this.nameTransferTo,
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
    this.dateReceived,
    this.receivedDate,
    this.isCommentsCheck,
    this.dateUpdate,
    this.fkuserUpdate,
    this.approveIduserReject,
    this.dateReject,
    this.fkUserReject,
    this.datePrice2,
    this.isParent,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      tag: ApiHelper.handleString(json['tag']) == "1",
      idClients: ApiHelper.handleString(json['id_clients']),
      nameClient: ApiHelper.handleString(json['name_client']),
      nameEnterprise: ApiHelper.handleString(json['name_enterprise']),
      typeJob: ApiHelper.handleString(json['type_job']),
      city: ApiHelper.handleString(json['city']),
      location: ApiHelper.handleString(json['location']),
      fkRegoin: ApiHelper.handleString(json['fk_regoin']),
      fkcountry:
          ApiHelper.handleString(json['fkcountry'] ?? json['fk_country']),
      dateCreate: ApiHelper.handleString(json['date_create']),
      typeClient: ApiHelper.handleString(json['type_client']),
      fkUser: ApiHelper.handleString(json['fk_user']),
      dateTransfer: ApiHelper.handleString(json['date_transfer']),
      mobile: ApiHelper.handleString(json['mobile']),
      date_changetype: ApiHelper.handleString(json['date_changetype']),
      reasonChange: ApiHelper.handleString(json['reason_change']),
      nameCountry: ApiHelper.handleString(json['nameCountry']),
      nameUser: ApiHelper.handleString(json['nameUser']),
      nameRegion: ApiHelper.handleString(json['name_regoin']),
      total: ApiHelper.handleString(json['total']),
      amountPaid: ApiHelper.handleString(json['amount_paid']),
      offer_price: ApiHelper.handleString(json['offer_price']),
      date_price: ApiHelper.handleString(json['date_price']),
      user_do: ApiHelper.handleString(json['user_do']),
      isApprove: ApiHelper.handleString(json['isApprove']),
      nameuserdoning: ApiHelper.handleString(json['nameuserdoning']),
      nameusertransfer: ApiHelper.handleString(json['nameusertransfer']),
      fkusertrasfer: ApiHelper.handleString(json['fkusertrasfer']),
      mobileuser: ApiHelper.handleString(json['mobileuser']),
      total_paid: ApiHelper.handleString(json['total_paid']),
      ismarketing: ApiHelper.handleString(json['ismarketing']),
      address_client: ApiHelper.handleString(json['address_client']),
      descActivController: ApiHelper.handleString(json['descActivController']),
      presystem: ApiHelper.handleString(json['presystem']),
      presystemtitle: ApiHelper.handleString(json['presystemtitle']),
      sourcclient: ApiHelper.handleString(json['sourcclient']),
      activityTypeFk: ApiHelper.handleString(json['activity_type_fk']),
      activity_type_title: ApiHelper.handleString(json['activity_type_title']),
      phone: ApiHelper.handleString(json['phone']),
      userAdd: ApiHelper.handleString(json['user_add']),
      nameAdduser: ApiHelper.handleString(json['nameAdduser']),
      date_visit_Client: ApiHelper.handleString(json['date_visit_Client']),
      fkClientSource: ApiHelper.handleString(json['fk_client_source']),
      size_activity: ApiHelper.handleString(json['size_activity']),
      email: ApiHelper.handleString(json['email']),
      nameTransferTo: ApiHelper.handleString(json['nameTransferTo']),
      transferTo: ApiHelper.handleString(json['reason_transfer']),
      type_record: ApiHelper.handleString(json['type_record']),
      type_classification: ApiHelper.handleString(json['type_classification']),
      reason_class: ApiHelper.handleString(json['reason_class']),
      nameUserApproveRreject:
          ApiHelper.handleString(json['nameUserApproveRreject']),
      date_approve_reject: ApiHelper.handleString(json['date_approve_reject']),
      serialNumber: ApiHelper.handleString(json['SerialNumber']),
      NameReason_reject: ApiHelper.handleString(json['NameReason_reject']),
      NameClient_recomand: ApiHelper.handleString(json['NameClient_recomand']),
      fkRejectClient: ApiHelper.handleString(json['fk_rejectClient']),
      name_city: ApiHelper.handleString(json['name_city']),
      namemaincity: ApiHelper.handleString(json['namemaincity']),
      idMainCity: ApiHelper.handleString(json['id_maincity']),
      customerId: ApiHelper.handleString(json['IDcustomer']),
      userAddEmail: ApiHelper.handleString(json['userAdd_email']),
      dateReceive: ApiHelper.handleString(json['date_recive']),
      subscribingIntentionLevel: SubscribingIntentionLevelEnum.fromString(
          ApiHelper.handleString(json['priority'])),
      doneVisit: ApiHelper.handleString(json['done_visit']),
      doneTransfer: ApiHelper.handleString(json['done_transfer']),
      dateReceived: ApiHelper.handleString(json['date_received']),
      receivedDate: ApiHelper.handleString(json['received_date']),
      isCommentsCheck: ApiHelper.handleString(json['is_comments_check']),
      dateUpdate: ApiHelper.handleString(json['date_update']),
      fkuserUpdate: ApiHelper.handleString(json['fkuser_update']),
      approveIduserReject: ApiHelper.handleString(json['approveIduser_reject']),
      dateReject: ApiHelper.handleString(json['date_reject']),
      fkUserReject: ApiHelper.handleString(json['fk_user_reject']),
      datePrice2: ApiHelper.handleString(json['date_price2']),
      isParent: ApiHelper.handleString(json['is_parent']),
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
    String? nameTransferTo,
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
    String? dateReceived,
    String? receivedDate,
    String? isCommentsCheck,
    String? dateUpdate,
    String? fkuserUpdate,
    String? approveIduserReject,
    String? dateReject,
    String? fkUserReject,
    String? datePrice2,
    bool? isParent,
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
      nameCountry: nameCountry ?? this.nameCountry,
      nameUser: nameUser ?? this.nameUser,
      nameRegion: name_regoin ?? this.nameRegion,
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
    nameTransferTo: nameTransferTo ?? this.nameTransferTo,
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
    dateReceived: dateReceived ?? this.dateReceived,
    receivedDate: receivedDate ?? this.receivedDate,
    isCommentsCheck: isCommentsCheck ?? this.isCommentsCheck,
    dateUpdate: dateUpdate ?? this.dateUpdate,
    fkuserUpdate: fkuserUpdate ?? this.fkuserUpdate,
    approveIduserReject: approveIduserReject ?? this.approveIduserReject,
    dateReject: dateReject ?? this.dateReject,
    fkUserReject: fkUserReject ?? this.fkUserReject,
    datePrice2: datePrice2 ?? this.datePrice2);
  }

    String userAsString() {
      return "${this.nameEnterprise}";
    }

    bool getFilterUser(String filter) {
      return this.nameEnterprise.toString().contains(filter);
    }

    bool searchString(String query) {
      String _searchIn = "";
      if (nameClient != null) _searchIn += nameClient.toString();
      if (nameEnterprise != null) _searchIn += nameEnterprise.toString();
      if (mobile != null) _searchIn += mobile.toString();
      if (email != null) _searchIn += email.toString();

      return _searchIn.toLowerCase().contains(query.toLowerCase());
    }

    @override
    List<Object?> get props {
      return [
        idClients,
        nameClient,
        nameEnterprise,
        typeJob,
        city,
        location,
        fkRegoin,
        fkcountry,
        dateCreate,
        typeClient,
        fkUser,
        dateTransfer,
        mobile,
        date_changetype,
        reasonChange,
        nameCountry,
        nameUser,
        nameRegion,
        total,
        amountPaid,
        offer_price,
        date_price,
        user_do,
        isApprove,
        nameuserdoning,
        nameusertransfer,
        fkusertrasfer,
        mobileuser,
        total_paid,
        ismarketing,
        address_client,
        descActivController,
        presystem,
        presystemtitle,
        sourcclient,
        activityTypeFk,
        activity_type_title,
        phone,
        userAdd,
        nameAdduser,
        date_visit_Client,
        reason_change,
        nameTransferTo,
        transferTo,
        tag,
        name_city,
        namemaincity,
        idMainCity,
        email,
        size_activity,
        fkClientSource,
        NameReason_reject,
        NameClient_recomand,
        fk_rejectClient,
        type_record,
        type_classification,
        reason_class,
        nameUserApproveRreject,
        date_approve_reject,
        serialNumber,
        doneVisit,
        doneTransfer,
        customerId,
        userAddEmail,
        dateReceive,
        subscribingIntentionLevel,
        dateReceived,
        receivedDate,
        isCommentsCheck,
        dateUpdate,
        fkuserUpdate,
        approveIduserReject,
        dateReject,
        fkUserReject,
        datePrice2,
      ];
    }}
