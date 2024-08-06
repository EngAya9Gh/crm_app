class CommunicationWithdrawalReasonModel {
  final String idReason;
  final String nameReason;
  final String type;
  final String fkUserAdd;
  final String dateAdd;

  const CommunicationWithdrawalReasonModel({
    required this.idReason,
    required this.nameReason,
    required this.type,
    required this.fkUserAdd,
    required this.dateAdd,
  });

  factory CommunicationWithdrawalReasonModel.fromJson(
      Map<String, dynamic> json) {
    return CommunicationWithdrawalReasonModel(
      idReason: json['id_reason'].toString(),
      nameReason: json['name_reason'],
      type: json['type'],
      fkUserAdd: json['fk_user_add'].toString(),
      dateAdd: json['date_add'],
    );
  }
}
