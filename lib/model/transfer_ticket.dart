class TransferTicket {
  TransferTicket({
    required this.id_tr_ticket,
    required this.resoantransfer_ticket,
    required this.fkuser_to,
    required this.fkuserfrom,
    required this.date_assigntr,
    required this.fk_ticket,
    required this.nameuserto,
    required this.nameuserfrom,
  });
  late String? id_tr_ticket;
  late String? resoantransfer_ticket;
  late String? fkuser_to;
  late String? fkuserfrom;
  late String? date_assigntr;
  late String? fk_ticket;
  late String? nameuserto;
  late String? nameuserfrom;

  TransferTicket.fromJson(Map<String, dynamic> json) {
    id_tr_ticket = json['id_tr_ticket'];
    resoantransfer_ticket = json['resoantransfer_ticket'];
    fkuser_to = json['fkuser_to'];
    fkuserfrom = json['fkuserfrom'];
    date_assigntr = json['date_assigntr'];
    fk_ticket = json['fk_ticket'];
    nameuserfrom = json['nameuserfrom'];
    nameuserto = json['nameuserto'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_tr_ticket'] = id_tr_ticket;
    _data['resoantransfer_ticket'] = resoantransfer_ticket;
    _data['fkuser_to'] = fkuser_to;
    _data['fkuserfrom'] = fkuserfrom;
    _data['date_assigntr'] = date_assigntr;
    _data['fk_ticket'] = fk_ticket;
    _data['nameuserfrom'] = nameuserfrom;
    _data['nameuserto'] = nameuserto;

    return _data;
  }
}
