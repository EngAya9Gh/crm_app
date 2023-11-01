// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientModel _$$_ClientModelFromJson(Map<String, dynamic> json) =>
    _$_ClientModel(
      idClients: json['id_clients'] as String?,
      nameClient: json['name_client'] as String?,
      nameEnterprise: json['name_enterprise'] as String?,
      typeJob: json['type_job'] as String?,
      city: json['city'] as String?,
      location: json['location'] as String?,
      fkRegion: json['fk_regoin'] as String?,
      fkCountry: json['fkcountry'] as String?,
      dateCreate: json['date_create'] as String?,
      typeClient: json['type_client'] as String?,
      fkUser: json['fk_user'] as String?,
      dateTransfer: json['date_transfer'] as String?,
      mobile: json['mobile'] as String?,
      dateChangeType: json['date_changetype'] as String?,
      reasonChange: json['reason_change'] as String?,
      reasonTransfer: json['reason_transfer'] as String?,
      nameCountry: json['nameCountry'] as String?,
      nameUser: json['nameUser'] as String?,
      nameRegion: json['name_regoin'] as String?,
      total: json['total'] as String?,
      amountPaid: json['amount_paid'] as String?,
      offerPrice: json['offer_price'] as String?,
      datePrice: json['date_price'] as String?,
      userDo: json['user_do'] as String?,
      isApprove: json['isApprove'] as String?,
      nameUserDoing: json['nameuserdoning'] as String?,
      nameUserTransfer: json['nameusertransfer'] as String?,
      fkUserTrasfer: json['fkusertrasfer'] as String?,
      mobileUser: json['mobileuser'] as String?,
      totalPaid: json['total_paid'] as String?,
      isMarketing: json['ismarketing'] as String?,
      addressClient: json['address_client'] as String?,
      descriptionActiveController: json['descActivController'] as String?,
      preSystem: json['presystem'] as String?,
      preSystemTitle: json['presystemtitle'] as String?,
      sourceClient: json['sourcclient'] as String?,
      activityTypeFk: json['activity_type_fk'] as String?,
      activityTypeTitle: json['activity_type_title'] as String?,
      phone: json['phone'] as String?,
      userAdd: json['user_add'] as String?,
      nameAdduser: json['nameAdduser'] as String?,
      dateVisitClient: json['date_visit_Client'] as String?,
      tag: ClientModel.tagFromJson(json['tag'] as String?),
      doneVisit: json['done_visit'] as String?,
      doneTransfer: json['done_transfer'] as String?,
      nameCity: json['name_city'] as String?,
      nameMainCity: json['namemaincity'] as String?,
      idMainCity: json['id_maincity'] as String?,
      customerId: json['IDcustomer'] as String?,
      userAddEmail: json['userAdd_email'] as String?,
      dateReceive: json['date_recive'] as String?,
      email: json['email'] as String?,
      sizeActivity: json['size_activity'] as String?,
      fkClientSource: json['fk_client_source'] as String?,
    );

Map<String, dynamic> _$$_ClientModelToJson(_$_ClientModel instance) =>
    <String, dynamic>{
      'id_clients': instance.idClients,
      'name_client': instance.nameClient,
      'name_enterprise': instance.nameEnterprise,
      'type_job': instance.typeJob,
      'city': instance.city,
      'location': instance.location,
      'fk_regoin': instance.fkRegion,
      'fkcountry': instance.fkCountry,
      'date_create': instance.dateCreate,
      'type_client': instance.typeClient,
      'fk_user': instance.fkUser,
      'date_transfer': instance.dateTransfer,
      'mobile': instance.mobile,
      'date_changetype': instance.dateChangeType,
      'reason_change': instance.reasonChange,
      'reason_transfer': instance.reasonTransfer,
      'nameCountry': instance.nameCountry,
      'nameUser': instance.nameUser,
      'name_regoin': instance.nameRegion,
      'total': instance.total,
      'amount_paid': instance.amountPaid,
      'offer_price': instance.offerPrice,
      'date_price': instance.datePrice,
      'user_do': instance.userDo,
      'isApprove': instance.isApprove,
      'nameuserdoning': instance.nameUserDoing,
      'nameusertransfer': instance.nameUserTransfer,
      'fkusertrasfer': instance.fkUserTrasfer,
      'mobileuser': instance.mobileUser,
      'total_paid': instance.totalPaid,
      'ismarketing': instance.isMarketing,
      'address_client': instance.addressClient,
      'descActivController': instance.descriptionActiveController,
      'presystem': instance.preSystem,
      'presystemtitle': instance.preSystemTitle,
      'sourcclient': instance.sourceClient,
      'activity_type_fk': instance.activityTypeFk,
      'activity_type_title': instance.activityTypeTitle,
      'phone': instance.phone,
      'user_add': instance.userAdd,
      'nameAdduser': instance.nameAdduser,
      'date_visit_Client': instance.dateVisitClient,
      'tag': instance.tag,
      'done_visit': instance.doneVisit,
      'done_transfer': instance.doneTransfer,
      'name_city': instance.nameCity,
      'namemaincity': instance.nameMainCity,
      'id_maincity': instance.idMainCity,
      'IDcustomer': instance.customerId,
      'userAdd_email': instance.userAddEmail,
      'date_recive': instance.dateReceive,
      'email': instance.email,
      'size_activity': instance.sizeActivity,
      'fk_client_source': instance.fkClientSource,
    };
