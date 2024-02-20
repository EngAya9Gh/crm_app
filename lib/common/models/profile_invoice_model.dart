import 'package:equatable/equatable.dart';

class ProfileInvoiceModel extends Equatable {
  int? idInvoice;
  String? dateCreate;
  int? fkIdClient;
  String? fkIdUser;
  String? notes;
  String? total;
  String? dateinstallDone;
  String? dateApprove;
  String? addressInvoice;
  String? invoiceSource;
  String? amountPaid;
  String? renewYear;
  String? dateFApprove;
  String? stateclient;
  String? approveBackDone;
  String? isApprove;
  String? nameRegoin;
  String? nameEnterpriseinv;
  String? currencyName;
  String? nameCountry;
  String? nameUser;
  int? fkCountry;
  String? nameEnterprise;

  ProfileInvoiceModel({
    this.idInvoice,
    this.dateCreate,
    this.fkIdClient,
    this.fkIdUser,
    this.notes,
    this.total,
    this.dateinstallDone,
    this.dateApprove,
    this.addressInvoice,
    this.invoiceSource,
    this.amountPaid,
    this.renewYear,
    this.dateFApprove,
    this.stateclient,
    this.approveBackDone,
    this.isApprove,
    this.nameRegoin,
    this.nameEnterpriseinv,
    this.currencyName,
    this.nameCountry,
    this.nameUser,
    this.fkCountry,
    this.nameEnterprise,
  });

  ProfileInvoiceModel.fromJson(Map<String, dynamic> json) {
    idInvoice = json['id_invoice'];
    dateCreate = json['date_create'];
    fkIdClient = json['fk_idClient'];
    fkIdUser = json['fk_idUser'];
    notes = json['notes'];
    total = json['total'];
    dateinstallDone = json['dateinstall_done'];
    dateApprove = json['date_approve'];
    addressInvoice = json['address_invoice'];
    invoiceSource = json['invoice_source'];
    amountPaid = json['amount_paid'];
    renewYear = json['renew_year'];
    dateFApprove = json['Date_FApprove'];
    stateclient = json['stateclient'];
    approveBackDone = json['approve_back_done'] != null
        ? json['approve_back_done'].toString()
        : json['approve_back_done'];
    isApprove = json['isApprove'];
    nameRegoin = json['name_regoin'];
    nameEnterpriseinv = json['name_enterpriseinv'];
    currencyName = json['currency_name'];
    nameCountry = json['nameCountry'];
    nameUser = json['nameUser'];
    fkCountry = json['fk_country'];
    nameEnterprise = json['name_enterprise'];
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
    data['date_approve'] = this.dateApprove;
    data['address_invoice'] = this.addressInvoice;
    data['invoice_source'] = this.invoiceSource;
    data['amount_paid'] = this.amountPaid;
    data['renew_year'] = this.renewYear;
    data['Date_FApprove'] = this.dateFApprove;
    data['stateclient'] = this.stateclient;
    data['approve_back_done'] = this.approveBackDone;
    data['isApprove'] = this.isApprove;
    data['name_regoin'] = this.nameRegoin;
    data['name_enterpriseinv'] = this.nameEnterpriseinv;
    data['currency_name'] = this.currencyName;
    data['nameCountry'] = this.nameCountry;
    data['nameUser'] = this.nameUser;
    data['fk_country'] = this.fkCountry;
    data['name_enterprise'] = this.nameEnterprise;
    return data;
  }

  @override
  List<Object?> get props => [
        this.idInvoice,
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
        this.fkCountry
      ];
}
