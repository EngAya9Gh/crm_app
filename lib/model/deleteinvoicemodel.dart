class DeletedinvoiceModel {
  DeletedinvoiceModel({
     this.idDeleteInvoice,
    required this.fkUser,
    required this.fkClient,
    required this.dateDelete,
     this.nameEnterprise,
     this.nameClient,
     this.mobileclient,
     this.city,
     this.nameUser,//user delete
     this.email,
     this.mobileuser,
  });
  late final String? idDeleteInvoice;
  late final String? fkUser;
  late final String? fkClient;
  late final String dateDelete;
  late final String? nameEnterprise;
  late final String? nameClient;
  late final String? mobileclient;
   late final String? city;
   late final String? nameUser;
   late final String? email;
   late final String? mobileuser;

  DeletedinvoiceModel.fromJson(Map<String, dynamic> json){
    idDeleteInvoice = json['id_deleteInvoice'];
    fkUser = json['fk_user'];
    fkClient = json['fk_client'];
    dateDelete = json['date_delete'];
    nameEnterprise = json['name_enterprise'];
    nameClient = json['name_client'];
    mobileclient = json['mobile'];
    city = json['city'];
    nameUser = json['nameUser'];
    email = json['email'];
    mobileuser = json['mobileuser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_deleteInvoice'] = idDeleteInvoice;
    _data['fk_user'] = fkUser;
    _data['fk_client'] = fkClient;
    _data['date_delete'] = dateDelete;
    _data['name_enterprise'] = nameEnterprise;
    _data['name_client'] = nameClient;
    _data['mobile'] = mobileclient;
    _data['city'] = city;
    _data['nameUser'] = nameUser;
    _data['email'] = email;
    _data['mobileuser'] = mobileuser;
    return _data;
  }
}