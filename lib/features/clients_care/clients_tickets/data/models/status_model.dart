class StatusModel {
  StatusModel({
    this.idTicketDetail,
    this.fkTicket,
    this.fkState,
    this.tag,
    this.notes,
    this.fkUser,
    this.userName,
    this.dateState,
    this.stateName,
  });

  StatusModel.fromJson(dynamic json) {
    idTicketDetail = json['id_ticket_detail'];
    fkTicket = json['fk_ticket'];
    fkState = json['fk_state'];
    tag = json['tag'];
    notes = json['notes'];
    fkUser = json['fk_user'];
    userName = json['userName'];
    dateState = json['date_state'];
    stateName = json['stateName'];
  }
  num? idTicketDetail;
  num? fkTicket;
  num? fkState;
  String? tag;
  String? notes;
  num? fkUser;
  String? userName;
  String? dateState;
  String? stateName;
  StatusModel copyWith({
    num? idTicketDetail,
    num? fkTicket,
    num? fkState,
    String? tag,
    String? notes,
    num? fkUser,
    String? userName,
    String? dateState,
    String? stateName,
  }) =>
      StatusModel(
        idTicketDetail: idTicketDetail ?? this.idTicketDetail,
        fkTicket: fkTicket ?? this.fkTicket,
        fkState: fkState ?? this.fkState,
        tag: tag ?? this.tag,
        notes: notes ?? this.notes,
        fkUser: fkUser ?? this.fkUser,
        userName: userName ?? this.userName,
        dateState: dateState ?? this.dateState,
        stateName: stateName ?? this.stateName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_ticket_detail'] = idTicketDetail;
    map['fk_ticket'] = fkTicket;
    map['fk_state'] = fkState;
    map['tag'] = tag;
    map['notes'] = notes;
    map['fk_user'] = fkUser;
    map['userName'] = userName;
    map['date_state'] = dateState;
    map['stateName'] = stateName;
    return map;
  }
}
