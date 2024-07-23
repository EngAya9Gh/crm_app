class StateParticipateModel {
  final String id;
  final String fkParticipate;
  final String fkUser;
  final String state;
  final String dateState;
  final String reasonState;

  const StateParticipateModel({
    required this.id,
    required this.fkParticipate,
    required this.fkUser,
    required this.state,
    required this.dateState,
    required this.reasonState,
  });

  factory StateParticipateModel.fromMap(Map<String, dynamic> json) {
    return StateParticipateModel(
      id: json['id'].toString(),
      fkParticipate: json['fk_participate'].toString(),
      fkUser: json['fk_user'].toString(),
      state: json['state'],
      dateState: json['date_state'],
      reasonState: json['reason_state'],
    );
  }
}
