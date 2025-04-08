class SearchClientModel {
  final String? nameClient;
  final String? mobile;
  final String? idClients;
  final String? nameEnterprise;
  String? get name => nameClient;
  String? get phone => mobile;
  String? get id => idClients;
  String? get enterpriseName => nameEnterprise;
  SearchClientModel({
    this.nameClient,
    this.mobile,
    this.idClients,
    this.nameEnterprise
  });

  factory SearchClientModel.fromJson(Map<String, dynamic> json) {
    return SearchClientModel(
      nameClient: json['name_client']?.toString(),
      mobile: json['mobile']?.toString(),
      idClients: json['id_clients']?.toString(),
      nameEnterprise: json['name_enterprise']?.toString(),
    );
  }
} 