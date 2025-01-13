class VersionModel {
  final int? id;
  final String? versionNo;
  final String? management;
  final int? managementId;
  final String? title;
  final String? description;
  final DateTime? versionDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VersionModel({
    this.id,
    this.versionNo,
    this.management,
    this.managementId,
    this.title,
    this.description,
    this.versionDate,
    this.createdAt,
    this.updatedAt,
  });

  VersionModel copyWith({
    int? id,
    String? versionNo,
    String? management,
    int? managementId,
    String? title,
    String? description,
    DateTime? versionDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      VersionModel(
        id: id ?? this.id,
        versionNo: versionNo ?? this.versionNo,
        management: management ?? this.management,
        managementId: managementId ?? this.managementId,
        title: title ?? this.title,
        description: description ?? this.description,
        versionDate: versionDate ?? this.versionDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
    id: json["id"],
    versionNo: json["version_no"],
    management: json["management"],
    managementId: json["management_id"],
    title: json["title"],
    description: json["description"],
    versionDate: json["version_date"] == null ? null : DateTime.parse(json["version_date"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "version_no": versionNo,
    "management": management,
    "management_id": managementId,
    "title": title,
    "description": description,
    "version_date": versionDate?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
