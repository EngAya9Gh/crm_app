import 'package:crm_smart/core/common/enums/ticket_source_enum.dart';

import 'transfer_ticket.dart';

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
    this.ticketSource,
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
  late final String? clientType;
  late final TicketSourceEnums? ticketSource;

  late final String? nameClient;
  late final String? nameEnterprise;
  late final String? nameRegoin;
  late final String? nameuseropen;
  late final String? nameuserrecive;
  late final String? nameuserclose;
  late final String? fk_country;

  late final String? mobile;
  late final String? rate;
  late final String? fkuser_rate;
  late final String? date_rate;
  late final String? nameuserrate;
  late final String? notes_rate;

  late List<TransferTicket?>? transferticket = [];

  TicketModel.fromJson(Map<String, dynamic> json) {
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
    ticketSource = TicketSourceEnumsExtension.fromString(json['ticket_source']);
    mobile = json['mobile'];
    rate = json['rate'];
    fkuser_rate = json['fkuser_rate'];
    date_rate = json['date_rate'];
    nameuserrate = json['nameuserrate'];
    notes_rate = json['notes_rate'];
    transferticket = getproud(json['transferticket']);
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
    _data['ticket_source'] = ticketSource?.text;

    _data['name_client'] = nameClient;
    _data['name_enterprise'] = nameEnterprise;
    _data['name_regoin'] = nameRegoin;
    _data['nameuseropen'] = nameuseropen;
    _data['nameuserrecive'] = nameuserrecive;
    _data['nameuserclose'] = nameuserclose;
    _data['fk_country'] = fk_country;

    _data['mobile'] = mobile;
    _data['rate'] = rate;
    _data['fkuser_rate'] = fkuser_rate;
    _data['date_rate'] = date_rate;
    _data['nameuserrate'] = nameuserrate;
    _data['notes_rate'] = notes_rate;
    _data['transferticket'] = transferticket!.map((e) => e!.toJson()).toList();
    return _data;
  }

  List<TransferTicket> getproud(data) {
    List<TransferTicket> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(TransferTicket.fromJson(data[i]));
      }
    }
    return prodlist;
  }
}
