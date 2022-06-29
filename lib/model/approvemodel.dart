class ApproveModel {
  ApproveModel({
    required this.idApproveClient,
    required this.fkUser,
    required this.fkClient,
    required this.dateApprove,
    required this.isApprove,
    required this.nameCountry,
    required this.nameRegoin,
    required this.nameUser,
    required this.name_enterprise,
    required this.fk_regoin,
    required this.fk_country,
    required this.fk_invoice,

  });
  late final String idApproveClient;
  late final String fkUser;
  late final String fkClient;
  late final String? dateApprove;
  late final String isApprove;
  late final String nameCountry;
  late final String nameRegoin;
  late final String nameUser;
  late final String name_enterprise;
  late final String fk_regoin;
  late final String fk_country;
  late final String? fk_invoice;

  ApproveModel.fromJson(Map<String, dynamic> json){
    idApproveClient = json['id_approveClient'];
    fkUser = json['fk_user'];
    fkClient = json['fk_client'];
    dateApprove = json['date_approve'];
    isApprove = json['is_approve'];
    nameCountry = json['nameCountry'];
    nameRegoin = json['name_regoin'];
    nameUser = json['nameUser'];
    name_enterprise = json['name_enterprise'];
    fk_regoin = json['fk_regoin'];
    fk_country = json['fk_country'];
    fk_invoice = json['fk_invoice'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_approveClient'] = idApproveClient;
    _data['fk_user'] = fkUser;
    _data['fk_client'] = fkClient;
    _data['date_approve'] = dateApprove;
    _data['is_approve'] = isApprove;
    _data['nameCountry'] = nameCountry;
    _data['name_regoin'] = nameRegoin;
    _data['nameUser'] = nameUser;
    _data['name_enterprise'] = name_enterprise;
    _data['fk_regoin'] = fk_regoin;
    _data['fk_country'] = fk_country;
    _data['fk_invoice'] = fk_invoice;
    return _data;
  }
}