import 'package:equatable/equatable.dart';

class ClientActivityModel extends Equatable {
  final int id;
  final String activityTypeId;
  final String name;
  final String type;
  final String? fkUser;
  final String? nameUser;
  final String? fkClient;
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
  final String? entityType;
  final String? entityId;
  final ActivityEntity? activityEntity;

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
    this.entityType,
    this.entityId,
    this.activityEntity,
  });

  factory ClientActivityModel.fromJson(Map<String, dynamic> json) {
    return ClientActivityModel(
      id: json['id'],
      activityTypeId: json['activity_type_id'] == null ? '' : json['activity_type_id'].toString(),
      name: json['name'],
      type: json['type'],
      fkUser: json['fk_user'] == null ? null : json['fk_user'].toString(),
      nameUser: json['nameUser'] == null ? null : json['nameUser'].toString(),
      fkClient: json['fk_client'] == null ? null : json['fk_client'].toString(),
      nameEnterprise: json['name_enterprise'] == null ? "" : json['name_enterprise'].toString(),
      startDate: json['start_date'] == null ? null : DateTime.parse(json['start_date']),
      endDate: json['end_date'] == null ? null : DateTime.parse(json['end_date']),
      wholeDay: json['whole_day'] == 1,
      state: json['state'] == null ? "" : json['state'].toString(),
      priority: json['priority'] == null ? "" : json['priority'].toString(),
      description: json['description'] == null ? null : json['description'].toString(),
      files: json['files'] == null ? null : json['files'].toString(),
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at']),
      entityType: json['entity_type']==null?null:json['entity_type'].toString(),
      entityId: json['entity_id']==null?null:json['entity_id'].toString(),
      activityEntity:json['entity']==null?null: ActivityEntity.fromJson(json['entity']),
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
    entityType,
    entityId,
    activityEntity,
  ];
}

class ActivityEntity extends Equatable {
  final int? idClients;
  final String? nameClient;
  final String? nameEnterprise;
  final String? city;
  final String? location;
  final int? fkRegion;
  final DateTime? dateCreate;
  final DateTime? receivedDate;
  final String? typeClient;
  final String? fkUser;
  final String? mobile;
  final String? addressClient;
  final String? userAddEmail;
  final String? idCustomer;
  final String? descActivController;
  final String? sourceClient;
  final String? serialNumber;
  final String? referenceNo;
  final DateTime? dateUpdate;
  final String? priority;
  final int? force;
  final String? type;
  final String? deletedAt;

  ActivityEntity({
    this.idClients,
    this.nameClient,
    this.nameEnterprise,
    this.city,
    this.location,
    this.fkRegion,
    this.dateCreate,
    this.receivedDate,
    this.typeClient,
    this.fkUser,
    this.mobile,
    this.addressClient,
    this.userAddEmail,
    this.idCustomer,
    this.descActivController,
    this.sourceClient,
    this.serialNumber,
    this.referenceNo,
    this.dateUpdate,
    this.priority,
    this.force,
    this.type,
    this.deletedAt,
  });

  factory ActivityEntity.fromJson(Map<String, dynamic> json) {
    return ActivityEntity(
      idClients: json['id_clients'],
      nameClient: json['name_client'],
      nameEnterprise: json['name_enterprise'],
      city: json['city'],
      location: json['location'],
      fkRegion: json['fk_regoin'],
      dateCreate: json['date_create'] == null ? null : DateTime.parse(json['date_create']),
      receivedDate: json['received_date'] == null ? null : DateTime.parse(json['received_date']),
      typeClient: json['type_client'],
      fkUser: json['fk_user'] == null ? null : json['fk_user'].toString(),
      mobile: json['mobile'],
      addressClient: json['address_client'],
      userAddEmail: json['userAdd_email'],
      idCustomer: json['IDcustomer'],
      descActivController: json['descActivController'],
      sourceClient: json['sourcclient'],
      serialNumber: json['SerialNumber'],
      referenceNo: json['reference_no'],
      dateUpdate: json['date_update'] == null ? null : DateTime.parse(json['date_update']),
      priority: json['priority'],
      force: json['force'],
      type: json['type'],
      deletedAt: json['deleted_at'],
    );
  }

  @override
  List<Object?> get props => [
    idClients,
    nameClient,
    nameEnterprise,
    city,
    location,
    fkRegion,
    dateCreate,
    receivedDate,
    typeClient,
    fkUser,
    mobile,
    addressClient,
    userAddEmail,
    idCustomer,
    descActivController,
    sourceClient,
    serialNumber,
    referenceNo,
    dateUpdate,
    priority,
    force,
    type,
    deletedAt,
  ];
}