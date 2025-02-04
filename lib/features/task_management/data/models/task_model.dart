// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:crm_smart/model/usermodel.dart';

import '../../../../core/common/models/client_model.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  final int? id;
  final String? title;
  final String? description;
  final AssignFromOrToModel? assignFrom;
  final String? assignFromModel;
  final AssignFromOrToModel? assignTo;
  final String? assignToModel;
  final Status? status;
  final ClientModel? client;
  final Invoice? invoice;
  final dynamic communicationId;
  final dynamic group;
  final String? code;
  final DateTime? startDate;
  final dynamic deadline;
  final String? type;
  final dynamic completionPercentage;
  final dynamic recurringType;
  final dynamic recurringNumber;
  final AssignFromOrToModel? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? overDeadline;
  final List<UserModel>? collaborators;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.assignFrom,
    this.assignFromModel,
    this.assignTo,
    this.assignToModel,
    this.status,
    this.client,
    this.invoice,
    this.communicationId,
    this.group,
    this.code,
    this.startDate,
    this.deadline,
    this.type,
    this.completionPercentage,
    this.recurringType,
    this.recurringNumber,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.overDeadline,
    this.collaborators,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    AssignFromOrToModel? assignFrom,
    String? assignFromModel,
    AssignFromOrToModel? assignTo,
    String? assignToModel,
    Status? status,
    ClientModel? client,
    Invoice? invoice,
    dynamic communicationId,
    dynamic group,
    String? code,
    DateTime? startDate,
    dynamic deadline,
    String? type,
    dynamic completionPercentage,
    dynamic recurringType,
    dynamic recurringNumber,
    AssignFromOrToModel? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? overDeadline,
    List<UserModel>? collaborators,
  }) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        assignFrom: assignFrom ?? this.assignFrom,
        assignFromModel: assignFromModel ?? this.assignFromModel,
        assignTo: assignTo ?? this.assignTo,
        assignToModel: assignToModel ?? this.assignToModel,
        status: status ?? this.status,
        client: client ?? this.client,
        invoice: invoice ?? this.invoice,
        communicationId: communicationId ?? this.communicationId,
        group: group ?? this.group,
        code: code ?? this.code,
        startDate: startDate ?? this.startDate,
        deadline: deadline ?? this.deadline,
        type: type ?? this.type,
        completionPercentage: completionPercentage ?? this.completionPercentage,
        recurringType: recurringType ?? this.recurringType,
        recurringNumber: recurringNumber ?? this.recurringNumber,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        overDeadline: overDeadline ?? this.overDeadline,
        collaborators: collaborators ?? this.collaborators,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      TaskModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        assignFrom: json["assign_from"] == null ? null : AssignFromOrToModel.fromJson(json["assign_from"]),
        assignFromModel: json["assign_from_model"],
        assignTo: json["assign_to"] == null ? null : AssignFromOrToModel.fromJson(json["assign_to"]),
        assignToModel: json["assign_to_model"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        client: json["client"]==null?null:ClientModel.fromJson(json["client"]),
        invoice: json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
        communicationId: json["communication_id"],
        group: json["group"],
        code: json["code"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        deadline: json["deadline"],
        type: json["type"],
        completionPercentage: json["completion_percentage"],
        recurringType: json["recurring_type"],
        recurringNumber: json["recurring_number"],
        overDeadline: json["over_deadline"],
        collaborators: (json["collaborators"] as List<dynamic>).map((e) => UserModel.fromJson(e)).toList(),
        createdBy: json["created_by"] == null ? null : AssignFromOrToModel.fromJson(json["created_by"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "description": description,
        "assign_from": assignFrom?.toJson(),
        "assign_from_model": assignFromModel,
        "assign_to": assignTo?.toJson(),
        "assign_to_model": assignToModel,
        "status": status?.toJson(),
        "client": client,
        "invoice": invoice?.toJson(),
        "communication_id": communicationId,
        "group": group,
        "code": code,
        "start_date": startDate?.toIso8601String(),
        "deadline": deadline,
        "type": type,
        "completion_percentage": completionPercentage,
        "recurring_type": recurringType,
        "recurring_number": recurringNumber,
        "over_deadline": overDeadline,
        "collaborators": (collaborators??[]).map((e) => e.toJson(),),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class AssignFromOrToModel {
  final int? idMange;
  final int? idRegion;
  final int? idUser;
  final String? nameMange;
  final String? nameRegion;
  final String? nameUser;
  final String? image;
  final dynamic fkCountry;

  AssignFromOrToModel({
    this.idMange,
    this.idRegion,
    this.idUser,
    this.nameMange,
    this.nameRegion,
    this.nameUser,
    this.fkCountry,
    this.image,
  });


  AssignFromOrToModel copyWith({
    int? idMange,
    int? idRegion,
    int? idUser,
    String? nameMange,
    String? nameRegion,
    String? nameUser,
    String? image,
    dynamic fkCountry,
  }) {
    return AssignFromOrToModel(
      idMange: idMange ?? this.idMange,
      idRegion: idRegion ?? this.idRegion,
      idUser: idUser ?? this.idUser,
      nameMange: nameMange ?? this.nameMange,
      nameRegion: nameRegion ?? this.nameRegion,
      nameUser: nameUser ?? this.nameUser,
      fkCountry: fkCountry ?? this.fkCountry,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idmange': this.idMange,
      'id_regoin': this.idRegion,
      'id_user': this.idUser,
      'name_mange': this.nameMange,
      'name_regoin': this.nameRegion,
      'nameUser': this.nameUser,
      'img_image': this.image,
      'fk_country': this.fkCountry,
    };
  }

  factory AssignFromOrToModel.fromJson(Map<String, dynamic> map) {
    return AssignFromOrToModel(
      idMange: map['idmange'] as int?,
      idRegion: map['id_regoin'] as int?,
      idUser: map['id_user'] as int?,
      nameMange: map['name_mange'] as String?,
      nameRegion: map['name_regoin'] as String?,
      nameUser: map['nameUser'] as String?,
      image: map['img_image'] as String?,
      fkCountry: map['fk_country'] as dynamic,
    );
  }
}

class Invoice {
  final int? idInvoice;
  final String? addressInvoice;

  Invoice({
    this.idInvoice,
    this.addressInvoice,
  });

  Invoice copyWith({
    int? idInvoice,
    String? addressInvoice,
  }) =>
      Invoice(
        idInvoice: idInvoice ?? this.idInvoice,
        addressInvoice: addressInvoice ?? this.addressInvoice,
      );

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      Invoice(
        idInvoice: json["id_invoice"],
        addressInvoice: json["address_invoice"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id_invoice": idInvoice,
        "address_invoice": addressInvoice,
      };
}

class Status {
  final int? id;
  final String? name;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Pivot? pivot;

  Status({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Status copyWith({
    int? id,
    String? name,
    dynamic createdAt,
    dynamic updatedAt,
    Pivot? pivot,
  }) =>
      Status(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory Status.fromJson(Map<String, dynamic> json) =>
      Status(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  final int? taskId;
  final int? taskStatusId;
  final DateTime? changedDate;
  final dynamic changedBy;

  Pivot({
    this.taskId,
    this.taskStatusId,
    this.changedDate,
    this.changedBy,
  });

  Pivot copyWith({
    int? taskId,
    int? taskStatusId,
    DateTime? changedDate,
    dynamic changedBy,
  }) =>
      Pivot(
        taskId: taskId ?? this.taskId,
        taskStatusId: taskStatusId ?? this.taskStatusId,
        changedDate: changedDate ?? this.changedDate,
        changedBy: changedBy ?? this.changedBy,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) =>
      Pivot(
        taskId: json["task_id"],
        taskStatusId: json["task_status_id"],
        changedDate: json["changed_date"] == null ? null : DateTime.parse(json["changed_date"]),
        changedBy: json["changed_by"],
      );

  Map<String, dynamic> toJson() =>
      {
        "task_id": taskId,
        "task_status_id": taskStatusId,
        "changed_date": changedDate?.toIso8601String(),
        "changed_by": changedBy,
      };
}
