class ClientDeptModel {
  final int? idClients;
  final String? nameClient;
  final String? nameEnterprise;
  final dynamic typeJob;
  final String? city;
  final String? location;
  final String? fkRegoin;
  final DateTime? dateCreate;
  final dynamic receivedDate;
  final String? typeClient;
  final String? fkUser;
  final dynamic dateReceived;
  final dynamic dateTransfer;
  final dynamic fkusertrasfer;
  final String? mobile;
  final String? sourcclient;
  final dynamic tag;
  final String? priority;
  final dynamic typeRecord;
  final String? reasonClass;
  final String? typeClassification;
  final String? nameCountry;
  final String? nameRegoin;
  final String? nameUser;
  final String? mobileUser;
  final int? totalPaid;
  final double? totalInvoices;
  final double? remaining;
  final List<Payment>? payments;

  ClientDeptModel({
    this.idClients,
    this.nameClient,
    this.nameEnterprise,
    this.typeJob,
    this.city,
    this.location,
    this.fkRegoin,
    this.dateCreate,
    this.receivedDate,
    this.typeClient,
    this.fkUser,
    this.dateReceived,
    this.dateTransfer,
    this.fkusertrasfer,
    this.mobile,
    this.sourcclient,
    this.tag,
    this.priority,
    this.typeRecord,
    this.reasonClass,
    this.typeClassification,
    this.nameCountry,
    this.nameRegoin,
    this.nameUser,
    this.mobileUser,
    this.totalPaid,
    this.totalInvoices,
    this.remaining,
    this.payments,
  });

  ClientDeptModel copyWith({
    int? idClients,
    String? nameClient,
    String? nameEnterprise,
    dynamic typeJob,
    String? city,
    String? location,
    String? fkRegoin,
    DateTime? dateCreate,
    dynamic receivedDate,
    String? typeClient,
    String? fkUser,
    dynamic dateReceived,
    dynamic dateTransfer,
    dynamic fkusertrasfer,
    String? mobile,
    String? sourcclient,
    dynamic tag,
    String? priority,
    dynamic typeRecord,
    String? reasonClass,
    String? typeClassification,
    String? nameCountry,
    String? nameRegoin,
    String? nameUser,
    String? mobileUser,
    int? totalPaid,
    double? totalInvoices,
    double? remaining,
    List<Payment>? payments,
  }) =>
      ClientDeptModel(
        idClients: idClients ?? this.idClients,
        nameClient: nameClient ?? this.nameClient,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
        typeJob: typeJob ?? this.typeJob,
        city: city ?? this.city,
        location: location ?? this.location,
        fkRegoin: fkRegoin ?? this.fkRegoin,
        dateCreate: dateCreate ?? this.dateCreate,
        receivedDate: receivedDate ?? this.receivedDate,
        typeClient: typeClient ?? this.typeClient,
        fkUser: fkUser ?? this.fkUser,
        dateReceived: dateReceived ?? this.dateReceived,
        dateTransfer: dateTransfer ?? this.dateTransfer,
        fkusertrasfer: fkusertrasfer ?? this.fkusertrasfer,
        mobile: mobile ?? this.mobile,
        sourcclient: sourcclient ?? this.sourcclient,
        tag: tag ?? this.tag,
        priority: priority ?? this.priority,
        typeRecord: typeRecord ?? this.typeRecord,
        reasonClass: reasonClass ?? this.reasonClass,
        typeClassification: typeClassification ?? this.typeClassification,
        nameCountry: nameCountry ?? this.nameCountry,
        nameRegoin: nameRegoin ?? this.nameRegoin,
        nameUser: nameUser ?? this.nameUser,
        mobileUser: mobileUser ?? this.mobileUser,
        totalPaid: totalPaid ?? this.totalPaid,
        totalInvoices: totalInvoices ?? this.totalInvoices,
        remaining: remaining ?? this.remaining,
        payments: payments ?? this.payments,
      );

