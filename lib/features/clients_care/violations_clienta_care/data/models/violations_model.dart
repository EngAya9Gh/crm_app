class ViolationModel {
  int? id;
  String? name;
  String? description;
  int? userId;
  String? user;
  int? managementId;
  String? management;
  int? violationTypeId;
  String? violationType;
  String? reason;
  String? acceptStatus;
  int? isAuto;
  String? createdAt;
  String? updatedAt;

  ViolationModel(
      {this.id,
        this.name,
        this.description,
        this.userId,
        this.managementId,
        this.violationTypeId,
        this.violationType,
        this.management,
        this.user,
        this.reason,
        this.acceptStatus,
        this.isAuto,
        this.createdAt,
        this.updatedAt});

  ViolationModel copyWith({
    int? id,
    String? name,
    String? description,
    int? userId,
    int? managementId,
    int? violationTypeId,
    String? reason,
    String? acceptStatus,
    int? isAuto,
    String? createdAt,
    String? updatedAt,
    String? violationType,
    String? management,
    String? user,

  }) =>
      ViolationModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        userId: userId ?? this.userId,
        managementId: managementId ?? this.managementId,
        violationTypeId: violationTypeId ?? this.violationTypeId,
        reason: reason ?? this.reason,
        acceptStatus: acceptStatus ?? this.acceptStatus,
        isAuto: isAuto ?? this.isAuto,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        violationType: violationType ?? this.violationType,
        user: user ?? this.user,
        management: management ?? this.management,
      );

  ViolationModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    userId = json['user_id'];
    managementId = json['management_id'];
    violationTypeId = json['violation_type_id'];
    reason = json['reason'];
    acceptStatus = json['accept_status'];
    isAuto = json['is_auto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    management = json['management'];
    user = json['user'];
    violationType = json['violationType'];
  }

}