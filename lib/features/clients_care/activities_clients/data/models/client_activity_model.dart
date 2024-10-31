import 'package:equatable/equatable.dart';

class ClientActivityModel extends Equatable {
  final int id;
  final int activityTypeId;
  final String name;
  final String type;
  final String? fkUser;
  final String? nameUser;
  final int fkClient;
  final String nameEnterprise;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool wholeDay;
  final String state;
  final String priority;
  final String? description;
  final String? files;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ClientActivityModel({
    required this.id,
    required this.activityTypeId,
    required this.name,
    required this.type,
     this.fkUser,
     this.nameUser,
    required this.fkClient,
    required this.nameEnterprise,
     this.startDate,
     this.endDate,
    required this.wholeDay,
    required this.state,
    required this.priority,
     this.description,
     this.files,
     this.createdAt,
     this.updatedAt,
  });

  factory ClientActivityModel.fromJson(Map<String, dynamic> json) {
    return ClientActivityModel(
      id: json['id'],
      activityTypeId: json['activity_type_id'],
      name: json['name'],
      type: json['type'],
      fkUser: json['fk_user'] == null ? null : json['fk_user'].toString(),
      nameUser: json['nameUser'] == null ? null : json['nameUser'].toString(),
      fkClient: json['fk_client'] == null ? null : json['fk_client'],
      nameEnterprise: json['name_enterprise'] == null ? "" : json['name_enterprise'].toString(),
      startDate: json['startDate'] == null ? null : DateTime.parse(json['start_date']),
      endDate: json['endDate'] == null ? null : DateTime.parse(json['endDate']),
      wholeDay: json['whole_day'] == 1,
      state: json['state'] == null ? "" : json['state'].toString(),
      priority: json['priority'] == null ? "" : json['priority'].toString(),
      description: json['description'] == null ? null : json['description'].toString(), // Check for null
      files: json['files'] == null ?null : json['files'].toString(),
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt']),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    activityTypeId,
    name,
    type,
    fkUser,
    nameUser,
    fkClient,
    nameEnterprise,
    startDate,
    endDate,
    wholeDay,
    state,
    priority,
    description,
    files,
    createdAt,
    updatedAt,
  ];
}