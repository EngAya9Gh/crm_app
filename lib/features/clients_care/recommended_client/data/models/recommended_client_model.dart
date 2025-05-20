
class RecommendClientsReports {
  final int? idClients;
  final String? nameEnterprise;
  final String? nameClient;
  final int? numberOfClientsRecommended;
  final int? number_of_clients_recommended_subscribed;

  RecommendClientsReports({
    this.idClients,
    this.nameEnterprise,
    this.nameClient,
    this.numberOfClientsRecommended,
    this.number_of_clients_recommended_subscribed,
  });

  RecommendClientsReports copyWith({
    int? idClients,
    String? nameEnterprise,
    String? nameClient,
    int? numberOfClientsRecommended,
    int? number_of_clients_recommended_subscribed,
  }) =>
      RecommendClientsReports(
        idClients: idClients ?? this.idClients,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
        nameClient: nameClient ?? this.nameClient,
        numberOfClientsRecommended: numberOfClientsRecommended ?? this.numberOfClientsRecommended,
        number_of_clients_recommended_subscribed: number_of_clients_recommended_subscribed ?? this.number_of_clients_recommended_subscribed,
      );

  factory RecommendClientsReports.fromJson(Map<String, dynamic> json) => RecommendClientsReports(
    idClients: json["id_clients"],
    nameEnterprise: json["name_enterprise"],
    nameClient: json["name_client"],
    numberOfClientsRecommended: json["number_of_clients_recommended"],
    number_of_clients_recommended_subscribed: json["number_of_clients_recommended_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "id_clients": idClients,
    "name_enterprise": nameEnterprise,
    "name_client": nameClient,
    "number_of_clients_recommended": numberOfClientsRecommended,
    "number_of_clients_recommended_subscribed": number_of_clients_recommended_subscribed,
  };
}
