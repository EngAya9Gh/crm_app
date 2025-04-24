class WithdrawnDetailsModel {
  String? nameUser;
  String? reasonBack;
  String? idUserBack;
  String? descReasonBack;
  String? dateChangeBack;
  String? valueBack;
  String? typeBack;
  String? fileReject;
  String? approveBackDone;
  String? dateBackNow;
  String? rateProduct;
  String? rateSales;
  String? rateSupport;
  String? idRequest;
  List<String>? reasonBackPrimary;
  List<String>? reasonBackSecondary;

  WithdrawnDetailsModel({
    this.nameUser,
    this.reasonBack,
    this.reasonBackPrimary,
    this.reasonBackSecondary,
    this.idUserBack,
    this.descReasonBack,
    this.dateChangeBack,
    this.valueBack,
    this.typeBack,
    this.fileReject,
    this.approveBackDone,
    this.dateBackNow,
    this.rateProduct,
    this.rateSupport,
    this.rateSales,
    this.idRequest,
  });

  factory WithdrawnDetailsModel.fromJson(Map<String, dynamic> json) => WithdrawnDetailsModel(
        nameUser: json["nameUser"],
        reasonBack: json["reason_back"],
        reasonBackPrimary: json['reason_back_primary'] == null ? [] : List.of(json['reason_back_primary']).map((e) => e.toString()).toList(),
        reasonBackSecondary: json['reason_back_secondary'] == null ? [] : List.of(json['reason_back_secondary']).map((e) => e.toString()).toList(),
        idUserBack: json["fkuser_back"] == null ? null : json["fkuser_back"].toString(),
        descReasonBack: json["desc_reason_back"],
        dateChangeBack: json["date_change_back"],
        valueBack: json["value_back"] == null ? null : json["value_back"].toString(),
        typeBack: json["type_back"],
        fileReject: json["file_reject"],
        approveBackDone: json["approve_back_done"] == null ? null : json["approve_back_done"].toString(),
        dateBackNow: json["date_back_now"],
        rateProduct: json['rate_product'],
        rateSupport: json['rate_support'],
        rateSales: json['rate_sales'],
        idRequest: json['id_request'] == null ? null : json['id_request'].toString(),
      );

  WithdrawnDetailsModel copyWith({
    String? nameUser,
    String? reasonBack,
    String? idUserBack,
    String? descReasonBack,
    String? dateChangeBack,
    String? valueBack,
    String? typeBack,
    String? fileReject,
    String? approveBackDone,
    String? dateBackNow,
    String? rateProduct,
    String? rateSales,
    String? rateSupport,
    String? idRequest,
    List<String>? reasonBackPrimary,
    List<String>? reasonBackSecondary,
  }) {
    return WithdrawnDetailsModel(
      nameUser: nameUser ?? this.nameUser,
      reasonBack: reasonBack ?? this.reasonBack,
      idUserBack: idUserBack ?? this.idUserBack,
      descReasonBack: descReasonBack ?? this.descReasonBack,
      dateChangeBack: dateChangeBack ?? this.dateChangeBack,
      valueBack: valueBack ?? this.valueBack,
      typeBack: typeBack ?? this.typeBack,
      fileReject: fileReject ?? this.fileReject,
      approveBackDone: approveBackDone ?? this.approveBackDone,
      dateBackNow: dateBackNow ?? this.dateBackNow,
      rateProduct: rateProduct ?? this.rateProduct,
      rateSales: rateSales ?? this.rateSales,
      rateSupport: rateSupport ?? this.rateSupport,
      idRequest: idRequest ?? this.idRequest,
      reasonBackPrimary: reasonBackPrimary ?? this.reasonBackPrimary,
      reasonBackSecondary: reasonBackSecondary ?? this.reasonBackSecondary,
    );
  }
}
