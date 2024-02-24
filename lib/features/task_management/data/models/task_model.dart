import 'dart:convert';

import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: "id") dynamic id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") dynamic description,
    @JsonKey(name: "public_Type") String? publicType,
    @JsonKey(name: "main_type_task") dynamic mainTypeTask,
    @JsonKey(name: "recive_date") dynamic reciveDate,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "deadline") dynamic deadline,
    @JsonKey(name: "actual_delivery_date") dynamic actualDeliveryDate,
    @JsonKey(name: "hours") dynamic hours,
    @JsonKey(name: "completion_percentage") dynamic completionPercentage,
    @JsonKey(name: "recurring") dynamic recurring,
    @JsonKey(name: "recurring_type") dynamic recurringType,
    @JsonKey(name: "Number_Of_Recurring") dynamic numberOfRecurring,
    @JsonKey(name: "created_at") dynamic createdAt,
    @JsonKey(name: "updated_at") dynamic updatedAt,
    @JsonKey(name: "dateTimeCreated") DateTime? dateTimeCreated,
    @JsonKey(name: "changed_date") dynamic changedDate,
    @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
    @JsonKey(name: "changed_by") dynamic changedBy,
    @JsonKey(name: "type") dynamic type,
    @JsonKey(name: "priority") dynamic priority,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "assigned_by_name") String? assignedByName,
    @JsonKey(name: "assigend_department_from_name")
    String? assigendDepartmentFromName,
    @JsonKey(name: "assigend_department_to_name")
    String? assigendDepartmentToName,
    @JsonKey(name: "assigend_region_from") String? assigendRegionFrom,
    @JsonKey(name: "assigend_region_to") String? assigendRegionTo,
    @JsonKey(name: "created_by") String? createdBy,
    @JsonKey(name: "name_regoin") String? nameRegoin,
    @JsonKey(name: "task_statuses") List<TaskStatus>? taskStatuses,
    @JsonKey(name: "assignedByUser") AssignedUser? assignedByUser,
    @JsonKey(name: "assignedToUser") AssignedUser? assignedToUser,
    @JsonKey(name: "taskGroup") TaskGroup? taskGroup,
    @JsonKey(name: "Clients") Clients? clients,
    @JsonKey(name: "invoices") Invoices? invoices,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
      required: true,
    )
    @Default(BlocStatus.initial())
    BlocStatus taskBlocStatus,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

@freezed
class AssignedUser with _$AssignedUser {
  const factory AssignedUser({
    @JsonKey(name: "id_user") dynamic idUser,
    @JsonKey(name: "nameUser") String? nameUser,
    @JsonKey(name: "img_image") String? imgImage,
    @JsonKey(name: "fk_regoin") dynamic fkRegoin,
    @JsonKey(name: "type_administration") String? typeAdministration,
    @JsonKey(name: "name_regoin") String? nameRegoin,
    @JsonKey(name: "name_mange") String? nameMange,
  }) = _AssignedUser;

  factory AssignedUser.fromJson(Map<String, dynamic> json) =>
      _$AssignedUserFromJson(json);
}

@freezed
class Clients with _$Clients {
  const factory Clients({
    @JsonKey(name: "id_clients") dynamic idClients,
    @JsonKey(name: "name_enterprise") String? nameEnterprise,
    @JsonKey(name: "ismarketing") String? ismarketing,
  }) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
class Invoices with _$Invoices {
  const factory Invoices({
    @JsonKey(name: "id_invoice") dynamic idInvoice,
    @JsonKey(name: "stateclient") String? stateclient,
  }) = _Invoices;

  factory Invoices.fromJson(Map<String, dynamic> json) =>
      _$InvoicesFromJson(json);
}

@freezed
class TaskGroup with _$TaskGroup {
  const factory TaskGroup({
    @JsonKey(name: "id") dynamic id,
    @JsonKey(name: "groupName") String? groupName,
  }) = _TaskGroup;

  factory TaskGroup.fromJson(Map<String, dynamic> json) =>
      _$TaskGroupFromJson(json);
}

@freezed
class TaskStatus with _$TaskStatus {
  const factory TaskStatus({
    @JsonKey(name: "id") dynamic id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "created_at") dynamic createdAt,
    @JsonKey(name: "updated_at") dynamic updatedAt,
    @JsonKey(name: "name_user") String? nameUser,
    @JsonKey(name: "pivot") Pivot? pivot,
  }) = _TaskStatus;

  factory TaskStatus.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusFromJson(json);
}

@freezed
class Pivot with _$Pivot {
  const factory Pivot({
    @JsonKey(name: "task_id") dynamic taskId,
    @JsonKey(name: "task_statuse_id") dynamic taskStatuseId,
    @JsonKey(name: "changed_by") dynamic changedBy,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}
