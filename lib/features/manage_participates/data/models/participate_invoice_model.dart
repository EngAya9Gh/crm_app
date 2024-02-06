

import 'package:equatable/equatable.dart';

class ParticipateInvoiceModel extends Equatable {
 int? idInvoice;
  String? dateCreate;
  int? fkIdClient;
  String? fkIdUser;
  String? notes;
  String? total;
  String? dateinstallDone;
  String? stateclient;
  String? dateApprove;
  String? addressInvoice;
  String? invoiceSource;
  String? amountPaid;
  String? renewYear;
  String? nameCountry;
  String? nameRegoin;
  String? nameUser;
  int? fkCountry;

  ParticipateInvoiceModel(
       {this.idInvoice,
      this.dateCreate,
      this.fkIdClient,
      this.fkIdUser,
      this.notes,
      this.total,
      this.dateinstallDone,
      this.stateclient,
      this.dateApprove,
      this.addressInvoice,
      this.invoiceSource,
      this.amountPaid,
      this.renewYear,
      this.nameCountry,
      this.nameRegoin,
      this.nameUser,
      this.fkCountry});

  ParticipateInvoiceModel.fromJson(Map<String, dynamic> json) {
    idInvoice = json['id_invoice'];
    dateCreate = json['date_create'];
    fkIdClient = json['fk_idClient'];
    fkIdUser = json['fk_idUser'];
    notes = json['notes'];
    total = json['total'];
    dateinstallDone = json['dateinstall_done'];
    stateclient = json['stateclient'];
    dateApprove = json['date_approve'];
    addressInvoice = json['address_invoice'];
    invoiceSource = json['invoice_source'];
    amountPaid = json['amount_paid'];
    renewYear = json['renew_year'];
    nameCountry = json['nameCountry'];
    nameRegoin = json['name_regoin'];
    nameUser = json['nameUser'];
    fkCountry = json['fk_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_invoice'] = this.idInvoice;
    data['date_create'] = this.dateCreate;
    data['fk_idClient'] = this.fkIdClient;
    data['fk_idUser'] = this.fkIdUser;
    data['notes'] = this.notes;
    data['total'] = this.total;
    data['dateinstall_done'] = this.dateinstallDone;
    data['stateclient'] = this.stateclient;
    data['date_approve'] = this.dateApprove;
    data['address_invoice'] = this.addressInvoice;
    data['invoice_source'] = this.invoiceSource;
    data['amount_paid'] = this.amountPaid;
    data['renew_year'] = this.renewYear;
    data['nameCountry'] = this.nameCountry;
    data['name_regoin'] = this.nameRegoin;
    data['nameUser'] = this.nameUser;
    data['fk_country'] = this.fkCountry;
    return data;
  }
  
  @override
  List<Object?> get props => [
  this.idInvoice,this.dateCreate,this.fkIdClient,this.fkIdUser,this.notes,this.total,this.dateinstallDone,this.stateclient,this.dateApprove,this.addressInvoice,this.invoiceSource,this.amountPaid,this.renewYear,this.nameCountry,this.nameRegoin,this.nameUser,this.fkCountry
  ];
}