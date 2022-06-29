class TicketModel {
  TicketModel({
    required this.idTicket,
    required this.fkClient,
    required this.typeProblem,
    required this.detailsProblem,
    required this.notesTicket,
    required this.typeTicket,
    required this.fkUserOpen,
    required this.fkUserClose,
    required this.fkUserRecive,
    required this.dateOpen,
    required this.dateClose,
    required this.dateRecive,
    required this.clientType,

    required this.nameClient,
    required this.nameEnterprise,
    required this.nameRegoin,
    required this.nameuseropen,
    required this.nameuserrecive,
    required this.nameuserclose,
    required this.fk_country,

     this.mobile,
     this.transferticket,

  });
  late final String idTicket;
  late final String? fkClient;
  late final String? typeProblem;
  late final String? detailsProblem;
  late final String? notesTicket;
  late final String? typeTicket;
  late final String? fkUserOpen;
  late final String? fkUserClose;
  late final String? fkUserRecive;
  late final String? dateOpen;
  late final String? dateClose;
  late final String? dateRecive;
  late final String?  clientType;

  late final String? nameClient;
  late final String? nameEnterprise;
  late final String? nameRegoin;
  late final String? nameuseropen;
  late final String? nameuserrecive;
  late final String? nameuserclose;
  late final String? fk_country;

  late final String? mobile;
  late List<TransferTicket?>? transferticket=[];

  TicketModel.fromJson(Map<String, dynamic> json){
    idTicket = json['id_ticket'];
    fkClient = json['fk_client'];
    typeProblem = json['type_problem'];
    detailsProblem = json['details_problem'];
    notesTicket = json['notes_ticket'];
    typeTicket = json['type_ticket'];
    fkUserOpen = json['fk_user_open'];
    fkUserClose = json['fk_user_close'];
    fkUserRecive = json['fk_user_recive'];
    dateOpen = json['date_open'];
    dateClose = json['date_close'];
    dateRecive = json['date_recive'];
    clientType = json['client_type'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    nameRegoin = json['name_regoin'];
    nameuseropen = json['nameuseropen'];
    nameuserrecive = json['nameuserrecive'];
    nameuserclose = json['nameuserclose'];
    fk_country = json['fk_country'];

    mobile = json['mobile'];
    transferticket=getproud(json['transferticket']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_ticket'] = idTicket;
    _data['fk_client'] = fkClient;
    _data['type_problem'] = typeProblem;
    _data['details_problem'] = detailsProblem;
    _data['notes_ticket'] = notesTicket;
    _data['type_ticket'] = typeTicket;
    _data['fk_user_open'] = fkUserOpen;
    _data['fk_user_close'] = fkUserClose;
    _data['fk_user_recive'] = fkUserRecive;
    _data['date_open'] = dateOpen;
    _data['date_close'] = dateClose;
    _data['date_recive'] = dateRecive;
    _data['client_type'] = clientType;

    _data['name_client'] = nameClient;
    _data['name_enterprise'] = nameEnterprise;
    _data['name_regoin'] = nameRegoin;
    _data['nameuseropen'] = nameuseropen;
    _data['nameuserrecive'] = nameuserrecive;
    _data['nameuserclose'] = nameuserclose;
    _data['fk_country'] = fk_country;

    _data['mobile'] = mobile;
    _data['transferticket'] =
        transferticket!.map((e)=>e!.toJson()).toList();
    return _data;
  }
  List<TransferTicket> getproud(data){
    List<TransferTicket> prodlist = [];
    if(data!=null){
      for (int i = 0; i < data.length; i++) {
        prodlist.add(TransferTicket.fromJson(data[i]));
      }
    }
    return prodlist;

  }
}
class TransferTicket{
  TransferTicket({
    required this.id_tr_ticket,
    required this.	resoantransfer_ticket,
    required this.	fkuser_to,
    required this.fkuserfrom,
    required this.date_assigntr,
    required this.fk_ticket,
    required this.nameuserto,
    required this.nameuserfrom,
  });
  late  String? id_tr_ticket;
  late  String? 	resoantransfer_ticket;
  late  String? 	fkuser_to;
  late  String? fkuserfrom;
  late  String? date_assigntr;
  late  String? fk_ticket;
  late  String? nameuserto;
  late  String? nameuserfrom;



  TransferTicket.fromJson(Map<String, dynamic> json){

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
    _data['resoantransfer_ticket'] = 	resoantransfer_ticket;
    _data['fkuser_to'] = 	fkuser_to;
    _data['fkuserfrom'] = fkuserfrom;
    _data['date_assigntr'] = date_assigntr;
    _data['fk_ticket'] = fk_ticket;
    _data['nameuserfrom'] = nameuserfrom;
    _data['nameuserto'] = nameuserto;

    return _data;
  }
}