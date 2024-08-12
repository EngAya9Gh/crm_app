class clientMarketingReportModel {
  final String idUser;
  final String nameUser;
  final int count;

  const clientMarketingReportModel({
    required this.idUser,
    required this.nameUser,
    required this.count,
  });

  factory clientMarketingReportModel.fromMap(Map<String, dynamic> map) {
    return clientMarketingReportModel(
      idUser: map['id_user'].toString(),
      nameUser: map['nameUser'],
      count: map['count'],
    );
  }
}
