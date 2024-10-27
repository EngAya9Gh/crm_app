class Violations_Model {
  int? id;
  String? name;
  String? description;
  int? userId;
  int? managementId;
  int? violationTypeId;
  String? reason;
  String? acceptStatus;
  int? isAuto;
  String? createdAt;
  String? updatedAt;

  Violations_Model(
      {this.id,
        this.name,
        this.description,
        this.userId,
        this.managementId,
        this.violationTypeId,
        this.reason,
        this.acceptStatus,
        this.isAuto,
        this.createdAt,
        this.updatedAt});

  Violations_Model copyWith({
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
  }) =>
      Violations_Model(
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
      );

  Violations_Model.fromJson(dynamic json) {
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
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] =description;
    map['user_id'] = userId;
    map['management_id'] = managementId;
    map['violation_type_id'] = violationTypeId;
    map['reason'] = reason;
    map['accept_status'] = acceptStatus;
    map['is_auto'] = isAuto;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}