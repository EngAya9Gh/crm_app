import 'package:equatable/equatable.dart';

class ClientDateModel extends Equatable {
  final String? idclientsDate;
  final DateTime? dateClientVisit;
  final int? fkUser;
  final int? fkUserDone;
  final bool? isDone;
  final DateTime? dateDone;
  final String? fkClient;
  final String? fkInvoice;
  final String? typeDate;
  final String? processReason;
  final String? reasonCancel;
  final int? fkUserUpdate;
  final String? fkAgent;
  final DateTime? dateEnd;
  final int? fkUserAdd;
  final DateTime? dateUpdateVisit;
  final DateTime? dateCreate;
  final bool? force;
  final bool? isDoneInstall;
  final String? nameCityClient;
  final String? nameEnterprise;
  final String? nameAgent;
  final String? typeAgent;
  final String? nameUser;
  final String? nameCity;
  final String? nameUserAdd;
  final String? nameUserUpdate;
  final String? nameUserClose;

  ClientDateModel({
    this.idclientsDate,
    this.dateClientVisit,
    this.fkUser,
    this.fkUserDone,
    this.isDone,
    this.dateDone,
    this.fkClient,
    this.fkInvoice,
    this.typeDate,
    this.processReason,
    this.reasonCancel,
    this.fkUserUpdate,
    this.fkAgent,
    this.dateEnd,
    this.fkUserAdd,
    this.dateUpdateVisit,
    this.dateCreate,
    this.force,
    this.isDoneInstall,
    this.nameCityClient,
    this.nameEnterprise,
    this.nameAgent,
    this.typeAgent,
    this.nameUser,
    this.nameCity,
    this.nameUserAdd,
    this.nameUserUpdate,
    this.nameUserClose,
  });

  factory ClientDateModel.fromJson(Map<String, dynamic> json) {
    return ClientDateModel(
      idclientsDate: json['idclients_date'],
      dateClientVisit: json['date_client_visit'] != null ? DateTime.parse(json['date_client_visit']) : null,
      fkUser: json['fk_user'],
      fkUserDone: json['fk_user_done'],
      isDone: json['is_done'] == 1 ? true : null,
      dateDone: json['date_done'] != null ? DateTime.parse(json['date_done']) : null,
      fkClient: json['fk_client'],
      fkInvoice: json['fk_invoice'],
      typeDate: json['type_date'],
      processReason: json['processReason'],
      reasonCancel: json['reason_cancel'],
      fkUserUpdate: json['fk_user_update'],
      fkAgent: json['fk_agent'],
      dateEnd: json['date_end'] != null ? DateTime.parse(json['date_end']) : null,
      fkUserAdd: json['fk_user_add'],
      dateUpdateVisit: json['date_update_visit'] != null ? DateTime.parse(json['date_update_visit']) : null,
      dateCreate: json['date_create'] != null ? DateTime.parse(json['date_create']) : null,
      force: json['force'] == "1" ? true : null,
      isDoneInstall: json['isdoneinstall'] == "1" ? true : null,
      nameCityClient: json['name_city_client'],
      nameEnterprise: json['name_enterprise'],
      nameAgent: json['name_agent'],
      typeAgent: json['type_agent'],
      nameUser: json['nameUser'],
      nameCity: json['name_city'],
      nameUserAdd: json['nameUserAdd'],
      nameUserUpdate: json['nameUserUpdate'],
      nameUserClose: json['nameUserClose'],
    );
  }

  @override
  List<Object?> get props => [
    idclientsDate,
    dateClientVisit,
    fkUser,
    fkUserDone,
    isDone,
    dateDone,
    fkClient,
    fkInvoice,
    typeDate,
    processReason,
    reasonCancel,
    fkUserUpdate,
    fkAgent,
    dateEnd,
    fkUserAdd,
    dateUpdateVisit,
    dateCreate,
    force,
    isDoneInstall,
    nameCityClient,
    nameEnterprise,
    nameAgent,
    typeAgent,
    nameUser,
    nameCity,
    nameUserAdd,
    nameUserUpdate,
    nameUserClose,
  ];
}