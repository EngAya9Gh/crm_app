// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunicationListResponse _$$_CommunicationListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CommunicationListResponse(
      result: json['result'] as String?,
      code: json['code'] as String?,
      message: (json['message'] as List<dynamic>?)
          ?.map((e) => Communication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommunicationListResponseToJson(
        _$_CommunicationListResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'message': instance.message,
    };

_$_Communication _$$_CommunicationFromJson(Map<String, dynamic> json) =>
    _$_Communication(
      idCommunication: json['id_communication'] as String?,
      fkClient: json['fk_client'] as String?,
      fkUser: json['fk_user'] as String?,
      dateCommunication: json['date_communication'],
      result: json['result'],
      notes: json['notes'],
      rate: json['rate'],
      typeCommuncation: json['type_communcation'] as String?,
      numberWrong: json['number_wrong'] as String?,
      clientRepeat: json['client_repeat'] as String?,
      dateNext: json['date_next'] == null
          ? null
          : DateTime.parse(json['date_next'] as String),
      idInvoice: json['id_invoice'],
      iDcustomer: json['IDcustomer'],
      userDo: json['user_do'],
      nameEnterprisecom: json['name_enterprisecom'],
      address: json['address'],
      typeInstall: json['type_install'],
      dateLastComInstall: json['date_last_com_install'],
      clientOut: json['client_out'],
      school: json['school'] as String?,
      isSuspend: json['is_suspend'] as String?,
      isRecommendation: json['isRecommendation'],
      isVisit: json['is_visit'],
      userUpdate: json['user_update'],
      nameEnterprise: json['name_enterprise'] as String?,
      nameUser: json['nameUser'] as String?,
      dateCreate: json['date_create'],
      dateApprove: json['date_approve'],
      dateinstallDone: json['dateinstall_done'],
      mobile: json['mobile'] as String?,
      fkRegoin: json['fk_regoin'] as String?,
      nameRegoin: json['name_regoin'] as String?,
      nameClient: json['name_client'] as String?,
      hoursdelaylabel: json['hoursdelaylabel'] as String?,
    );

Map<String, dynamic> _$$_CommunicationToJson(_$_Communication instance) =>
    <String, dynamic>{
      'id_communication': instance.idCommunication,
      'fk_client': instance.fkClient,
      'fk_user': instance.fkUser,
      'date_communication': instance.dateCommunication,
      'result': instance.result,
      'notes': instance.notes,
      'rate': instance.rate,
      'type_communcation': instance.typeCommuncation,
      'number_wrong': instance.numberWrong,
      'client_repeat': instance.clientRepeat,
      'date_next': instance.dateNext?.toIso8601String(),
      'id_invoice': instance.idInvoice,
      'IDcustomer': instance.iDcustomer,
      'user_do': instance.userDo,
      'name_enterprisecom': instance.nameEnterprisecom,
      'address': instance.address,
      'type_install': instance.typeInstall,
      'date_last_com_install': instance.dateLastComInstall,
      'client_out': instance.clientOut,
      'school': instance.school,
      'is_suspend': instance.isSuspend,
      'isRecommendation': instance.isRecommendation,
      'is_visit': instance.isVisit,
      'user_update': instance.userUpdate,
      'name_enterprise': instance.nameEnterprise,
      'nameUser': instance.nameUser,
      'date_create': instance.dateCreate,
      'date_approve': instance.dateApprove,
      'dateinstall_done': instance.dateinstallDone,
      'mobile': instance.mobile,
      'fk_regoin': instance.fkRegoin,
      'name_regoin': instance.nameRegoin,
      'name_client': instance.nameClient,
      'hoursdelaylabel': instance.hoursdelaylabel,
    };
