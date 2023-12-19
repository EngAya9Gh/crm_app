// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'],
      title: json['title'] as String?,
      description: json['description'],
      publicType: json['public_Type'] as String?,
      mainTypeTask: json['main_type_task'],
      reciveDate: json['recive_date'],
      startDate: json['start_date'],
      deadline: json['deadline'],
      actualDeliveryDate: json['actual_delivery_date'],
      hours: json['hours'],
      completionPercentage: json['completion_percentage'],
      recurring: json['recurring'],
      recurringType: json['recurring_type'],
      numberOfRecurring: json['Number_Of_Recurring'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      dateTimeCreated: json['dateTimeCreated'] == null
          ? null
          : DateTime.parse(json['dateTimeCreated'] as String),
      changedDate: json['changed_date'],
      taskStatuseId: json['task_statuse_id'],
      changedBy: json['changed_by'],
      type: json['type'],
      priority: json['priority'],
      name: json['name'] as String?,
      assignedByName: json['assigned_by_name'] as String?,
      assigendDepartmentFromName:
          json['assigend_department_from_name'] as String?,
      assigendDepartmentToName: json['assigend_department_to_name'] as String?,
      assigendRegionFrom: json['assigend_region_from'] as String?,
      assigendRegionTo: json['assigend_region_to'] as String?,
      createdBy: json['created_by'] as String?,
      nameRegoin: json['name_regoin'] as String?,
      taskStatuses: (json['task_statuses'] as List<dynamic>?)
          ?.map((e) => TaskStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignedByUser: json['assignedByUser'] == null
          ? null
          : AssignedUser.fromJson(
              json['assignedByUser'] as Map<String, dynamic>),
      assignedToUser: json['assignedToUser'] == null
          ? null
          : AssignedUser.fromJson(
              json['assignedToUser'] as Map<String, dynamic>),
      taskGroup: json['taskGroup'] == null
          ? null
          : TaskGroup.fromJson(json['taskGroup'] as Map<String, dynamic>),
      clients: json['Clients'] == null
          ? null
          : Clients.fromJson(json['Clients'] as Map<String, dynamic>),
      invoices: json['invoices'] == null
          ? null
          : Invoices.fromJson(json['invoices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'public_Type': instance.publicType,
      'main_type_task': instance.mainTypeTask,
      'recive_date': instance.reciveDate,
      'start_date': instance.startDate,
      'deadline': instance.deadline,
      'actual_delivery_date': instance.actualDeliveryDate,
      'hours': instance.hours,
      'completion_percentage': instance.completionPercentage,
      'recurring': instance.recurring,
      'recurring_type': instance.recurringType,
      'Number_Of_Recurring': instance.numberOfRecurring,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'dateTimeCreated': instance.dateTimeCreated?.toIso8601String(),
      'changed_date': instance.changedDate,
      'task_statuse_id': instance.taskStatuseId,
      'changed_by': instance.changedBy,
      'type': instance.type,
      'priority': instance.priority,
      'name': instance.name,
      'assigned_by_name': instance.assignedByName,
      'assigend_department_from_name': instance.assigendDepartmentFromName,
      'assigend_department_to_name': instance.assigendDepartmentToName,
      'assigend_region_from': instance.assigendRegionFrom,
      'assigend_region_to': instance.assigendRegionTo,
      'created_by': instance.createdBy,
      'name_regoin': instance.nameRegoin,
      'task_statuses': instance.taskStatuses,
      'assignedByUser': instance.assignedByUser,
      'assignedToUser': instance.assignedToUser,
      'taskGroup': instance.taskGroup,
      'Clients': instance.clients,
      'invoices': instance.invoices,
    };

_$AssignedUserImpl _$$AssignedUserImplFromJson(Map<String, dynamic> json) =>
    _$AssignedUserImpl(
      idUser: json['id_user'],
      nameUser: json['nameUser'] as String?,
      imgImage: json['img_image'] as String?,
      fkRegoin: json['fk_regoin'],
      typeAdministration: json['type_administration'] as String?,
      nameRegoin: json['name_regoin'] as String?,
      nameMange: json['name_mange'] as String?,
    );

Map<String, dynamic> _$$AssignedUserImplToJson(_$AssignedUserImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'nameUser': instance.nameUser,
      'img_image': instance.imgImage,
      'fk_regoin': instance.fkRegoin,
      'type_administration': instance.typeAdministration,
      'name_regoin': instance.nameRegoin,
      'name_mange': instance.nameMange,
    };

_$ClientsImpl _$$ClientsImplFromJson(Map<String, dynamic> json) =>
    _$ClientsImpl(
      idClients: json['id_clients'],
      nameEnterprise: json['name_enterprise'] as String?,
      ismarketing: json['ismarketing'] as String?,
    );

Map<String, dynamic> _$$ClientsImplToJson(_$ClientsImpl instance) =>
    <String, dynamic>{
      'id_clients': instance.idClients,
      'name_enterprise': instance.nameEnterprise,
      'ismarketing': instance.ismarketing,
    };

_$InvoicesImpl _$$InvoicesImplFromJson(Map<String, dynamic> json) =>
    _$InvoicesImpl(
      idInvoice: json['id_invoice'],
      stateclient: json['stateclient'] as String?,
    );

Map<String, dynamic> _$$InvoicesImplToJson(_$InvoicesImpl instance) =>
    <String, dynamic>{
      'id_invoice': instance.idInvoice,
      'stateclient': instance.stateclient,
    };

_$TaskGroupImpl _$$TaskGroupImplFromJson(Map<String, dynamic> json) =>
    _$TaskGroupImpl(
      id: json['id'],
      groupName: json['groupName'] as String?,
    );

Map<String, dynamic> _$$TaskGroupImplToJson(_$TaskGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
    };

_$TaskStatusImpl _$$TaskStatusImplFromJson(Map<String, dynamic> json) =>
    _$TaskStatusImpl(
      id: json['id'],
      name: json['name'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      nameUser: json['name_user'] as String?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskStatusImplToJson(_$TaskStatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name_user': instance.nameUser,
      'pivot': instance.pivot,
    };

_$PivotImpl _$$PivotImplFromJson(Map<String, dynamic> json) => _$PivotImpl(
      taskId: json['task_id'],
      taskStatuseId: json['task_statuse_id'],
      changedBy: json['changed_by'],
    );

Map<String, dynamic> _$$PivotImplToJson(_$PivotImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_statuse_id': instance.taskStatuseId,
      'changed_by': instance.changedBy,
    };
