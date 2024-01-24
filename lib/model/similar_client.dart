


class SimilarClient {
  SimilarClient({
    required this.name_enterprise,
    required this.name_client,
    required this.id_clients,
    required this.date_create,
    required this.phone,
  });

  late  String name_enterprise;
  late  String name_client;
  late final String id_clients;
  late final String date_create;
  late final String? phone;

  SimilarClient.fromJson(Map<String, dynamic> json){
    name_enterprise = json['name_enterprise'];
    name_client = json['name_client'];
    id_clients = json['id_clients'].toString();
    date_create = json['date_create'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name_enterprise'] = name_enterprise;
    _data['name_client'] = name_client;
    _data['id_clients'] = id_clients;
    _data['date_create'] = date_create;
    _data['phone'] = phone;
    return _data;
  }

}