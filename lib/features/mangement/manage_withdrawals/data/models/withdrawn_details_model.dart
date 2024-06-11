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

  WithdrawnDetailsModel({
    this.nameUser,
    this.reasonBack,
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
  });

  factory WithdrawnDetailsModel.fromJson(Map<String, dynamic> json) =>
      WithdrawnDetailsModel(
        nameUser: json["nameUser"],
        reasonBack: json["reason_back"],
        idUserBack: json["fkuser_back"],
        descReasonBack: json["desc_reason_back"],
        dateChangeBack: json["date_change_back"],
        valueBack: json["value_back"],
        typeBack: json["type_back"],
        fileReject: json["file_reject"],
        approveBackDone: json["approve_back_done"],
        dateBackNow: json["date_back_now"],
        rateProduct: json['rate_product'],
        rateSupport: json['rate_support'],
        rateSales: json['rate_sales'],
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
    );
  }
}
