
class SubscribedClientsModel {
  final int? id;
  final String? nameEnterprise;

  SubscribedClientsModel({
    this.id,
    this.nameEnterprise,
  });

  SubscribedClientsModel copyWith({
    int? id,
    String? nameEnterprise,
  }) =>
      SubscribedClientsModel(
        id: id ?? this.id,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      );

  factory SubscribedClientsModel.fromJson(Map<String, dynamic> json) => SubscribedClientsModel(
    id: json["id"],
    nameEnterprise: json["name_enterprise"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameEnterprise": nameEnterprise,
  };
}
