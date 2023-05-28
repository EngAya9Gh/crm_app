class CommunicationModel {
  CommunicationModel({
    required this.idCommunication,
    required this.fkClient,
    required this.fkUser,
    required this.dateCommunication,
    this.result,
    this.notes,
    required this.rate,
    required this.typeCommuncation,
    required this.number_wrong,
    required this.clientRepeat,
    required this.dateNext,
    required this.nameEnterprise,
    required this.nameUser,
    required this.id_invoice,
    required this.date_create,
    this.hoursdelaylabel,
    this.type_install,
    this.date_last_com_install,
    required this.dateinstall_done,
     this.mobile,
     this.name_regoin,
     this.fk_regoin,
     this.nameClient,
  });
  late final String idCommunication;
  late final String fkClient;
  String? fkUser;
  late final String? dateCommunication;
  late final String? date_last_com_install;
  late final String? result;
  late final String? notes;
  late final String? rate;
  late final String? typeCommuncation;
  late final String? number_wrong;
  late final String? clientRepeat;
  late final String? dateNext;
  late final String nameEnterprise;
  late final String? nameUser;
  late final String? id_invoice;
  late final String? date_create;
  late final String? date_approve;
  late final String? dateinstall_done;
  late final String? mobile;
  late final String? name_regoin;
  late final String? fk_regoin;
  late final String? nameClient;
  late   String? type_install;
  late  String? hoursdelaylabel;

  CommunicationModel.fromJson(Map<String, dynamic> json){
    idCommunication = json['id_communication'];
    fkClient = json['fk_client'];
    hoursdelaylabel = json['hoursdelaylabel'];
    fkUser = json['fk_user'];
    dateCommunication = json['date_communication'];
    result = json['result'];;
    notes = json['notes'];;
    rate = json['rate'];
    typeCommuncation = json['type_communcation'];
    number_wrong = json['number_wrong'];
    clientRepeat = json['client_repeat'];
    dateNext = json['date_next'];
    nameEnterprise = json['name_enterprise'];
    nameUser = json['nameUser'];
    id_invoice = json['id_invoice'];
    date_create = json['date_create'];
    date_approve = json['date_approve'];
    dateinstall_done = json['dateinstall_done'];
    mobile = json['mobile'];
    name_regoin = json['name_regoin'];
    fk_regoin = json['fk_regoin'];
    nameClient = json['nameClient'];
    type_install = json['type_install'];
    date_last_com_install = json['date_last_com_install'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_communication'] = idCommunication;
    _data['fk_client'] = fkClient;
    _data['hoursdelaylabel'] = hoursdelaylabel;
    _data['fk_user'] = fkUser;
    _data['date_communication'] = dateCommunication;
    _data['result'] = result;
    _data['notes'] = notes;
    _data['rate'] = rate;
    _data['type_communcation'] = typeCommuncation;
    _data['number_wrong'] = number_wrong;
    _data['client_repeat'] = clientRepeat;
    _data['date_next'] = dateNext;
    _data['name_enterprise'] = nameEnterprise;
    _data['nameUser'] = nameUser;
    _data['id_invoice'] = id_invoice;
    _data['date_create'] = date_create;
    _data['date_approve'] = date_approve;
    _data['dateinstall_done'] = dateinstall_done;
    _data['mobile'] = mobile;
    _data['fk_regoin'] = fk_regoin;
    _data['name_regoin'] = name_regoin;
    _data['nameClient'] = nameClient;
    _data['type_install'] = type_install;
    _data['date_last_com_install'] = date_last_com_install;
    return _data;
  }
}