  factory ClientDeptModel.fromJson(Map<String, dynamic> json) => ClientDeptModel(
    idClients: json["id_clients"],
    nameClient: json["name_client"],
    nameEnterprise: json["name_enterprise"],
    typeJob: json["type_job"],
    city: json["city"],
    location: json["location"],
    fkRegoin: json["fk_regoin"],
    dateCreate: json["date_create"] == null ? null : DateTime.parse(json["date_create"]),
    receivedDate: json["received_date"],
    typeClient: json["type_client"],
    fkUser: json["fk_user"],
    dateReceived: json["date_received"],
    dateTransfer: json["date_transfer"],
    fkusertrasfer: json["fkusertrasfer"],
    mobile: json["mobile"],
    sourcclient: json["sourcclient"],
    tag: json["tag"],
    priority: json["priority"],
    typeRecord: json["type_record"],
    reasonClass: json["reason_class"],
    typeClassification: json["type_classification"],
    nameCountry: json["nameCountry"],
    nameRegoin: json["name_regoin"],
    nameUser: json["nameUser"],
    mobileUser: json["mobileUser"],
    totalPaid: json["total_paid"],
    totalInvoices: json["total_invoices"]?.toDouble(),
    remaining: json["remaining"]?.toDouble(),
    payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_clients": idClients,
    "name_client": nameClient,
    "name_enterprise": nameEnterprise,
    "type_job": typeJob,
    "city": city,
    "location": location,
    "fk_regoin": fkRegoin,
    "date_create": dateCreate?.toIso8601String(),
    "received_date": receivedDate,
    "type_client": typeClient,
    "fk_user": fkUser,
    "date_received": dateReceived,
    "date_transfer": dateTransfer,
    "fkusertrasfer": fkusertrasfer,
    "mobile": mobile,
    "sourcclient": sourcclient,
    "tag": tag,
    "priority": priority,
    "type_record": typeRecord,
    "reason_class": reasonClass,
    "type_classification": typeClassification,
    "nameCountry": nameCountry,
    "name_regoin": nameRegoin,
    "nameUser": nameUser,
    "mobileUser": mobileUser,
    "total_paid": totalPaid,
    "total_invoices": totalInvoices,
    "remaining": remaining,
    "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x.toJson())),
  };
}

class Payment {
  final int? id;
  final int? fkInvoice;
  final DateTime? paymentDate;
  final DateTime? dateUpdatePayment;
  final String? amountPaid;
  final String? nameUser;
  final int? paymentIdAdd;
  final dynamic isDoneInstall;
  final dynamic api;
  final int? laravelThroughKey;

  Payment({
    this.id,
    this.fkInvoice,
    this.paymentDate,
    this.dateUpdatePayment,
    this.amountPaid,
    this.nameUser,
    this.paymentIdAdd,
    this.isDoneInstall,
    this.api,
    this.laravelThroughKey,
  });

  Payment copyWith({
    int? id,
    int? fkInvoice,
    DateTime? paymentDate,
    DateTime? dateUpdatePayment,
    String? amountPaid,
    String? nameUser,
    int? paymentIdAdd,
    dynamic isDoneInstall,
    dynamic api,
    int? laravelThroughKey,
  }) =>
      Payment(
        id: id ?? this.id,
        fkInvoice: fkInvoice ?? this.fkInvoice,
        paymentDate: paymentDate ?? this.paymentDate,
        dateUpdatePayment: dateUpdatePayment ?? this.dateUpdatePayment,
        amountPaid: amountPaid ?? this.amountPaid,
        nameUser: nameUser ?? this.nameUser,
        paymentIdAdd: paymentIdAdd ?? this.paymentIdAdd,
        isDoneInstall: isDoneInstall ?? this.isDoneInstall,
        api: api ?? this.api,
        laravelThroughKey: laravelThroughKey ?? this.laravelThroughKey,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    fkInvoice: json["fk_invoice"],
    paymentDate: json["payment_date"] == null ? null : DateTime.parse(json["payment_date"]),
    dateUpdatePayment: json["date_updatePayment"] == null ? null : DateTime.parse(json["date_updatePayment"]),
    amountPaid: json["amount_paid"],
    nameUser: json["nameUser"],
    paymentIdAdd: json["payment_idAdd"],
    isDoneInstall: json["is_done_install"],
    api: json["api"],
    laravelThroughKey: json["laravel_through_key"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fk_invoice": fkInvoice,
    "payment_date": paymentDate?.toIso8601String(),
    "date_updatePayment": dateUpdatePayment?.toIso8601String(),
    "amount_paid": amountPaid,
    "nameUser": nameUser,
    "payment_idAdd": paymentIdAdd,
    "is_done_install": isDoneInstall,
    "api": api,
    "laravel_through_key": laravelThroughKey,
  };
}
