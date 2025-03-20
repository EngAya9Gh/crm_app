
class DemandModel {
    final int? id;
    final String? title;
    final String? goal;
    final String? description;
    final String? status;
    final int? managementId;
    final String? management;
    final int? userId;
    final String? nameUser;
    final dynamic notes;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    DemandModel({
        this.id,
        this.title,
        this.goal,
        this.description,
        this.status,
        this.managementId,
        this.management,
        this.userId,
        this.nameUser,
        this.notes,
        this.createdAt,
        this.updatedAt,
    });

    DemandModel copyWith({
        int? id,
        String? title,
        String? goal,
        String? description,
        String? status,
        int? managementId,
        String? management,
        int? userId,
        String? nameUser,
        dynamic notes,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        DemandModel(
            id: id ?? this.id,
            title: title ?? this.title,
            goal: goal ?? this.goal,
            description: description ?? this.description,
            status: status ?? this.status,
            managementId: managementId ?? this.managementId,
            management: management ?? this.management,
            userId: userId ?? this.userId,
            nameUser: nameUser ?? this.nameUser,
            notes: notes ?? this.notes,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory DemandModel.fromJson(Map<String, dynamic> json) => DemandModel(
        id: json["id"],
        title: json["title"],
        goal: json["goal"],
        description: json["description"],
        status: json["status"],
        managementId: json["management_id"],
        management: json["management"],
        userId: json["user_id"],
        nameUser: json["name_user"],
        notes: json["notes"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "goal": goal,
        "description": description,
        "status": status,
        "management_id": managementId,
        "management": management,
        "user_id": userId,
        "name_user": nameUser,
        "notes": notes,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
