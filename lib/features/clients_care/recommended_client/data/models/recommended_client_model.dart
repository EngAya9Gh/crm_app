
class RecommendClientsReports {
  final int? idClients;
  final String? nameEnterprise;
  final String? nameClient;
  final int? numberOfClientsRecommended;

  RecommendClientsReports({
    this.idClients,
    this.nameEnterprise,
    this.nameClient,
    this.numberOfClientsRecommended,
  });

  RecommendClientsReports copyWith({
    int? idClients,
    String? nameEnterprise,
    String? nameClient,
    int? numberOfClientsRecommended,
  }) =>
      RecommendClientsReports(
        idClients: idClients ?? this.idClients,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
        nameClient: nameClient ?? this.nameClient,
        numberOfClientsRecommended: numberOfClientsRecommended ?? this.numberOfClientsRecommended,
      );

  factory RecommendClientsReports.fromJson(Map<String, dynamic> json) => RecommendClientsReports(
    idClients: json["id_clients"],
    nameEnterprise: json["name_enterprise"],
    nameClient: json["name_client"],
    numberOfClientsRecommended: json["number_of_clients_recommended"],
  );

  Map<String, dynamic> toJson() => {
    "id_clients": idClients,
    "name_enterprise": nameEnterprise,
    "name_client": nameClient,
    "number_of_clients_recommended": numberOfClientsRecommended,
  };
}
